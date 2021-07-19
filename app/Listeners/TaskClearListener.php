<?php

namespace App\Listeners;

use App\Events\TaskClearEvent;
use App\Exceptions\ApiException;
use App\Models\RewardRecord;
use App\Models\Setting;
use App\Models\Task;
use App\Notifications\TaskClear;
use App\User;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Support\Facades\DB;

class TaskClearListener
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  TaskClearEvent  $event
     * @return void
     */
    public function handle(TaskClearEvent $event)
    {
        $task_user = $event->taskUser;
        $task = $event->task;
        DB::beginTransaction();
        try {
            $setting = Setting::find(1);
            $sum = 0;
            switch ($task->require_type_id) {
                //送拍单,仅返货款
                case 1:
                    RewardRecord::create([
                        'user_id' => $task_user->user_id,
                        'task_user_id' => $task_user->id,
                        'amount' => $task->good_price,
                        'rate' => 0,
                        'type' => RewardRecord::TYPE_RETURN
                    ]);
                    $sum = $task->good_price;
                    break;
                //省钱单,只返回佣金
                case 2:
                    RewardRecord::create([
                        'user_id' => $task_user->user_id,
                        'task_user_id' => $task_user->id,
                        'amount' => $task->reward * (1 - $setting->task_rate),
                        'rate' => $setting->task_rate,
                        'type' => RewardRecord::TYPE_REWARD
                    ]);
                    $sum = $task->reward * (1 - $setting->task_rate);
                    break;
                //佣金单,返回货款跟佣金
                case 3:
                    RewardRecord::create([
                        'user_id' => $task_user->user_id,
                        'task_user_id' => $task_user->id,
                        'amount' => $task->good_price,
                        'rate' => 0,
                        'type' => RewardRecord::TYPE_RETURN
                    ]);
                    RewardRecord::create([
                        'user_id' => $task_user->user_id,
                        'task_user_id' => $task_user->id,
                        'amount' => $task->reward * (1 - $setting->task_rate),
                        'rate' => $setting->task_rate,
                        'type' => RewardRecord::TYPE_REWARD
                    ]);
                    $sum = $task->good_price + $task->reward * (1 - $setting->task_rate);
                    break;
            }

            $user = User::find($task_user->user_id);
            $user->reward += $sum;
            $user->save();
            //发送通知
            $user->notify(new TaskClear($task));
            $task_user->status = Task::TASK_STATUS_FINISH;
            $task_user->clear_type = 1;
            $task_user->is_clear = 1;
            $task_user->save();
            DB::commit();
        } catch (\Exception $e) {
            DB::rollBack();
            exception_record($e);
            throw new ApiException($e->getMessage());
        }
    }
}
