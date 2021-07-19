<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\URL;

class HotRank extends Model
{
    public function opus()
    {
        return $this->hasMany(HotOpus::class);
    }

    public function getAvatarAttribute()
    {
        if (URL::isValidUrl($this->attributes['avatar'])) {
            return $this->attributes['avatar'];
        } else {
            return  Storage::disk(config('admin.upload.disk'))->url($this->attributes['avatar']);
        }

    }
}
