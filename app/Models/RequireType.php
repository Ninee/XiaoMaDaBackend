<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RequireType extends Model
{
    protected $appends = [
        'text', 'value'
    ];

    public function getTextAttribute()
    {
        return $this->attributes['title'];
    }

    public function getValueAttribute()
    {
        return $this->attributes['id'];
    }
}
