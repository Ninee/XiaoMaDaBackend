<?php

namespace App\Admin\Controllers;

use App\Models\MatchEnroll;
use App\Models\MatchZone;
use App\Models\Track;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class MatchEnrollController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '比赛报名';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new MatchEnroll());

        $grid->model()->orderBy('id', 'desc');
        $grid->column('id', __('Id'));
//        $grid->column('user_id', __('User id'));
        $grid->column('name', __('姓名'));
        $grid->column('phone', __('手机号'));
        $grid->column('zone.name', __('赛区'));
        $grid->column('track.name', __('赛道'));
        $grid->column('created_at', __('报名时间'));

        $grid->filter(function($filter){

            // 去掉默认的id过滤器
            $filter->disableIdFilter();

//            $filter->scope('trashed', '回收站')->onlyTrashed();
            $filter->in('zone_id', '赛区')->checkbox(MatchZone::all()->pluck('name', 'id'));
            $filter->in('track_id', '赛道')->checkbox(Track::all()->pluck('name', 'id'));

        });

        $grid->actions(function ($actions) use ($grid) {
            // 去掉删除
            $actions->disableDelete();
            // 去掉编辑
            $actions->disableEdit();
            $row = $actions->row;
            // 去掉查看
            $actions->disableView();
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
        $show = new Show(MatchEnroll::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('user_id', __('User id'));
        $show->field('name', __('Name'));
        $show->field('phone', __('Phone'));
        $show->field('zone_id', __('Zone id'));
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
        $form = new Form(new MatchEnroll());

        $form->number('user_id', __('User id'));
        $form->text('name', __('Name'));
        $form->mobile('phone', __('Phone'));
        $form->number('zone_id', __('Zone id'));

        return $form;
    }
}
