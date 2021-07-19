<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class OrderGoods extends Model
{
    const GOODS_TYPE_TRY = 'TRY';
    const GOODS_TYPE_VIP = 'VIP';

    protected $table = 'order_goods';

    protected $fillable = [
        'user_id', 'goods_id', 'goods_type', 'order_id',
        'num', 'charge',
    ];

    public function order()
    {
        return $this->belongsTo(Order::class);
    }
}
