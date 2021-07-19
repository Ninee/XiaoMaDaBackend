<?php
/**
 * Created by PhpStorm.
 * User: hirsi
 * Email: whuanxu@163.com
 * Github: https://github.com/Ninee
 * Date: 2019/5/5
 * Time: 11:00 AM
 */

namespace App\Lib;


class ErpClient
{
    //测试环境
//    protected $url = 'http://api.demo.guanyierp.com/rest/erp_open';
//    protected $appkey = '126225';
//    protected $secret = '4d97588127414cf6816994854c958a5d';
//    protected $sessionkey = 'eeaa9f5110694110b3467c6c61f79fab';

    //生产环境
    protected $url = 'http://v2.api.guanyierp.com/rest/erp_open';
    protected $appkey = '130299';
    protected $secret = 'ac4a6fea93eb4d92ac8cdd50aa578676';
    protected $sessionkey = '38d4def003cb46d598615b78c600a430';

    // 会员查询
    public function getVip($filter = []) {
        $data = array();
        $data['appkey'] = $this->appkey;
        $data['sessionkey'] = $this->sessionkey;
        $data['method'] = 'gy.erp.vip.get';
//        $data['page_no'] = '1';
//        $data['page_size'] = '10';
//        $data['mobile'] = '1234698745';
        $data = array_merge($data, $filter);
        $data['sign'] = $this->sign($data, $this->secret);
//        echo $this->mycurl($data);

        return $this->response($this->mycurl($data));
    }

    public function sign($data, $secret) {
        if (empty($data)) {
            return "";
        }
        unset($data['sign']); //可选，具体看传参
        $data = $this->json_encode_ch($data);
        $sign = strtoupper(md5($secret . $data . $secret));
        return $sign;
    }

    public function json_encode_ch($arr) {
        return urldecode(json_encode($this->url_encode_arr($arr)));
    }

    public function url_encode_arr($arr) {
        if (is_array($arr)) {
            foreach ($arr as $k => $v) {
                $arr[$k] = $this->url_encode_arr($v);
            }
        } elseif (!is_numeric($arr) && !is_bool($arr)) {
            $arr = urlencode($arr);
        }
        return $arr;
    }

    public function response($res)
    {
        return json_decode($res);
    }

    public function mycurl($data) {
        $data_string = $this->json_encode_ch($data);
//        echo 'request: ' . $data_string . "\n";
        $data_string = urlencode($data_string);
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $this->url);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data_string);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            'Content-Type:text/json;charset=utf-8',
            'Content-Length:' . strlen($data_string)
        ));
        $content = curl_exec($ch);
        curl_close($ch);
        return $content;
    }
}