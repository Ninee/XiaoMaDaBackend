<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;

class MatchZone extends Model
{
    public function getWechatQrcodeAttribute()
    {
        if (url()->isValidUrl($this->attributes['wechat_qrcode'])) {
            return $this->attributes['wechat_qrcode'];
        } else {
            return  Storage::disk(config('admin.upload.disk'))->url($this->attributes['wechat_qrcode']);
        }

    }
}
