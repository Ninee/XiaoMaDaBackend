<?php

namespace App\Admin\Controllers;

use App\Models\Order;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;

class CashOrderController extends Controller
{
    use HasResourceActions;

    /**
     * Index interface.
     *
     * @param Content $content
     * @return Content
     */
    public function index(Content $content)
    {
        return $content
            ->header('现金兑换记录')
            ->description('列表')
            ->body($this->grid());
    }

    /**
     * Show interface.
     *
     * @param mixed $id
     * @param Content $content
     * @return Content
     */
    public function show($id, Content $content)
    {
        return $content
            ->header('Detail')
            ->description('description')
            ->body($this->detail($id));
    }

    /**
     * Edit interface.
     *
     * @param mixed $id
     * @param Content $content
     * @return Content
     */
    public function edit($id, Content $content)
    {
        return $content
            ->header('Edit')
            ->description('description')
            ->body($this->form()->edit($id));
    }

    /**
     * Create interface.
     *
     * @param Content $content
     * @return Content
     */
    public function create(Content $content)
    {
        return $content
            ->header('Create')
            ->description('description')
            ->body($this->form());
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Order);
        $grid->actions(function ($actions) {
            $actions->disableDelete();
            $actions->disableEdit();
            $actions->disableView();
        });
        $grid->model()->where('type', '=', 3);
        $grid->order_id('订单号');
        $grid->column('提现信息')->display(function () {
            return "姓名:{$this->cash->name} <br>支付宝账号: {$this->cash->account}";
        });
        $grid->charge('金额');
        $states = [
            'off' => ['value' => 1, 'text' => '未打款', 'color' => 'default'],
            'on'  => ['value' => 2, 'text' => '已打款', 'color' => 'primary'],
        ];
        $grid->status('状态')->switch($states);
        $grid->created_at('兑换时间');

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
        $show = new Show(Order::findOrFail($id));

        $show->id('Id');
        $show->user_id('User id');
        $show->order_id('Order id');
        $show->damai_order_id('Damai order id');
        $show->charge('Charge');
        $show->status('Status');
        $show->created_at('Created at');
        $show->updated_at('Updated at');
        $show->type('Type');
        $show->ship_name('Ship name');
        $show->ship_num('Ship num');

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Order);

        $form->text('user_id', 'User id');
        $form->text('order_id', 'Order id');
        $form->text('damai_order_id', 'Damai order id');
        $form->decimal('charge', 'Charge');
        $states = [
            'off' => ['value' => 1, 'text' => '未打款', 'color' => 'default'],
            'on'  => ['value' => 2, 'text' => '已打款', 'color' => 'primary'],
        ];
        $form->switch('status', '状态')->states($states);
        $form->switch('type', 'Type');
        $form->text('ship_name', 'Ship name');
        $form->text('ship_num', 'Ship num');

        return $form;
    }
}
