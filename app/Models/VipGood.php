<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\URL;

class VipGood extends Model
{
    use SoftDeletes;
    public function getImgAttribute()
    {
        if (URL::isValidUrl($this->attributes['img'])) {
            return $this->attributes['img'];
        } else {
            return  Storage::disk(config('admin.upload.disk'))->url($this->attributes['img']);
        }

    }
}
