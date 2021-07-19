<?php

namespace App\Http\Controllers\Api;

use App\Address;
use App\Models\Order;
use App\Models\OrderGoods;
use App\Models\Setting;
use App\Models\TryGood;
use App\Models\VipGood;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class OrderController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api');
    }

    public function checkout(Request $request) {
        $user = Auth::user();
        $setting = Setting::find(1);
        if ($request->type == OrderGoods::GOODS_TYPE_VIP) {
            $good = VipGood::find($request->good_id);
            $good->charge = $setting->member_fee;
        }
        //大牌试用
        if ($request->type == OrderGoods::GOODS_TYPE_TRY) {
            $good = TryGood::find($request->good_id);
            $good->charge = $good->price;
        }
        if ($request->address_id) {
            $address = Address::find($request->address_id);
        } else {
            $address = Address::where('user_id', $user->id)->where('is_deleted', 0)->orderBy('id', 'desc')->first();
        }

        return json_response(['good' => $good, 'address' => $address], '');
    }

    public function submit(Request $request)
    {
        $user = Auth::user();
//        if (
//            $user->role &&
//            strtotime($user->role_expired_at) > time() &&
//            $user->role->weight != $role->weight
//        ) {
//            $this->errors = '您的账户下面已经有会员啦';
//
//            return false;
//        }

        //购买会员
        if ($request->type == OrderGoods::GOODS_TYPE_VIP) {
            $good = VipGood::find($request->good_id);
            $setting = Setting::find(1);
            $good->charge = $setting->member_fee;
        }
        //大牌试用
        if ($request->type == OrderGoods::GOODS_TYPE_TRY) {
            $good = TryGood::find($request->good_id);
            $good->charge = $good->price;
        }

        DB::beginTransaction();

        try {
            // 创建订单
            $order = $user->orders()->save(new Order([
                'order_id' => gen_order_no($user),
                'address_id' => $request->address_id,
                'charge' => $good->charge,
                'category' => $request->type,
                'status' => Order::STATUS_UNPAY,
            ]));
            // 关联商品
            $order->goods()->save(new OrderGoods([
                'user_id' => $user->id,
                'goods_id' => $good->id,
                'goods_type' => $request->type,
                'num' => 1,
                'charge' => $good->charge,
            ]));

            DB::commit();
            return json_response(['orderId' => $order->id], '创建订单成功');
        } catch (Exception $exception) {
            DB::rollBack();

            return json_response([], '创建订单失败', 5001);
        }
    }

    public function prepay(Request $request)
    {
        $user = Auth::user();
        $order = Order::find($request->orderId);

        $payment =  \EasyWeChat::payment();
        $jssdk = $payment->jssdk;

        $result = $payment->order->unify([
            'body' => 'V喵商品购买',
            'out_trade_no' => $order->order_id,
            'total_fee' => $order->charge * 100,   //单位为分,需要换成元
            'trade_type' => 'JSAPI', // 请对应换成你的支付方式对应的值类型
            'openid' => $user->openid,
        ]);

        if (key_exists('result_code', $result) && $result['result_code'] == 'SUCCESS') {
            $config = $jssdk->bridgeConfig($result['prepay_id'], false); // 返回数组
            return json_response($config);
        } else {
            return json_response($result, $result['err_code_des'], 70001);
        }

    }

    public function getGoodInfo(Order $order)
    {

    }

    public function orderList(Request $request)
    {
        $user = Auth::user();
        $index = $request->showType;
        $limit = $request->limit;

        $list = [];
        switch ($index) {
            case 0:
                $list = Order::where('user_id', $user->id)->orderBy('id', 'desc')->paginate($limit);
                break;
            case 1:
                $list = Order::where([
                    ['user_id', '=', $user->id],
                    ['status', '=', Order::STATUS_UNPAY],
                ])->orderBy('id', 'desc')->paginate($limit);
                break;
            case 2:
                $list = Order::where([
                    ['user_id', '=', $user->id],
                    ['status', '=', Order::STATUS_PAID],
                ])->orderBy('id', 'desc')->paginate($limit);
                break;
            case 3:
                $list = Order::where([
                    ['user_id', '=', $user->id],
                    ['status', '=', Order::STATUS_DELIVER],
                ])->orderBy('id', 'desc')->paginate($limit);
                break;
            default:
                break;
        }
        return json_response($list);
    }
}