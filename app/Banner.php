<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\URL;

class Banner extends Model
{
    public function getImageSrcAttribute()
    {
        if (URL::isValidUrl($this->attributes['image_src'])) {
            return $this->attributes['image_src'];
        } else {
            return  Storage::disk(config('admin.upload.disk'))->url($this->attributes['image_src']);
        }

    }

    public function getLinkAttribute()
    {
        if ($this->attributes['link_type'] == 2) {
            return env('APP_URL') . '/article/' . $this->attributes['article_id'];
        } else {
            return $this->attributes['link'];
        }

    }
}
