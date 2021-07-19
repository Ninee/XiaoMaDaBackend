<?php

namespace App\Admin\Controllers;

use App\Models\HotRank;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class HotRankController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '红人榜';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new HotRank());

//        $grid->column('id', __('Id'));
        $grid->column('sort', __('排序'))->editable();
        $grid->column('nickname', __('昵称'));
        $grid->column('avatar', __('头像'))->image();
        $grid->column('gender', __('性别'))->using([
            1 => '男',
            2 => '女'
        ]);
//        $grid->column('role', __('Role'));
//        $grid->column('intro', __('Intro'));
        $grid->column('fans', __('粉丝数'));
        $grid->column('red_book_link', __('小红书链接'));
        $grid->column('red_book_fans', __('小红书粉丝'));
        $grid->column('douyin_link', __('抖音链接'));
        $grid->column('douyin_fans', __('抖音粉丝'));
        $grid->column('created_at', __('创建时间'));
        $grid->actions(function ($actions) use ($grid) {
            // 去掉删除
//            $actions->disableDelete();
//            // 去掉编辑
//            $actions->disableEdit();
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
        $show = new Show(HotRank::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('nickname', __('Nickname'));
        $show->field('avatar', __('Avatar'));
        $show->field('gender', __('Gender'));
        $show->field('role', __('Role'));
        $show->field('intro', __('Intro'));
        $show->field('fans', __('Fans'));
        $show->field('red_book_link', __('Red book link'));
        $show->field('red_book_fans', __('Red book fans'));
        $show->field('douyin_link', __('Douyin link'));
        $show->field('douyin_fans', __('Douyin fans'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('sort', __('Sort'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new HotRank());

        $form->text('nickname', __('昵称'));
        $form->image('avatar', __('头像'));
        $form->radio('gender', __('性别'))->options([
            '1' => '男',
            '2' => '女'
        ])->default(1);
        $form->hidden('role', __('Role'))->default(1);
        $form->textarea('intro', __('简介'));
        $form->number('fans', __('粉丝数'));
        $form->text('red_book_link', __('小红书链接'));
        $form->number('red_book_fans', __('小红书粉丝'));
        $form->text('douyin_link', __('抖音链接'));
        $form->number('douyin_fans', __('抖音粉丝'));
        $form->number('sort', __('排序'));
        $form->hasMany('opus', '作品', function (Form\NestedForm $form) {

            $form->radio('media_type', '媒体类型')
                ->options([
                    'image' => '图片',
                    'video' => '视频',
                ])->default('image');
            $form->file('uri', '媒体文件')->required();
            $form->image('thumb', '视频封面');
        });

        return $form;
    }
}
