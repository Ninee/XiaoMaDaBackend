<?php

namespace App\Admin\Controllers;

use App\Admin\Extensions\UpgradeDaren;
use App\UpgradeDarenRecord;
use App\User;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\Carbon;

class VisitorController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '游客';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new User());
        $grid->model()->where('role', 0)->where('is_business', 0)->orderBy('id', 'desc');
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
        $grid->filter(function($filter){
            // 去掉默认的id过滤器
            $filter->disableIdFilter();
            $filter->like('nickname', '昵称');
        });
        $grid->actions(function ($actions) use ($grid) {
            // 去掉删除
            $actions->disableDelete();
            // 去掉编辑
            $actions->disableEdit();
            // 去掉查看
            $actions->disableView();
            $row = $actions->row;
            $actions->append(new UpgradeDaren($actions->getKey()));

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
        $show->field('red_book_link', __('Red book link'));
        $show->field('douyin_link', __('Douyin link'));
        $show->field('red_book_fans', __('Red book fans'));
        $show->field('douyin_fans', __('Douyin fans'));
        $show->field('wechat_id', __('Wechat id'));
        $show->field('reward', __('Reward'));
        $show->field('role_expired_at', __('Role expired at'));
        $show->field('fans', __('Fans'));

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
        $form->text('red_book_link', __('Red book link'));
        $form->text('douyin_link', __('Douyin link'));
        $form->number('red_book_fans', __('Red book fans'));
        $form->number('douyin_fans', __('Douyin fans'));
        $form->text('wechat_id', __('Wechat id'));
        $form->decimal('reward', __('Reward'))->default(0.00);
        $form->datetime('role_expired_at', __('Role expired at'))->default(date('Y-m-d H:i:s'));
        $form->number('fans', __('Fans'));

        return $form;
    }

    public function upgrade($id)
    {
        $user = User::find($id);
        if ($user->role == User::ROLE_MEMBER) {
            $endDate = Carbon::createFromFormat('Y-m-d H:i:s', $this->role_expired_at)->addDays(365);
        } else {
            $endDate = Carbon::now()->addDays(365);
        }
        $user->role = User::ROLE_MEMBER;
        $user->role_expired_at = $endDate;
        $user->save();
        //记录操作
        $record = new UpgradeDarenRecord();
        $record->admin_id = Admin::user()->id;
        $record->user_id = $id;
        $record->save();
        return json_response([], '升级成功');
    }
}
