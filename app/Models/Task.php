<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\URL;

class Task extends Model
{
    use SoftDeletes;

    const ROLE_TYPE_TRY = 1;
    const ROLE_TYPE_MEMBER = 2;
    const ROLE_TYPE_MATCH = 3;
    const ROLE_TYPE_FINAL = 4;

    const TASK_MODE_AUDITING = 1;
    const TASK_MODE_AUTO = 2;

    const TASK_MODE_TXT = [
        self::TASK_MODE_AUDITING => '审核',
        self::TASK_MODE_AUTO => '抢单'
    ];

    const TASK_STATUS_CANCEL = 0;
    const TASK_STATUS_APPLY = 1;
    const TASK_STATUS_START = 2;
    const TASK_STATUS_PUBLISH = 3;
    const TASK_STATUS_AUDITING = 4;
    const TASK_STATUS_FINISH = 5;

    const TASK_STATUS_TXT = [
        self::TASK_STATUS_CANCEL => '已取消',
        self::TASK_STATUS_APPLY => '等待商家审核',
        self::TASK_STATUS_START => '下单中',
        self::TASK_STATUS_PUBLISH => '发布中',
        self::TASK_STATUS_AUDITING => '等待商家确认',
        self::TASK_STATUS_FINISH => '已完成',
    ];

    protected $appends = [
        'mode_txt',
        'remain',
        'sale_reward'
    ];

    public function getSaleRewardAttribute()
    {
        return round($this->attributes['sale_rate'] * $this->attributes['good_price'] / 100, 1);
    }

    public function getRemainAttribute()
    {
        $count = TaskUser::where([
            ['task_id', '=', $this->attributes['id']],
            ['status', '>', self::TASK_STATUS_APPLY]
        ])->count();
        return $this->attributes['limit_number'] - $count;
    }

    public function source()
    {
        return $this->belongsTo(GoodSource::class, 'good_source', 'id');
    }

    public function platform()
    {
        return $this->belongsTo(Platform::class);
    }

    public function requireType()
    {
        return $this->belongsTo(RequireType::class);
    }

    public function getGoodImgAttribute()
    {
        if (URL::isValidUrl($this->attributes['good_img'])) {
            return $this->attributes['good_img'];
        } else {
            return  Storage::disk(config('admin.upload.disk'))->url($this->attributes['good_img']);
        }
    }

    public function getModeTxtAttribute()
    {
        return self::TASK_MODE_TXT[$this->attributes['mode']];
    }
}