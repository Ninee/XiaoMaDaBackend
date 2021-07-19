<?php

namespace App\Http\Controllers\Api;

use App\Banner;
use App\Exceptions\ApiException;
use App\Jobs\CloseTask;
use App\Models\Contact;
use App\Models\MatchEnroll;
use App\Models\MatchSetting;
use App\Models\RequireType;
use App\Models\Shiming;
use App\Models\TabMenu;
use App\Models\Task;
use App\Models\TaskUser;
use App\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class TaskController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api', ['except' => ['index', 'remain']]);
    }

    public function index()
    {
        //判断是否在赛程内
        $today = Carbon::now();
        $matches = [];
        $match_setting = MatchSetting::find(1);
        $is_in_pre = $today->between(Carbon::createFromTimeString($match_setting->pre_start), Carbon::createFromTimeString($match_setting->pre_end));
        //判断用户登录状态以及是否是选手
        $match_enroll = null;
        $user = Auth::user();
        if($user) {
            $match_enroll = MatchEnroll::where('user_id', $user->id)->first();
        };
        if ($is_in_pre) {
            $pre_task = Task::with('platform')->with('requireType')->where('task_type', 3)->when($match_enroll, function ($query) use ($match_enroll) {
                return $query->where('track_id', $match_enroll->track_id);
            })->get();
            $matches['pre'] = $pre_task;
            $matches['pre_start'] = Carbon::createFromTimeString($match_setting->pre_start)->format("m.d");
            $matches['pre_end'] = Carbon::createFromTimeString($match_setting->pre_end)->format("m.d");
        }
        $is_in_final = $today->between(Carbon::createFromTimeString($match_setting->final_start), Carbon::createFromTimeString($match_setting->final_end));
        if ($is_in_final) {
            $final_task = Task::with('platform')->with('requireType')->where('task_type', 4)->when($match_enroll, function ($query) use ($match_enroll) {
                return $query->where('track_id', $match_enroll->track_id);
            })->get();
            $matches['final'] = $final_task;
            $matches['final_start'] = Carbon::createFromTimeString($match_setting->final_start)->format("m.d");
            $matches['final_end'] = Carbon::createFromTimeString($match_setting->final_end)->format("m.d");
        }

        $banners = Banner::where(['is_show' => 1])->get();
        $tries = Task::with('platform')->with('requireType')->where('task_type', 1)->get();
        $members = Task::with('platform')->with('requireType')->where('task_type', 2)->orderBy('id', 'desc')->paginate(10);
        //任务类型筛选
        $typeFilter = RequireType::all();
        $tabs = TabMenu::orderBy('sort', 'desc')->get();
        return json_response(compact('banners', 'matches', 'tries', 'members', 'typeFilter', 'tabs'));
    }

    public function taskList(Request $request)
    {
        $typeValue = $request->typeValue;
        $rewardValue = $request->rewardValue;
        $priceValue = $request->priceValue;
        $tabId = $request->tabId;
        $tasks = Task::with('platform')->with('requireType')
            ->when($tabId, function ($query) use ($tabId) {
                return $query->where('tab_menu_id', $tabId);
            })
            ->when($typeValue, function ($query) use ($typeValue) {
                return $query->where('require_type_id', $typeValue);
            })
            ->where('task_type', 2)
            ->when($rewardValue, function ($query) use ($rewardValue) {
                return $query->orderBy('reward', $rewardValue);
            })
            ->when($priceValue, function ($query) use ($priceValue) {
                return $query->orderBy('good_price', $priceValue);
            })
            ->when(!$rewardValue&&!$priceValue, function ($query) {
                return $query->orderBy('id', 'desc');
            })
            ->paginate($request->limit);

        return json_response($tasks);
    }

    public function detail(Request $request)
    {
        $id = $request->get('id');
        $task = Task::with(['source', 'requireType'])->find($id);
        $task['remain'] = $this->remain($task);
        $task['applied'] = $this->applied($task);
        return json_response($task);
    }

    public function remain(Task $task)
    {
        $count = TaskUser::where([
            ['task_id', '=', $task->id],
            ['status', '>', Task::TASK_STATUS_APPLY]
        ])->count();
        return $task->limit_number - $count;
    }

    public function applied($task)
    {
        $user = Auth::user();
        return TaskUser::where([
            ['user_id', '=', $user->id],
            ['task_id', '=', $task->id],
            ['status', '>', Task::TASK_STATUS_CANCEL],
        ])->count();
    }

    public function apply(Request $request)
    {
        $user = Auth::user();
        //检查是否实名
        $shiming = Shiming::where('user_id', $user->id)->count();
        if (!$shiming) {
            return json_response([], '请先完成实名认证', 4001);
        }
        $task = Task::find($request->id);
        $remain = $this->remain($task);

        if ($remain <= 0) {
            return json_response([], '任务已被抢光啦~', 2001);
        }
        if ($task->task_type === Task::ROLE_TYPE_MATCH && !$user->is_player) {
            return json_response([], '限定参赛选手', 2002);
        }
        if ($task->task_type === Task::ROLE_TYPE_MATCH) {
            $match_setting = MatchSetting::find(1);
            if ($user->fans < $match_setting->pre_fans) {
                return json_response([], '粉丝数要求' . $match_setting->pre_fans . '以上', 2003);
            }
        }
        //体验任务,限制次数
        if ($task->task_type === Task::ROLE_TYPE_TRY) {

            //单次只能领取一个,游客最多3个
            $sql = <<<SQL
SELECT count(*) as counter
FROM task_users, tasks
WHERE task_users.task_id = tasks.id
AND task_users.user_id = :user_id
AND tasks.task_type = :task_type
AND task_users.`status` > :status_start
AND task_users.`status` < :status_end
SQL;

            $nowTryCount = DB::select($sql, ['user_id' => $user->id, 'task_type' => Task::ROLE_TYPE_TRY, 'status_start' => Task::TASK_STATUS_CANCEL, 'status_end' => Task::TASK_STATUS_FINISH]);

            if($nowTryCount[0]->counter > 0) {
                return json_response([], '你有一个体验任务进行中,请先完成再申请', 2004);
            }
            $finishTryCount = DB::select($sql, ['user_id' => $user->id, 'task_type' => Task::ROLE_TYPE_TRY, 'status_start' => Task::TASK_STATUS_AUDITING, 'status_end' => Task::TASK_STATUS_FINISH + 1]);
            if ($finishTryCount >= 3 && $user->role === User::ROLE_VIEWER) {
                return json_response([], '游客最多只能领取3个体验任务,请升级成为达人', 2005);
            }

        }
        if ($task->task_type === Task::ROLE_TYPE_MEMBER && $user->role === User::ROLE_VIEWER) {
            return json_response([], '限定达人申请', 2002);
        }
        //达人最多进行3个任务(含体验)
        $maxCount = TaskUser::where([
            ['user_id', '=', $user->id],
            ['status', '>', Task::TASK_STATUS_CANCEL],
            ['status', '<', Task::TASK_STATUS_FINISH],
        ])->count();
        if ($maxCount >= 3) {
            return json_response([], '最多只能同时进行3个任务,请先完成其他任务', 2006);
        }

        $applied = TaskUser::where([
            ['user_id', '=', $user->id],
            ['task_id', '=', $task->id],
            ['status', '>', Task::TASK_STATUS_CANCEL],
        ])->count();
        if ($applied) {
            return json_response([], '你已申请过该任务', 1001);
        } else {

            $status = $task->mode == Task::TASK_MODE_AUDITING ? Task::TASK_STATUS_APPLY : Task::TASK_STATUS_START;

            $user_task = TaskUser::create([
                'user_id' => $user->id,
                'task_id' => $task->id,
                'status' => $status
            ]);

            //抢单模式,任务超时取消
            if ($task->mode == Task::TASK_MODE_AUTO) {
                $this->dispatch(new CloseTask($user_task, env('CLOSE_TASK_TTL')));
            }
            return json_response($user_task, '申请成功');
        }
    }
    public function start(Request $request)
    {
        $user = Auth::user();
        $user_task = TaskUser::find($request->id);
        $task = Task::with('source')->find($user_task->task_id);
        $contact = Contact::where(['user_id' => $task->user_id])->first();
//        $user_task = TaskUser::where(['user_id' => $user->id, 'task_id' => $task->id, 'status' => Task::TASK_STATUS_START])->first();
        return json_response([
            'task' => $task,
            'contact' => $contact,
            'user_task' => $user_task,
        ]);
    }

    public function submitOrderInfo(Request $request)
    {
        $user = Auth::user();
        $user_task = TaskUser::find($request->id);
        $user_task->shot = $request->shot;
        $user_task->order_sn = $request->order_sn;
        $user_task->status = Task::TASK_STATUS_PUBLISH;
        $user_task->save();
        return json_response([], '上传订单信息成功');
    }

    public function submitRelease(Request $request)
    {
        $user = Auth::user();
        $user_task = TaskUser::find($request->id);
        $user_task->publish_link = $request->publish_link;
        $user_task->live_shot = $request->live_shot;
        $user_task->live_data_shot = $request->data_shot;
        $user_task->status = Task::TASK_STATUS_AUDITING;
        $user_task->save();
        return json_response([], '上传发布信息成功');
    }

    public function reRelease(Request $request)
    {
        $user_task = TaskUser::find($request->id);
        if ($user_task->status != Task::TASK_STATUS_AUDITING) {
            return json_response([], '任务已通过审核,无法重新提交', 20001);
        } else {
            $user_task->status = Task::TASK_STATUS_PUBLISH;
            $user_task->save();
            return json_response([], '重新提交作品');
        }
    }

    public function releaseInfo(Request $request)
    {
        $user_task = TaskUser::where('id', $request->id)->where('status', Task::TASK_STATUS_PUBLISH)->first();
        return json_response($user_task);
    }
}
