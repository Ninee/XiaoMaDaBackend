<?php

namespace App\Http\Controllers\Api;

use App\Models\Contact;
use App\Models\GoodSource;
use App\Models\Platform;
use App\Models\RequireType;
use App\Models\Task;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Encore\Admin\Form\Field\ImageField;
use Encore\Admin\Form\Field\UploadField;

class BusinessController extends Controller
{
    use ImageField;
    use UploadField;

    public function __construct()
    {
        $this->middleware('auth:api', ['except' => ['']]);
        $this->initStorage();
    }

    public function verify()
    {
        return Auth::user()->is_business;
    }

    public function uploadImage(Request $request)
    {
        $file = $request->file('file');
        $this->uniqueName();
        $this->name = $this->getStoreName($file);
        $this->storagePermission(true);
        $path = $this->upload($file);
        return json_response(['url' => $this->storage->url($path)], '上传成功');
    }

    public function taskList(Request $request)
    {
        $user = Auth::user();
        $list = Task::with('source')->with('platform')->with('requireType')->where('user_id', $user->id)->orderBy('created_at', 'desc')->paginate($request->limit);
        return json_response($list);
    }

    public function category()
    {
        $source = GoodSource::all();
        $platform = Platform::all();
        $requireType = RequireType::all();
        $mode = [
            ['id' => Task::TASK_MODE_AUDITING, 'title' => Task::TASK_MODE_TXT[Task::TASK_MODE_AUDITING]],
            ['id' => Task::TASK_MODE_AUTO, 'title' => Task::TASK_MODE_TXT[Task::TASK_MODE_AUTO] ],
        ];
        return json_response(compact('source', 'platform', 'requireType', 'mode'));
    }

    public function taskCreate(Request $request)
    {
        if (!$this->verify()) {
            json_response(null, '你没有权限', 409);
        }
        $task = new Task();
        $task->user_id = Auth::user()->id;
        $task->good_img = $request->picUrl;
        $task->good_name = $request->name;
        $task->good_source = $request->sourceId;
        $task->buy_address = $request->buyAddress;
        $task->good_price = $request->retailPrice;
        $task->sale_rate = $request->saleRate;
        $task->reward = $request->reward;
        $task->platform_id = $request->platformId;
        $task->require_type_id = $request->typeId;
        $task->task_desc = $request->detail;
        $task->task_type = 2;
        $task->mode = $request->modeId;
        $task->limit_number = $request->counter;
        $task->save();
        return json_response(null, '创建成功');
    }

    public function contactCreate(Request $request)
    {
        if (!$this->verify()) {
            json_response(null, '你没有权限', 409);
        }
        $contact = Contact::updateOrCreate(['user_id' => Auth::user()->id], $request->all());
        return json_response(compact('contact'), '更新成功');
    }
}
