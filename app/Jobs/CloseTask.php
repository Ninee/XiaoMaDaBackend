<?php

namespace App\Jobs;

use App\Models\Task;
use App\Models\TaskUser;
use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Support\Facades\DB;

class CloseTask implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    protected $task;

    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct(TaskUser $task, $delay)
    {
        $this->task = $task;
        // 设置延迟的时间，delay() 方法的参数代表多少秒之后执行
        $this->delay($delay);
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        // 判断对应的订单是否已经被支付
        // 如果已经支付则不需要关闭订单，直接退出
        if ($this->task->status != Task::TASK_STATUS_START) {
            return;
        }
        // 通过事务执行 sql
        DB::transaction(function() {
            // 将订单的 closed 字段标记为 true，即关闭订单
            $this->task->update(['status' => Task::TASK_STATUS_CANCEL]);
        });
    }
}
