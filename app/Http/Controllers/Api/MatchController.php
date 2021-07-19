<?php

namespace App\Http\Controllers\Api;

use App\Exceptions\ApiException;
use App\Models\MatchEnroll;
use App\Models\MatchSetting;
use App\Models\MatchZone;
use App\Models\Track;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class MatchController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api');
    }

    public function zoneList()
    {
        $zones = MatchZone::all();
        $setting = MatchSetting::find(1);
        $tracks = Track::all();
        return json_response(['zones' => $zones, 'rules' => $setting->rules, 'tracks' => $tracks]);
    }
    public function enroll(Request $request)
    {
        $user = Auth::user();
        $exist = MatchEnroll::where(['user_id' => $user->id])->first();
        if ($exist) {
            throw new ApiException('你已经报过名啦');
        } else {
            DB::beginTransaction();
            try {
                $enroll = new MatchEnroll();
                $enroll->user_id = $user->id;
                $enroll->name = $request->name;
                $enroll->phone = $request->phone;
                $enroll->zone_id = $request->zone;
                $enroll->track_id = $request->track;
                $enroll->save();
                $user->is_player = 1;
                $user->save();
                DB::commit();
                return json_response([], '报名成功');
            } catch (\Exception $e) {
                DB::rollBack();
                throw new ApiException($e->getMessage(), 500);
            }

        }
    }
    public function enrollResult()
    {
        $user = Auth::user();
        $enroll = MatchEnroll::where(['user_id' => $user->id])->first();
        if (!$enroll) {
            throw new ApiException('你还没报名');
        }
        $zone = MatchZone::find($enroll->zone_id);
        return json_response(compact('zone'));
    }
}
