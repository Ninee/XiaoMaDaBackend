<?php

namespace App\Admin\Controllers;

use App\Models\GoodSource;
use App\Models\RequireType;
use App\Models\TabMenu;
use App\Models\Task;
use App\Models\Track;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class MatchTaskController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '比赛任务';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Task());
        $grid->model()->where('task_type','>', 2)->orderBy('id', 'desc');
        $grid->column('id', __('Id'));
        $grid->column('track_id', __('赛道'))->using(Track::all()->pluck('name', 'id')->toArray());
//        $grid->column('user_id', __('发布者'));
        $grid->column('task_type', '任务类型')->using(['3' => '初赛', '4' => '复赛'])->label([
            3 => 'info',
            4 => 'success'
        ]);
        $grid->column('good_img', __('商品图片'))->image();
        $grid->column('good_name', __('商品名称'));
//        $grid->column('source.name', __('所属电商平台'));
//        $grid->column('buy_address', __('购买地址'));
        $grid->column('good_price', __('商品价格'));
        $grid->column('coupon', __('优惠券金额'));
        $grid->column('reward', __('佣金'));
        $grid->column('created_at', __('发布时间'));

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
        $show = new Show(Task::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('user_id', __('User id'));
        $show->field('good_img', __('Good img'));
        $show->field('good_name', __('Good name'));
        $show->field('good_source', __('Good source'));
        $show->field('buy_address', __('Buy address'));
        $show->field('good_price', __('Good price'));
        $show->field('coupon', __('Coupon'));
        $show->field('reward', __('Reward'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('task_type', __('Task type'));
        $show->field('require_type_id', __('Require type id'));
        $show->field('task_desc', __('Task desc'));
        $show->field('limit_number', __('Limit number'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Task());

        $form->hidden('user_id', __('User id'))->value(0);
        $form->select('track_id', '所属赛道')->options(Track::all()->pluck('name', 'id'));
        $form->image('good_img', __('商品照片'))->uniqueName();
        $form->text('good_name', __('商品名称'));
        $form->select('tab_menu_id', __('商品类目'))->options(TabMenu::all()->pluck('name', 'id'));
        $form->select('good_source', __('电商平台'))->options(GoodSource::all()->pluck('name', 'id'));
        $form->textarea('buy_address', __('购买地址'));
        $form->decimal('good_price', __('商品价格'));
        $form->number('coupon', __('优惠券金额'));
        $form->number('reward', __('佣金'));
        $form->select('require_type_id', '任务类型')->options(RequireType::all()->pluck('title', 'id'));
        $form->UEditor('task_desc', '任务描述');
        $form->radio('task_type', '任务要求等级')->options(['3' => '初赛', '4' => '复赛'])->default('3');
        $form->number('limit_number', '申请人数数量');
        $form->radio('mode', '模式')->options(Task::TASK_MODE_TXT);
        return $form;
    }
}
