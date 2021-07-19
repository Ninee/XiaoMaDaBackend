<?php
/**
 * Created by PhpStorm.
 * User: hirsi
 * Email: whuanxu@163.com
 * Github: https://github.com/Ninee
 * Date: 2019/4/28
 * Time: 2:21 PM
 */

if (! function_exists('exception_response')) {
    /**
     * 异常响应.
     *
     * @param Exception $exception
     * @param string    $message
     *
     * @return \Illuminate\Http\JsonResponse
     */
    function exception_response(Exception $exception, string $message = '')
    {
        return response()->json([
            'message' => $message ?: $exception->getMessage(),
            'errno' => $exception->getCode() ?: 500,
        ]);
    }
}

if (! function_exists('exception_record')) {
    /**
     * 记录异常.
     *
     * @param Exception $exception
     */
    function exception_record(Exception $exception): void
    {
        \Log::error([
            'file' => $exception->getFile(),
            'code' => $exception->getCode(),
            'message' => $exception->getMessage(),
            'line' => $exception->getLine(),
            'trace' => $exception->getTraceAsString(),
        ]);
    }
}

if (! function_exists('json_response')) {

    /**
     * 统一成功响应
     *
     * @param $data
     * @param string $message
     * @param int $code
     * @return \Illuminate\Http\JsonResponse
     */
    function json_response($data, $message = '', $errno = 0)
    {
        return response()->json([
            'data' => $data,
            'message' => $message,
            'errno' => $errno,
        ]);
    }
}

if (! function_exists('gen_order_no')) {
    /**
     * 生成订单号.
     *
     * @param \App\User $user
     *
     * @return string
     */
    function gen_order_no(\App\User $user)
    {
        $userId = str_pad($user->id, 10, 0, STR_PAD_LEFT);
        $time = date('His');
        $rand = mt_rand(10, 99);

        return $time.$rand.$userId;
    }
}

if (! function_exists('juhecurl')) {
    /**
     * 请求接口返回内容
     * @param  string $url [请求的URL地址]
     * @param  string $params [请求的参数]
     * @param  int $ipost [是否采用POST形式]
     * @return  string
     */
    function juhecurl($url,$params=false,$ispost=0){
        $httpInfo = array();
        $ch = curl_init();

        curl_setopt( $ch, CURLOPT_HTTP_VERSION , CURL_HTTP_VERSION_1_1 );
        curl_setopt( $ch, CURLOPT_USERAGENT , 'JuheData' );
        curl_setopt( $ch, CURLOPT_CONNECTTIMEOUT , 60 );
        curl_setopt( $ch, CURLOPT_TIMEOUT , 60);
        curl_setopt( $ch, CURLOPT_RETURNTRANSFER , true );
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
        if( $ispost )
        {
            curl_setopt( $ch , CURLOPT_POST , true );
            curl_setopt( $ch , CURLOPT_POSTFIELDS , $params );
            curl_setopt( $ch , CURLOPT_URL , $url );
        }
        else
        {
            if($params){
                curl_setopt( $ch , CURLOPT_URL , $url.'?'.$params );
            }else{
                curl_setopt( $ch , CURLOPT_URL , $url);
            }
        }
        $response = curl_exec( $ch );
        if ($response === FALSE) {
            //echo "cURL Error: " . curl_error($ch);
            return false;
        }
        $httpCode = curl_getinfo( $ch , CURLINFO_HTTP_CODE );
        $httpInfo = array_merge( $httpInfo , curl_getinfo( $ch ) );
        curl_close( $ch );
        return $response;
    }
}