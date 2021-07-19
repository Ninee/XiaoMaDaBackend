<?php

namespace App\Http\Controllers\Api;

use App\Models\Order;
use App\Models\OrderGoods;
use App\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Carbon;

class PaymentController extends Controller
{
    public function wechat()
    {
        $app = \EasyWeChat::payment();
        $response = $app->handlePaidNotify(function($message, $fail){
            // 使用通知里的 "微信支付订单号" 或者 "商户订单号" 去自己的数据库找到订单
            $order = Order::where([
                'order_id' => $message['out_trade_no'],
                'status' => Order::STATUS_UNPAY
            ])->first();

            if (!$order) { // 如果订单不存在 或者 订单已经支付过了
                return true; // 告诉微信，我已经处理完了，订单没找到，别再通知我了
            }

            ///////////// <- 建议在这里调用微信的【订单查询】接口查一下该笔订单的情况，确认是已经支付 /////////////

            if ($message['return_code'] === 'SUCCESS') { // return_code 表示通信状态，不代表支付状态
                // 用户是否支付成功
                if (array_get($message, 'result_code') === 'SUCCESS') {
//                    $order->paid_at = time(); // 更新支付时间为当前时间
                    $order->status = Order::STATUS_PAID;

                    //如果是购买会员
                    $user = $order->user;
                    $goods = $order->goods;
                    foreach ($goods as $goodsItem) {
                        switch ($goodsItem->goods_type) {
                            case OrderGoods::GOODS_TYPE_VIP:
                                if ($user->role) {
                                    $startDate = $user->role_expired_at;
                                    $endDate = Carbon::createFromFormat('Y-m-d H:i:s', $this->role_expired_at)->addDays(365);
                                } else {
                                    $startDate = Carbon::now();
                                    $endDate = Carbon::now()->addDays(365);
                                }
                                $user->role = User::ROLE_MEMBER;
                                $user->role_expired_at = $endDate;
                                $user->save();
                                break;
                        }
                    }
                    // 用户支付失败
                } elseif (array_get($message, 'result_code') === 'FAIL') {
                    $order->status = Order::STATUS_UNPAY;
                }
            } else {
                return $fail('通信失败，请稍后再通知我');
            }

            $order->save(); // 保存订单

            return true; // 返回处理完成
        });

        return $response;
    }
}
