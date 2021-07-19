<?php

namespace App\Admin\Controllers;

use App\Models\GoodSource;
use App\Models\Platform;
use App\Models\RequireType;
use App\Models\TabMenu;
use App\Models\Task;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class TaskController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '任务';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Task());
        $grid->model()->where('task_type','<', 3)->orderBy('id', 'desc');
        $grid->column('id', __('Id'));
//        $grid->column('user_id', __('发布者'));
        $grid->column('task_type', '任务要求等级')->using(['2' => '会员', '1'=> '体验'])->label([
            1 => 'default',
            2 => 'success',
        ]);
        $grid->column('require_type_id', '任务类型')->using(RequireType::all()->pluck('title', 'id')->toArray());
        $grid->column('platform_id', '平台')->using(Platform::all()->pluck('name', 'id')->toArray());
        $grid->filter(function($filter){

            // 去掉默认的id过滤器
            $filter->disableIdFilter();

//            $filter->scope('trashed', '回收站')->onlyTrashed();

            // 在这里添加字段过滤器
            $filter->equal('task_type', '任务要求等级')->radio([
                ''   => '全部',
                1    => '体验',
                2    => '会员',
            ]);
            $filter->like('good_name', '商品名称');
        });
        $grid->actions(function ($actions) {

//            // 去掉删除
//            $actions->disableDelete();
//
//            // 去掉编辑
//            $actions->disableEdit();

            // 去掉查看
            $actions->disableView();
        });
        $grid->column('good_img', __('商品图片'))->image();
        $grid->column('good_name', __('商品名称'));
        $grid->column('source.name', __('所属电商平台'));
        $grid->column('buy_address', __('购买地址'));
        $grid->column('good_price', __('商品价格'));
        $grid->column('coupon', __('优惠券金额'));
        $grid->column('reward', __('佣金'));
        $grid->column('created_at', __('发布时间'));
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
        $form->image('good_img', __('商品照片'))->uniqueName();
        $form->text('good_name', __('商品名称'));
        $form->select('tab_menu_id', __('商品类目'))->options(TabMenu::all()->pluck('name', 'id'));
        $form->select('good_source', __('电商平台'))->options(GoodSource::all()->pluck('name', 'id'));
        $form->textarea('buy_address', __('购买地址'));
        $form->decimal('good_price', __('商品价格'));
//        $form->number('coupon', __('优惠券金额'));

        $form->rate('sale_rate', __('分销佣金比例'));
        $form->decimal('reward', __('任务佣金'));
        $form->select('platform_id', '平台类型')->options(Platform::all()->pluck('name', 'id'));
        $form->number('require_fans', '粉丝数要求')->default(0);
        $form->select('require_type_id', '任务类型')->options(RequireType::all()->pluck('title', 'id'));
        $form->UEditor('task_desc', '任务描述');
        $form->radio('task_type', '任务要求等级')->options(['2' => '会员', '1'=> '体验'])->default('2');
        $form->number('limit_number', '申请人数数量')->default(1);
        $form->radio('mode', '模式')->options(Task::TASK_MODE_TXT);
        return $form;
    }
}
