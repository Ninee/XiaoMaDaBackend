<?php

namespace App\Admin\Controllers;

use App\User;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class UserController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '用户管理';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new User());
        $grid->model()->where('role', 1)->orderBy('id', 'desc');
        $grid->disableCreateButton();

        $grid->column('id', __('Id'));
        $grid->column('nickname', __('昵称'));
        $grid->column('avatar', __('头像'))->image('', 100, 100);
        $grid->column('mobile', __('手机号'));
//        $grid->column('name', __('姓名'));
        $grid->column('gender', __('性别'))->using([
            1 => '男',
            2 => '女',
            0 => '未知'
        ]);
        $grid->column('role', __('角色'))->using([
            User::ROLE_MEMBER => '会员',
            User::ROLE_VIEWER => '游客'
        ]);
        $grid->column('is_player', __('是否参赛选手'))->using([
            0 => '否',
            1 => '是'
        ]);
        $grid->disableActions();
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
        $show = new Show(User::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('name', __('Name'));
        $show->field('email', __('Email'));
        $show->field('password', __('Password'));
        $show->field('remember_token', __('Remember token'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('mobile', __('Mobile'));
        $show->field('openid', __('Openid'));
        $show->field('nickname', __('Nickname'));
        $show->field('avatar', __('Avatar'));
        $show->field('gender', __('Gender'));
        $show->field('role', __('Role'));
        $show->field('is_player', __('Is player'));
        $show->field('intro', __('Intro'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new User());

        $form->text('name', __('Name'));
        $form->email('email', __('Email'));
        $form->password('password', __('Password'));
        $form->text('remember_token', __('Remember token'));
        $form->mobile('mobile', __('Mobile'));
        $form->text('openid', __('Openid'));
        $form->text('nickname', __('Nickname'));
        $form->image('avatar', __('Avatar'));
        $form->switch('gender', __('Gender'));
        $form->switch('role', __('Role'));
        $form->switch('is_player', __('Is player'));
        $form->textarea('intro', __('Intro'));

        return $form;
    }
}
