<?php

namespace App\Admin\Controllers;

use App\Models\MatchZone;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class MatchZoneController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '赛区管理';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new MatchZone());

        $grid->column('id', __('Id'));
        $grid->column('name', __('赛区名称'));
        $grid->column('wechat_qrcode', __('负责人微信二维码'))->image();
//        $grid->column('created_at', __('Created at'));
//        $grid->column('updated_at', __('Updated at'));

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
        $show = new Show(MatchZone::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('name', __('Name'));
        $show->field('wechat_qrcode', __('Wechat qrcode'));
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
        $form = new Form(new MatchZone());

        $form->text('name', __('赛区名称'));
        $form->image('wechat_qrcode', __('负责人微信二维码'))->uniqueName();

        return $form;
    }
}
