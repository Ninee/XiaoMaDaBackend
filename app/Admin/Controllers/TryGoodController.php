<?php

namespace App\Admin\Controllers;

use App\Models\TryGood;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class TryGoodController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '大牌试用';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new TryGood());

        $grid->column('id', __('Id'));
        $grid->column('img', __('图片'))->image();
        $grid->column('name', __('商品名称'));
        $grid->column('limit_num', __('限量'));
        $grid->column('price', __('现价'));
        $grid->column('old_price', __('原价'));
        $grid->column('status', __('状态'))->using([
            1 => '上架',
            0 => '下架'
        ]);
        $grid->column('created_at', __('创建时间'));
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
        $show = new Show(TryGood::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('img', __('Img'));
        $show->field('name', __('Name'));
        $show->field('limit_num', __('Limit num'));
        $show->field('price', __('Price'));
        $show->field('old_price', __('Old price'));
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
        $form = new Form(new TryGood());

        $form->image('img', __('商品图片'))->uniqueName()->required();
        $form->text('name', __('商品名称'))->required();
        $form->number('limit_num', __('限量'))->required();
        $form->decimal('price', __('现价'))->required();
        $form->decimal('old_price', __('原价'))->required();
        $form->UEditor('detail', '详情');
        $form->radio('status', '是否上架')->options([
            1 => '上架',
            0 => '下架'
        ])->default(1);

        return $form;
    }
}
