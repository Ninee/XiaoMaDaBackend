<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\URL;

class HotOpus extends Model
{
    public function getUriAttribute()
    {
        if (URL::isValidUrl($this->attributes['uri'])) {
            return $this->attributes['uri'];
        } else {
            return  Storage::disk(config('admin.upload.disk'))->url($this->attributes['uri']);
        }

    }
    public function getThumbAttribute()
    {
        if (URL::isValidUrl($this->attributes['thumb'])) {
            return $this->attributes['thumb'];
        } else {
            return  Storage::disk(config('admin.upload.disk'))->url($this->attributes['thumb']);
        }

    }
}
