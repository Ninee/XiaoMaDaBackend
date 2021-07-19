<?php

namespace App\Admin\Controllers;

use App\Models\MatchSetting;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\MessageBag;

class MatchSettingController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '比赛设置';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new MatchSetting());

        $grid->column('id', __('Id'));
        $grid->column('pre_start', __('Pre start'));
        $grid->column('pre_end', __('Pre end'));
        $grid->column('pre_fans', __('Pre fans'));
        $grid->column('final_start', __('Final start'));
        $grid->column('final_end', __('Final end'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));

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
        $show = new Show(MatchSetting::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('pre_start', __('Pre start'));
        $show->field('pre_end', __('Pre end'));
        $show->field('pre_fans', __('Pre fans'));
        $show->field('final_start', __('Final start'));
        $show->field('final_end', __('Final end'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new MatchSetting());
        $form->datetimeRange('pre_start', 'pre_end', '初赛时间');
        $form->number('pre_fans', __('初赛粉丝要求'));
        $form->datetimeRange('final_start', 'final_end', '复赛时间');
        $form->UEditor('rules', '比赛规则');

        $form->tools(function (Form\Tools $tools) {

            // 去掉`列表`按钮
            $tools->disableList();

            // 去掉`删除`按钮
            $tools->disableDelete();

            // 去掉`查看`按钮
            $tools->disableView();
        });
        $form->footer(function ($footer) {

            // 去掉`重置`按钮
            $footer->disableReset();

            // 去掉`查看`checkbox
            $footer->disableViewCheck();

            // 去掉`继续编辑`checkbox
            $footer->disableEditingCheck();

            // 去掉`继续创建`checkbox
            $footer->disableCreatingCheck();

        });
        //保存后回调
        $form->saved(function (Form $form) {
            $success = new MessageBag([
                'title'   => '提示',
                'message' => '保存成功',
            ]);

            return back()->with(compact('success'));
        });

        return $form;
    }
}
