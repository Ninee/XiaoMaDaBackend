<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;

class Virtual extends Model
{

    public function getThumbAttribute()
    {
        return  Storage::disk('admin')->url($this->attributes['thumb']);
    }
}
