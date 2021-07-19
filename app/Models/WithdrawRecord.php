<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class WithdrawRecord extends Model
{
    protected $fillable = [
        'user_id', 'amount'
    ];
}
