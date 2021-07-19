<?php

namespace App\Http\Controllers\Api;

use App\Models\Setting;
use App\Models\TryGood;
use App\Models\VipGood;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class SysController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api');
    }

    public function vipGoods()
    {
        $goods = VipGood::all();
        $setting = Setting::find(1);
        $price = $setting->member_fee;
        return json_response(compact('goods', 'price'));
    }

    public function tryGoods(Request $request)
    {
        $limit = $request->limit;
        $list = TryGood::where('status', 1)->orderBy('id','desc')->paginate($limit);
        return json_response($list);
    }

    public function tryGoodDetail(Request $request)
    {
        $good = TryGood::find($request->id);
        return json_response($good);
    }
}
