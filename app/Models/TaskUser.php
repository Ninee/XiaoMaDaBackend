<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TaskUser extends Model
{
    protected $fillable = [
        'user_id', 'task_id', 'status'
    ];

    protected $appends = [
        'status_txt'
    ];

    public function task()
    {
        return $this->belongsTo(Task::class);
    }

    public function getStatusTxtAttribute()
    {
        return  Task::TASK_STATUS_TXT[$this->attributes['status']];
    }

}
