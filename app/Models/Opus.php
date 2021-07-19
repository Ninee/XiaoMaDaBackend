<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Opus extends Model
{
    protected $fillable = [
      'user_id', 'uri', 'media_type', 'thumb'
    ];
}
