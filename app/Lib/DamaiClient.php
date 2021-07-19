<?php
/**
 * Created by PhpStorm.
 * User: hirsi
 * Email: whuanxu@163.com
 * Github: https://github.com/Ninee
 * Date: 2019/4/29
 * Time: 11:05 AM
 */

namespace App\Lib;


use App\Address;

class DamaiClient extends BaseClient
{
    //测试环境
//    protected $token = 'a9ea7a0b803c9372cd15001114d87b44';
//    protected $kehuid = '101';

    //正式环境
    protected $token = '14f4097acdd773653caef1e70e2086d6';
    protected $kehuid = '127';

    protected $url = 'http://proxy.lzhnb.com/damai/api';

    public function __construct()
    {
//        parent::__construct('http://www.test.damaicheng.com/index.php');
        parent::__construct($this->url);
    }

    public function sign($data)
    {
        $sort = ksort($data);
        $str = http_build_query($data);
        $sign = strtoupper(md5($this->token . $str));
        return $sign;
    }

    public function goodsList($page = 1, $real = 0)
    {
        $data = [
            'page' => $page,
            'kehuid' => $this->kehuid,
            'online' => 1,
            'real' => $real
        ];
        $data['sign'] = $this->sign($data);
        $data['r'] = 'goodsapi/List';
        $response = $this->httpGet('', $data);
        return $this->response($response);
    }

    public function goodsDetail($goodId)
    {
        $data = [
            'kehuid' => $this->kehuid,
            'id' => $goodId
        ];
        $data['sign'] = $this->sign($data);
        $data['r'] = 'goodsapi/Goodsone';
        $response = $this->httpGet('', $data);
        return $this->response($response);
    }

    public function addOrder($user, $orderId, $request)
    {
        $address = Address::find($request->address_id);
        $region = explode(' ', $address->region_name);
        $Data = array(
            'alladdress' => $address->region_name. $address->address_detail,
            "province"=> $region[0],
            "city" => $region[1],
            "consignee" => $address->contact_name,
            "district" => $region[2],
            "addtime" => date('Y-m-d H:i:s', time()),
            'goods_info' => Array(
                $request->product_id => Array(
                    'good_id' => $request->product_id,
                    'number' => 1,
                    'use_jifen' => 1,
                ),
            ),
            'kehuid' => $this->kehuid,
            'mobile' => $address->contact_mobile,
            'order_sn' => $orderId,
            'order_status' => 1,
            'useraccount' => $user->name,
            'zipcode' => '000000',
        );
        $Data['goods_info'] = json_encode($Data['goods_info']);
        $buff = '';
        $token = $this->token;
        ksort($Data);
        foreach ($Data as $k => $v) {
            $buff .= $k ."=" . $v . "&";
        }
        $reqPar = $token;
        if(strlen($buff)>0){
            $reqPar .= substr($buff,0,strlen($buff)-1);
        }
        $sign = strtoupper(md5($reqPar));
//$sign = $this->formatParaMap($Data, '06e3f0ceb6e15859c3d2b2f60c0477a6');
        $Data['sign'] = $sign;
        $Data['goods_info'] = json_decode($Data['goods_info'],true);

        $str = json_encode($Data, JSON_UNESCAPED_UNICODE);
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $this->url . '?r=orderapi/addorder');
        curl_setopt($ch, CURLOPT_POST, 1 );
        curl_setopt($ch, CURLOPT_HEADER, 0 );
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1 );
        curl_setopt($ch, CURLOPT_POSTFIELDS, $str );
        $cons = curl_exec($ch);
        curl_close($ch);
        return json_decode($cons);
    }

    public function telRecharge()
    {
        $data = [
            'tel' => '13112345678',
            'price' => 50,
            'order_id' => '1005',
            'useraccount' => '12',
            'kehuid' => $this->kehuid,
        ];
        $data['sign'] = $this->sign($data);
        $data['r'] = 'xuniapinew/TelRecharge';
        $response = $this->httpGet('', $data);
        return $this->response($response);
    }

    public function giftCard($orderId, $user, $request)
    {
        $Data = [
            'orderid' => $orderId,
            'useraccount' => $user->name,
            'goodid' => $request->product_id,
            'phone' => $request->contact_mobile,
            'kehuid' => $this->kehuid,
        ];
        $buff = '';
        $token = $this->token;
        ksort($Data);
        foreach ($Data as $k => $v) {
            $buff .= $k ."=" . $v . "&";
        }
        $reqPar = $token;
        if(strlen($buff)>0){
            $reqPar .= substr($buff,0,strlen($buff)-1);
        }
        $sign = strtoupper(md5($reqPar));
        $Data['sign'] = $sign;
        $Data['r'] = 'xuniapinew/giftCard';
        $response = $this->httpGet('', $Data);
        return $this->response($response);
    }

    public function orderDetail($orderId)
    {
        $data = [
            'kehuid' => $this->kehuid,
            'order_id' => $orderId
        ];
        $data['sign'] = $this->sign($data);
        $data['r'] = 'orderapi/detailed';
        $response = $this->httpGet('', $data);
        return $this->response($response);
    }

    public function virtualOrderDetail($orderId)
    {
        $data = [
            'kehuid' => $this->kehuid,
            'orderid' => $orderId
        ];
        $data['sign'] = $this->sign($data);
        $data['r'] = 'xuniapinew/xuniorderinfo';
        $response = $this->httpGet('', $data);
        return $this->response($response);
    }

    public function response($res)
    {
        return json_decode($res->getBody()->getContents(), true);
    }
}