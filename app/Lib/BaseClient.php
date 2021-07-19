<?php
/**
 * Created by PhpStorm.
 * User: hirsi
 * Email: whuanxu@163.com
 * Github: https://github.com/Ninee
 * Date: 2019/4/29
 * Time: 11:08 AM
 */

namespace App\Lib;


class BaseClient
{
    protected $client;

    public function __construct($baseUri)
    {
        $this->client = new \GuzzleHttp\Client(['base_uri' => $baseUri]);
    }

    public function request($url, $method, $options)
    {
        return $this->client->request($method, $url, $options);
    }
    public function httpGet(string $url, array $query = [])
    {
        return $this->request($url, 'GET', ['query' => $query]);
    }

    public function httpPost(string $url, array $data = [])
    {
        return $this->request($url, 'POST', ['form_params' => $data]);
    }

    public function httpPostJson(string $url, array $data = [])
    {
        return $this->request($url, 'POST', ['json' => $data]);
    }
}