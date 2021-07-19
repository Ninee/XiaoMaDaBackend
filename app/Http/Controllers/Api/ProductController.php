<?php

namespace App\Http\Controllers;

use App\Lib\DamaiClient;
use App\Virtual;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function index(Request $request)
    {
        $client = new DamaiClient();
        $productList = $client->goodsList($request->input('page', 1));
        $rows = [];
        foreach ($productList['goods'] as $good) {
            array_push($rows, $good);
        }
        $count = $productList['pages']['count'];
        return json_response(compact('rows', 'count'));
    }

    public function detail(Request $request)
    {
        $client = new DamaiClient();
        $detail = $client->goodsDetail($request->id);

        return json_response($detail);
    }

    public function virtual(Request $request)
    {
        $client = new DamaiClient();
        $productList = $client->goodsList($request->input('page', 1), 1);
        $rows = [];
        foreach ($productList['goods'] as $good) {
            array_push($rows, $good);
        }
        $count = $productList['pages']['count'];
        return json_response(compact('rows', 'count'));

    }

}
