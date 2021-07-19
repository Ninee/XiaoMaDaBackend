<?php

namespace App\Http\Controllers\Api;

use App\Address;
use App\Cash;
use App\Exceptions\ApiException;
use App\Lib\DamaiClient;
use App\Lib\ErpClient;
use App\Models\AlipayRecord;
use App\Models\Opus;
use App\Models\RewardRecord;
use App\Models\Setting;
use App\Models\Shiming;
use App\Models\Task;
use App\Models\TaskUser;
use App\Models\Order;
use App\Models\WithdrawRecord;
use App\Virtual;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

class UserController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api');
    }
    public function addOrder(Request $request)
    {
        $user = Auth::user();
        $goods = $this->goodsDetail($request->product_id);
        if ($goods['status'] != 1) {
            throw new ApiException('该商品暂时无法兑换');
        }
        //先判断积分是否足够
        $remain = $this->remain($user);
        if (($remain - $goods['kehu_price'] * 100) < 0) {
            throw new ApiException('积分不足');
        }
        $client = new DamaiClient();
        $orderId = gen_order_no($user);
        $result = $client->addOrder($user, $orderId, $request);
        DB::beginTransaction();

        if ($result->status == 1) {
            //记录订单、扣积分
            Order::create([
                'user_id' => $user->id,
                'order_id' =>$orderId,
                'damai_order_id' => $result->order_id,
                'charge' => $goods['kehu_price'],
                'type' => 1
            ]);
            DB::commit();
            return json_response($result);
        } else {
            DB::rollBack();
            throw new ApiException($result->message, $result->status);
        }
    }

    public function remain($user)
    {
        //已消费的积分
        $consume = Order::where([
            'user_id' => $user->id,
//            'status' => 1
        ])->sum('charge');

        //从erp查询会员积分
        $erp = new ErpClient();
        $res = $erp->getVip(['mobile' => $user->mobile]);
        if ($res->success == false) {
            throw new ApiException('您还不是我们的会员', 404);
        }
        $vip = ($res->vips)[0];
        $integral = $vip->vip_attribute->integral;

        return $integral - $consume * 100;
    }

    public function integral()
    {
        $user = Auth::user();
        $integral = $this->remain($user);
        return json_response(compact('integral'));
    }

    public function goodsDetail($goodId)
    {
        $client = new DamaiClient();
        return $client->goodsDetail($goodId);
    }

    public function addVirtualOrder(Request $request)
    {
        $user = Auth::user();
        $virtual = $this->goodsDetail($request->product_id);
        if ($virtual['status'] != 1) {
            throw new ApiException('该商品暂时无法兑换');
        }
        $remain = $this->remain($user);
        //首先判断积分是否足够
        if (($remain - ($virtual['kehu_price'] * 100)) < 0) {
            throw new ApiException('积分不足');
        }


        $client = new DamaiClient();
        $orderId = gen_order_no($user);
        $result = $client->giftCard($orderId, $user, $request);


        DB::beginTransaction();
        if ($result['status'] == 1) {
            //记录订单、扣积分
            Order::create([
                'user_id' => $user->id,
                'order_id' =>$orderId,
                'damai_order_id' => $result['order_id'],
                'charge' => $virtual['kehu_price'],
                'type' => 2
            ]);
            DB::commit();
            return json_response($result);
        } else {
            DB::rollBack();
            throw new ApiException($result['message'], $result['status']);
        }
    }

    /**
     * type 1为实物,2为虚拟商品
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function orderList(Request $request)
    {
        $user = Auth::user();
        $type = $request->type;
        $orders = $user->orders()->orderBy('id', 'DESC')->where('type', $type)->get();
        $rows = [];
        if ($type == 3) {
            foreach ($orders as $order) {
                $cash = Cash::where('order_id', $order->order_id)->first()->toArray();

                $row['info']['price'] = $order->charge;
                $row['info']['time'] = $order->created_at->format('Y-m-d H:i:s');
                $row['info']['account'] = $cash;
                $row['info']['orderinfo'] = [
                    'order_id' => $order->order_id,
                    'good_name' => $order->charge . '元现金',
                    'shipping_status' => $order->status == 2 ? '已打款' : '未打款',
                ];
                array_push($rows, $row['info']);
            }
        } else {
            $client = new DamaiClient();
            foreach ($orders as $order) {
                if ($type == 1) {
                    $row = $client->orderDetail($order->damai_order_id);
                    if ($row['status'] != 1) {
                        throw new ApiException('系统异常,请稍后再试');
                    }
                    $row['info']['price'] = $order->charge;
                    $row['info']['time'] = $order->created_at->format('Y-m-d H:i:s');
                    $row['info']['shipping_name'] = $order->ship_name;
                    $row['info']['invoice_no'] = $order->ship_num;
                    array_push($rows, $row['info']);
                }
                if ($type == 2) {
                    $row = $client->virtualOrderDetail($order->order_id);
                    if ($row['status'] != 1) {
                        throw new ApiException('系统异常,请稍后再试');
                    }
                    $row['info']['price'] = $order->charge;
                    $row['info']['time'] = $order->created_at->format('Y-m-d H:i:s');
                    $row['info']['goods'] = $row['info'][0];
                    $row['info']['orderinfo'] = [
                        'order_id' => $row['order_id'],
                        'good_name' => $row['good_name'],
                    ];
                    array_push($rows, $row['info']);
                }


            }
        }

        return json_response(compact('rows'));
    }

    public function orderCash(Request $request)
    {
        $user = Auth::user();
        $remain = $this->remain($user);
        //首先判断积分是否足够
        if (($remain - ($request->amount * 100)) < 0) {
            throw new ApiException('积分不足');
        }
        DB::beginTransaction();
        $orderId = gen_order_no($user);
        try {
            //记录订单、扣积分
            Order::create([
                'user_id' => $user->id,
                'order_id' => $orderId,
                'damai_order_id' => $orderId,
                'charge' => $request->amount,
                'type' => 3,
            ]);
            Cash::create([
                'order_id' => $orderId,
                'name' => $request->aliName,
                'account' => $request->aliAccount
            ]);
            DB::commit();
            return json_response([], '已提交,等待财务审核转账');
        } catch (\Exception $e) {
            DB::rollBack();
            throw new ApiException('系统发生错误,请稍后重试');
        }
    }

    public function addressDetail(Request $request)
    {
        $address = Address::find($request->id);
        return json_response($address);
    }

    /**
     * 新增或者修改地址
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function address(Request $request)
    {
        $user = Auth::user();
        $data = $request->all();
        $data['user_id'] = $user->id;
        //处理默认地址
        if ($request->is_default) {
            Address::where('user_id', $user->id)->update(['is_default' => 0]);
        }
        if ($request->id) {
            $address = Address::find($request->id);
            $address->fill($data)->save();
            return json_response($data, '操作成功');
        } else {
            Address::create($data);
        }
        return json_response([], '操作成功');
    }

    public function addressList(Request $request)
    {
        $user = Auth::user();
        $list = Address::where([
            'user_id' => $user->id,
            'is_deleted' => 0
        ])->get();

        return json_response(compact('list'));
    }

    public function addressDel(Request $request)
    {
        $address = Address::find($request->id);
        $address->is_deleted = 1;
        $address->save();
        return json_response([], '操作成功');
    }

    public function profile()
    {
        $user = Auth::user();
        $user->fans = $user->followers()->count();
        $opusList = Opus::where(['user_id' => $user->id])->orderBy('id', 'desc')->limit(2)->get();
        $opusCount = Opus::where(['user_id' => $user->id])->count();
        $apply = TaskUser::where([
            ['user_id', '=', $user->id],
            ['status', '=', Task::TASK_STATUS_APPLY],
        ])->count();
        $start = TaskUser::where('user_id', '=', $user->id)->whereBetween('status', [Task::TASK_STATUS_START, Task::TASK_STATUS_PUBLISH])->count();
        $auditing = TaskUser::where([
            ['user_id', '=', $user->id],
            ['status', '=', Task::TASK_STATUS_AUDITING],
        ])->count();
        $finish = TaskUser::where([
            ['user_id', '=', $user->id],
            ['status', '=', Task::TASK_STATUS_FINISH],
        ])->count();
        $setting = Setting::find(1);
        return json_response(['profile' => $user, 'opusList' => $opusList, 'opusCount'=> $opusCount, 'taskList' => compact('apply', 'start', 'auditing', 'finish'), 'setting' => $setting]);
    }

    public function profileEdit(Request $request)
    {
        $user = Auth::user();
        $user->fill($request->data);
        $user->save();
        return json_response($user);
    }

    /**
     *
     * 获取七牛云上传token
     * @return \Illuminate\Http\JsonResponse
     */
    public function getUploadToken()
    {
        $accessKey = env('QINIU_ACCESS_KEY', 'LQZ6mKBx39ToooMy0VnVidE9ZzsJJNFuh5SnrqID');
        $secretKey = env('QINIU_SECRET_KEY', 'qLTeFaAFkC-nXyFc7EePHXZGjBpxLMkGqM0fRu6E');
        $auth = new \Qiniu\Auth($accessKey, $secretKey);
        $bucket = env('QINIU_BUCKET', 'qhn');
        $token = $auth->uploadToken($bucket, null, 3600, null, true);
        $filename = uniqid();
        return json_response([
            'token' => $token,
            'host' => env('QINIU_URL'),
            'filename' => $filename
        ]);
    }

    public function addOpus(Request $request)
    {
        $user = Auth::user();
        //限制作品数量为9个
        $count = Opus::where('user_id', $user->id)->count();
        if ($count >= 9) {
            return json_response([], '代表作品最多上传9个', 20001);
        }
        Opus::create([
            'user_id' => $user->id,
            'uri' => env('QINIU_URL') . '/' . $request->filename,
            'media_type' => $request->type,
            'thumb' => $request->thumb ?  env('QINIU_URL') . '/' . $request->thumb : '',
        ]);
        return json_response([], '上传作品成功');
    }

    public function opusList(Request $request)
    {
        $user = Auth::user();
//        $list = Opus::where(['user_id' => $user->id])->orderBy('id', 'desc')->paginate($request->limit);
        $list = Opus::where(['user_id' => $user->id])->orderBy('id', 'desc')->get();
        return json_response($list);
    }

    public function opusDel(Request $request)
    {
        $opus = Opus::find($request->id);
        $opus->delete();
        return json_response([], '作品删除成功');
    }

    public function myTaskList(Request $request)
    {
        $user = Auth::user();
        $index = $request->index;
        $limit = $request->limit;

        $list = [];
        switch ($index) {
            case 0:
                $list = TaskUser::with('task')->where('user_id', $user->id)->orderBy('id', 'desc')->paginate($limit);
                break;
            case 1:
                $list = TaskUser::with('task')->where([
                    ['user_id', '=', $user->id],
                    ['status', '=', Task::TASK_STATUS_APPLY],
                ])->orderBy('id', 'desc')->paginate($limit);
                break;
            case 2:
                $list = TaskUser::with('task')->where('user_id', '=', $user->id)->whereBetween('status', [Task::TASK_STATUS_START, Task::TASK_STATUS_PUBLISH])->orderBy('id', 'desc')->paginate($limit);
                break;
            case 3:
                $list = TaskUser::with('task')->where([
                    ['user_id', '=', $user->id],
                    ['status', '=', Task::TASK_STATUS_AUDITING],
                ])->orderBy('id', 'desc')->paginate($limit);
                break;
            case 4:
                $list = TaskUser::with('task')->where([
                    ['user_id', '=', $user->id],
                    ['status', '=', Task::TASK_STATUS_FINISH],
                ])->orderBy('id', 'desc')->paginate($limit);
                break;
            case 5:
                $list = TaskUser::with('task')->where([
                    ['user_id', '=', $user->id],
                    ['status', '=', Task::TASK_STATUS_CANCEL],
                ])->orderBy('id', 'desc')->paginate($limit);
                break;
            default:
                break;
        }
        return json_response($list);
    }

    /**
     * 实名认证
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function shiming(Request $request)
    {

        //检查是否已经实名
        $user = Auth::user();
        $shiming = Shiming::where('user_id', $user->id)->count();
        if ($shiming) {
            return json_response([], '你已实名认证，无需重复认证', 2001);
        }
        //配置您申请的appkey
        $appkey = "*********************";
        $url = "http://op.juhe.cn/idcard/query";
        $params = array(
            "idcard" => $request->id_card,//身份证号码
            "realname" => $request->real_name,//真实姓名
            "key" => $appkey,//应用APPKEY(应用详细页查询)
        );
        $paramstring = http_build_query($params);
        $content = juhecurl($url,$paramstring);
        $result = json_decode($content,true);

        //测试用
        $result['error_code'] = 0;
        $result['result']['res']  = 1;

        if($result){
            if($result['error_code']=='0'){
                if($result['result']['res'] == '1'){
                    //TODO
                    $shiming = new Shiming();
                    $shiming->user_id = $user->id;
                    $shiming->real_name = $request->real_name;
                    $shiming->id_card = $request->id_card;
                    $shiming->save();
                    return json_response([], '实名认证成功');
                }else{
                    return json_response([], "身份证号码和真实姓名不一致", 6001);
                }
            }else{
                return json_response([], $result['reason'], $result['error_code']);
            }
        }else{
            return json_response([], "实名认证接口请求失败", 5001) ;
        }
    }

    public function shimingInfo()
    {
        $user = Auth::user();
        $shiming = Shiming::where('user_id', $user->id)->first();
        return json_response($shiming);
    }

    public function bindPhone(Request $request)
    {
        $user = Auth::user();
        if ($user->mobile) {
            return json_response([], '你已绑定过手机', 20001);
        }
        $miniProgram = \EasyWeChat::miniProgram(); // 小程序
        $session = $miniProgram->auth->session($request->code);
        $openid = $session['openid'];
        $session_key = $session['session_key'];
//        $wx_user = WxUser::where(['openid' => $openid])->first();
//        if ($wx_user) {
//            $decryptedData = $miniProgram->encryptor->decryptData($session_key, $request->iv, $request->encryptedData);
//            $wx_user->phone = $decryptedData['phoneNumber'];
//            $wx_user->save();
//            return json_response($wx_user->phone, '手机号成功授权');
//        } else {
//            return json_response([], '请先微信授权登录', 10002);
//        }
        $decryptedData = $miniProgram->encryptor->decryptData($session_key, $request->iv, $request->encryptedData);
        $user->mobile = $decryptedData['phoneNumber'];
        $user->save();
        return json_response(['mobile' => $decryptedData['phoneNumber']], '手机号绑定成功');
    }

    public function isShiming()
    {
        $user = Auth::user();
        $shiming = Shiming::where('user_id', $user->id)->count();
        return $shiming;
    }

    public function bindAlipay(Request $request)
    {
        $user = Auth::user();
        $shiming = Shiming::where('user_id', $user->id)->first();
        if (!$shiming) {
            return json_response([], '请先完成实名认证', 4001);
        }
        $exist = AlipayRecord::where('user_id', $user->id)->count();
        if ($exist) {
            return json_response([], '你已绑定,不能重复绑定', 20001);
        }
        $alipay = new AlipayRecord();
        $alipay->user_id = $user->id;
        $alipay->name = $shiming->real_name;
        $alipay->account = $request->account;
        $alipay->save();
        return json_response([], '支付宝绑定成功');
    }

    public function withdraw(Request $request)
    {
        $user = Auth::user();
        $exist = AlipayRecord::where('user_id', $user->id)->count();
        if (!$exist) {
            return json_response([], '请先绑定支付宝账号', 4001);
        }

        if ($request->amount > $user->reward) {
            return json_response([], '余额不足', 50001);
        }
        DB::beginTransaction();
        try {
            //记录流水
            WithdrawRecord::create([
                'user_id' => $user->id,
                'amount' => $request->amount
            ]);
            $user->reward -= $request->amount;
            $user->save();
            DB::commit();
            return json_response([], '提现申请成功,等待处理');
        } catch (\Exception $e) {
            DB::rollBack();
            throw new ApiException($e->getMessage(), 500);
        }
    }

    public function allNotifications()
    {
        $user = Auth::user();
        return json_response($user->notifications);
    }

    public function unread()
    {
        $user = Auth::user();
        return json_response($user->unreadNotifications->count());
    }

    public function read(Request $request)
    {
        $user = Auth::user();
        $user->unreadNotifications->where('id', $request->get('id'))->markAsRead();
        $unread = $user->unreadNotifications->count();
        return json_response($unread > 0 ? $unread - 1 : 0, '剩余未读');
    }

    public function record(Request $request)
    {
        $limit = $request->limit;
        $user = Auth::user();
        $list = RewardRecord::where('user_id', $user->id)->orderBy('created_at', 'desc')->paginate($limit);
        return json_response($list);
    }
}
