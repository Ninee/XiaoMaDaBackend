<?php

namespace App\Http\Controllers;

use App\About;
use App\Banner;
use App\Exceptions\ApiException;
use App\Http\Requests\SMSRequest;
use App\Lib\ErpClient;
use App\Models\Opus;
use App\Models\SmsCode;
use App\Lib\DamaiClient;
use App\Models\Order;
use App\User;
use Illuminate\Http\Request;
use Mockery\CountValidator\Exception;
use Overtrue\EasySms\EasySms;
use Overtrue\EasySms\Exceptions\NoGatewayAvailableException;

class CommonController extends Controller
{
    public function sendSMS(SMSRequest $request)
    {
        $config = [
            // HTTP 请求的超时时间（秒）
            'timeout' => 5.0,

            // 默认发送配置
            'default' => [
                // 网关调用策略，默认：顺序调用
                'strategy' => \Overtrue\EasySms\Strategies\OrderStrategy::class,

                // 默认可用的发送网关
                'gateways' => [
                    'submail',
                ],
            ],
            // 可用的网关配置
            'gateways' => [
                'errorlog' => [
                    'file' => '/home/wwwlogs/easy-sms.log',
                ],
                'submail' => [
                    'app_id' => '38066',
                    'app_key' => 'f5ac3cb306b7ace57df9f60f19d0c5ad',
                    'project' => 'UwUWK1', // 默认 project，可在发送时 data 中指定
                ],
            ],
        ];
        $easySms = new EasySms($config);
        $code = rand(1000, 9999);
        try {
            $easySms->send($request->mobile, [
                'data' => [
                    'code' => $code,
                    'time' => '5分钟',
                ],
            ]);

        } catch (NoGatewayAvailableException $e) {
            throw new ApiException('短信验证码发送失败');
        }
        SmsCode::updateOrCreate(['mobile' => $request->mobile], ['code' => $code]);
        return json_response([], '发送成功');
    }

    public function configs()
    {
        return json_response(config('cities')['cities']);
    }

    public function about()
    {
        return json_response(About::find(1));
    }

    public function updateOrder(Request $request)
    {
        $order = Order::where('damai_order_id', $request->orderId)->first();
        if ($order) {
            $order->ship_name = $request->shipName;
            $order->ship_num = $request->shipNum;
            $order->save();
            return json_encode([
                "Status" => "1",
                "Msg" => "successful"
            ]);
        } else {
            return json_encode([
                "Status" => "0",
                "Msg" => "没有找到相应订单"
            ], JSON_UNESCAPED_UNICODE);
        }

    }

    public function banners()
    {
        $banner = Banner::all();
        return json_response(compact('banner'));
    }
}
