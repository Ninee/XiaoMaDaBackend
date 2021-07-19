<?php

namespace App\Events;

use App\Models\Task;
use App\Models\TaskUser;
use Illuminate\Broadcasting\Channel;
use Illuminate\Queue\SerializesModels;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;

class TaskClearEvent
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $taskUser;
    public $task;
    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct(TaskUser $taskUser, Task $task)
    {
        $this->taskUser = $taskUser;
        $this->task = $task;
    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return \Illuminate\Broadcasting\Channel|array
     */
    public function broadcastOn()
    {
        return new PrivateChannel('channel-name');
    }
}
