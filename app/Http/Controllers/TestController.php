<?php

namespace App\Http\Controllers;

use App\Models\Task;
use App\Notifications\TaskClear;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Notification;

class TestController extends Controller
{
    public function test()
    {
        $user  = User::find(1);
        $task = Task::find(2);
        Notification::send($user, new TaskClear($task));
        $user->notify(new TaskClear($task));
//        dd($user->notifications()->get());
        return 'test';
    }
}
