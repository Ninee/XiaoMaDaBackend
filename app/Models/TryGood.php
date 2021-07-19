<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\URL;

class TryGood extends Model
{
    use SoftDeletes;

    protected  $appends = [
        'take'
    ];

    public function getImgAttribute()
    {
        if (URL::isValidUrl($this->attributes['img'])) {
            return $this->attributes['img'];
        } else {
            return  Storage::disk(config('admin.upload.disk'))->url($this->attributes['img']);
        }

    }

    public function getTakeAttribute()
    {
        $id = $this->attributes['id'];
        $count = DB::table('order_goods')
            ->join('orders', function ($join) use ($id) {
                $join->on('orders.id', '=', 'order_goods.order_id')
                    ->where('orders.status', '=', Order::STATUS_PAID)
                    ->where('order_goods.goods_type', OrderGoods::GOODS_TYPE_TRY)
                    ->where('order_goods.goods_id', '=', $id);
            })->count();
        return $count;
    }
}
