<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Address extends Model
{
    protected $fillable = [
        'user_id', 'region_code', 'region_name', 'contact_name', 'contact_mobile', 'address_detail', 'is_default'
    ];

    protected $hidden = [
        'is_deleted'
    ];
}
