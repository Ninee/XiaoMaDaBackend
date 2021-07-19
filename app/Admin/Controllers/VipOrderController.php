<?php

namespace App\Admin\Controllers;

use App\Address;
use App\Admin\Extensions\DeliverAction;
use App\Models\Order;
use App\Models\OrderGoods;
use App\User;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Http\Request;

class VipOrderController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '会员订单';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Order());

        $grid->model()->where('category', OrderGoods::GOODS_TYPE_VIP)->orderBy('id', 'desc');
        $grid->column('id', __('Id'));
        $grid->column('order_id', __('订单号'));
        $grid->column('user_id', __('用户'))->display(function ($user_id) {
            $user = User::find($user_id);
            return $user->nickname;
        });

        $grid->column('charge', __('金额'));
        $grid->column('status', __('状态'))->using(Order::STATUS_TEXT)->label([
            1 => 'default',
            5 => 'default',
            9 => 'success',
            7 => 'default',
        ]);
        $grid->column('created_at', __('下单时间'));
//
//        $grid->column('payment', __('Payment'));
        $grid->column('address_id', __('地址'))->display(function ($address_id) {
            $address = Address::find($address_id);
            $html = <<<HTML
<div>$address->contact_name</div>
<div>$address->contact_mobile</div>
<div>$address->address_detail</div>
HTML;
            return $html;

        });
        $grid->actions(function ($actions) use ($grid) {
            // 去掉删除
            $actions->disableDelete();
            // 去掉编辑
            $actions->disableEdit();
            $row = $actions->row;
            // 去掉查看
            $actions->disableView();
            // 增加发货按钮
            if ($row->status == Order::STATUS_PAID) {
                $actions->append(new DeliverAction($actions->getKey()));
            }
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
        $show = new Show(Order::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('user_id', __('User id'));
        $show->field('charge', __('Charge'));
        $show->field('status', __('Status'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('deleted_at', __('Deleted at'));
        $show->field('order_id', __('Order id'));
        $show->field('payment', __('Payment'));
        $show->field('address_id', __('Address id'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Order());

        $form->number('user_id', __('User id'));
        $form->decimal('charge', __('Charge'));
        $form->switch('status', __('Status'))->default(1);
        $form->text('order_id', __('Order id'));
        $form->text('payment', __('Payment'));
        $form->number('address_id', __('Address id'));

        return $form;
    }

    public function express(Request $request)
    {
        $id = $request->id;
        $company = $request->company;
        $sn = $request->sn;
        $order = Order::find($id);
        $order->express_company = $company;
        $order->express_sn = $sn;
        $order->status = Order::STATUS_DELIVER;
        $order->save();
        return json_response([], '发货成功');
    }
}
