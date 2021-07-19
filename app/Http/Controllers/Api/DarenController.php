<?php

namespace App\Http\Controllers\Api;

use App\Exceptions\ApiException;
use App\Models\Follow;
use App\Models\HotOpus;
use App\Models\HotRank;
use App\Models\Opus;
use App\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class DarenController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api', ['except' => ['profile', 'opusList']]);
    }

    public function darenList(Request $request)
    {
//        $limit = $request->limit;
//        $list = User::where('role', 0)->orWhere('role', 1)->orderBy('fans','desc')->paginate($limit);
        $list = User::where('role', 0)->orWhere('role', 1)->orderBy('fans','desc')->offset(0)->limit(50)->get();
        return json_response($list);
    }

    public function hotList(Request $request)
    {
        $list = HotRank::orderBy('sort', 'asc')->get();
        return json_response($list);
    }

    public function profile(Request $request)
    {
        $login = Auth::user();
        $user = User::find($request->id);
        if ($login) {
            $user->is_followed = Follow::where(['idol_id' => $request->id, 'follower_id' => $login->id])->count();
        }
        $user->fans = $user->followers()->count();

//        $opusList = Opus::where(['user_id' => $user->id])->orderBy('id', 'desc')->limit(6)->get();
        return json_response(['profile' => $user]);
    }

    public function hotProfile(Request $request)
    {
        $user = HotRank::find($request->id);

        $opusList = HotOpus::where(['hot_rank_id' => $user->id])->orderBy('id', 'desc')->get();
        return json_response(['profile' => $user, 'opuses' => $opusList]);
    }

    public function opusList(Request $request)
    {
        $user = User::find($request->id);
        $limit = $request->limit;
        $list = Opus::where(['user_id' => $user->id])->orderBy('id', 'desc')->paginate($limit);
        return json_response($list);
    }

    public function follow(Request $request)
    {
        $user = Auth::user();
        if ($user->id == $request->idol_id) {
            return json_response([],'你不能关注自己', '4001');
        }
        $followed = Follow::where(['idol_id' => $request->idol_id, 'follower_id' => $user->id])->first();
        if (!$followed) {
            $follow = new Follow();
            $follow->idol_id = $request->idol_id;
            $follow->follower_id = $user->id;
            $follow->status = 1;
            $follow->save();
            $idol = User::find($request->idol_id);
            $idol->fans += 1;
            $idol->save();
        }

        return json_response([], '关注成功');
    }
}
