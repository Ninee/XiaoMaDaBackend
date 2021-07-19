<?php

namespace App\Models;

use App\User;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    const STATUS_UNPAY = 1;
    const STATUS_PAYING = 5;
    const STATUS_PAID = 9;
    const STATUS_CANCELED = 7;
    const STATUS_DELIVER = 10;

    const STATUS_TEXT = [
        self::STATUS_UNPAY => '未支付',
        self::STATUS_PAYING => '支付中',
        self::STATUS_PAID => '已支付',
        self::STATUS_CANCELED => '已取消',
        self::STATUS_DELIVER => '已发货'
    ];

    const TYPE_VIP = "VIP";
    const TYPE_TRY = "TRY";
    const TYPE_TEXT = [
        self::TYPE_VIP => '成为达人',
        self::TYPE_TRY => '大牌试用'
    ];

    protected $table = 'orders';

    protected $fillable = [
        'user_id', 'order_id', 'charge', 'status',  'payment', 'address_id', 'category'
    ];

    protected $appends = [
        'status_text',
        'type_text',
        'good',
    ];

    public function getGoodAttribute()
    {
        $order_good = OrderGoods::where('order_id', $this->id)->first();
        if ($order_good->goods_type == self::TYPE_TRY) {
            return TryGood::find($order_good->goods_id);
        } else {
            return VipGood::find($order_good->goods_id);
        }
    }

    public function getTypeTextAttribute()
    {
        return $this->typeText();
    }

    public function typeText()
    {
        return self::TYPE_TEXT[$this->category] ?? '';
    }

    public function getStatusTextAttribute()
    {
        return $this->statusText();
    }

    /**
     * 订单状态文本.
     *
     * @return string
     */
    public function statusText(): string
    {
        return self::STATUS_TEXT[$this->status] ?? '';
    }


    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function goods()
    {
        return $this->hasMany(OrderGoods::class, 'order_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

}
