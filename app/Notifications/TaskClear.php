<?php

namespace App\Notifications;

use App\Models\Setting;
use App\Models\Task;
use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class TaskClear extends Notification
{
    use Queueable;

    protected $task;
    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct(Task $task)
    {
        $this->task = $task;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['database'];
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        $setting = Setting::find(1);
        return [
            'title' => "'" . $this->task->good_name . "'" . '任务已完成',
//            'user_task_id' => $this->task->id,
            'content' =>'结算金额: ' . $this->task->reward * (1 - $setting->task_rate) . '元',
        ];
    }
}
