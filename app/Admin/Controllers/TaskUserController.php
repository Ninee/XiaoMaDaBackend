<?php

namespace App\Admin\Controllers;

use App\Admin\Extensions\GiftExchange;
use App\Admin\Extensions\TaskConfirm;
use App\Events\TaskClearEvent;
use App\Models\RewardRecord;
use App\Models\Setting;
use App\Models\Task;
use App\Models\TaskUser;
use App\Notifications\TaskClear;
use App\User;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\Facades\DB;

class TaskUserController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '用户任务';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new TaskUser());
        $grid->model()->orderBy('id', 'desc');
        $grid->column('id', __('Id'));
        $grid->column('user_id', __('用户'))->display(function ($user_id) {
            $user = User::find($user_id);
            return '<div>' . $user->nickname .'</div>';
        });
        $grid->column('task_id', __('任务'))->display(function ($task_id) {
            $task = Task::find($task_id);
            if ($task) {
                return '<div>' . $task->good_name . '</div>';
            } else {
                return '<div style="color: red;">任务已被删除</div>';
            }
        });
        $grid->column('status', __('任务状态'))->using(Task::TASK_STATUS_TXT)->width(50);
        $grid->column('created_at', __('任务申请时间'));
        $grid->column('shot', __('订单截图'))->image();
        $grid->column('order_sn', __('订单id'));
        $grid->column('publish_link', __('作品发布地址'));
        $grid->column('live_shot', __('直播截图'))->image();
        $grid->column('live_data_shot', __('直播数据截图'))->image();
        $grid->column('clear_type', __('结算方式'));
        $grid->column('is_clear', __('是否已结算'))->using([0 => '否', 1 => '是']);

        $grid->disableCreateButton();

        $grid->actions(function ($actions) use ($grid) {
            // 去掉删除
            $actions->disableDelete();
            // 去掉编辑
            $actions->disableEdit();
            $row = $actions->row;
            // 去掉查看
            $actions->disableView();
            if ($row->is_clear == 0) {
                if ($row->status == Task::TASK_STATUS_APPLY) {
                    $actions->append(new TaskConfirm($actions->getKey()));
                }
                if ($row->status == Task::TASK_STATUS_AUDITING) {
                    $actions->append(new GiftExchange($actions->getKey()));
                }
            }

        });

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(TaskUser::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('user_id', __('User id'));
        $show->field('task_id', __('Task id'));
        $show->field('status', __('Status'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('shot', __('Shot'));
        $show->field('order_sn', __('Order sn'));
        $show->field('publish_link', __('Publish link'));
        $show->field('live_shot', __('Live shot'));
        $show->field('live_data_shot', __('Live data shot'));
        $show->field('clear_type', __('Clear type'));
        $show->field('is_clear', __('Is clear'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new TaskUser());

        $form->number('user_id', __('User id'));
        $form->number('task_id', __('Task id'));
        $form->switch('status', __('Status'));
        $form->text('shot', __('Shot'));
        $form->text('order_sn', __('Order sn'));
        $form->text('publish_link', __('Publish link'));
        $form->text('live_shot', __('Live shot'));
        $form->text('live_data_shot', __('Live data shot'));
        $form->switch('clear_type', __('Clear type'));
        $form->switch('is_clear', __('Is clear'));

        return $form;
    }

    public function clear($id)
    {
        $task_user = TaskUser::where([
            'id' => $id,
            'is_clear' => 0,
        ])->first();
        if (!$task_user) {
            return json_response([], '任务结算失败');
        }
        $task = Task::find($task_user->task_id);
        event(new TaskClearEvent($task_user, $task));
        return json_response([], '结算成功');
    }

    public function confirm($id)
    {
        $task_user = TaskUser::find($id);
        $task_user->status = Task::TASK_STATUS_START;
        $task_user->save();
        return json_response([], '审核通过');
    }
}
