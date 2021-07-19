<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RewardRecord extends Model
{
    const TYPE_REWARD = 1;
    const TYPE_RETURN = 2;

    protected $fillable = [
        'user_id', 'task_user_id', 'amount', 'rate', 'type'
    ];

    public function taskUser()
    {
        return $this->belongsTo(TaskUser::class);
    }
}
