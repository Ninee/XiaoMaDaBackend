<?php

namespace App\Http\Controllers\Api;

use App\Exceptions\ApiException;
use App\Lib\ErpClient;
use App\Models\Contact;
use App\Models\SmsCode;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Mockery\CountValidator\Exception;
use App\Http\Controllers\Controller;

class AuthController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api', ['except' => ['enroll', 'loginByPassword', 'loginByPhone', 'loginByWeixin']]);
    }

    public function loginByPassword()
    {
        $user = User::where('mobile', request('cellphone'))->where('is_business', 1)->first();
        if (!$user) {
            return json_response('', '用户不存在', 500);
        } else {
            $verify = Hash::check(request('password'), $user->password);
            if (!$verify) {
                return json_response('', '密码错误', 500);
            } else {
                $token = auth()->login($user);
                //查询联系方式
                $contact = Contact::where('user_id', $user->id)->first();
                $userInfo = [
                    'nickname' => $user->nickname,
                    'contact' => $contact
                ];
                return json_response(compact('token', 'userInfo'));
            }
        }

    }

    public function enroll()
    {
        User::create([
            'mobile' => request('cellphone'),
            'password' => Hash::make(request('password')),
            'is_business' => 1,
            'nickname' => substr_replace(request('cellphone'), '****', 3, 4),
        ]);
        return json_response([], '注册成功');
    }

    public function loginByPhone()
    {
        $verification['mobile'] = request('mobile');
        $verification['code'] = request('code');
        //先从erp查询是否有该会员信息
        $erp = new ErpClient();
        $res = $erp->getVip(['mobile' => request('mobile')]);
        if ($res->success == false) {
            throw new ApiException('您还不是我们的会员', 404);
        }

        if (!SmsCode::where($verification)->first()) {
            throw new ApiException('短信验证码错误', 404);
        }
        try {
            $user = User::firstOrCreate(['mobile' => request('mobile')], [
                'name' => substr_replace(request('mobile'), '****', 3, 4),
            ]);
            $token = auth()->login($user);
        } catch (Exception $e) {
            throw new ApiException('授权失败', 500);
        }
//        return $this->respondWithToken($token);
        return json_response([
            'mobile'=> $user->mobile,
            'access_token' => $token,
        ]);
    }

    public function loginByWeixin(Request $request)
    {
        $code = $request->code;
        $userInfo = $request->userInfo;
        $miniprogram = \EasyWeChat::miniProgram();
        $session = $miniprogram->auth->session($code);
        $openid = $session['openid'];
        try {
            $user = User::updateOrCreate(['openid' => $openid], [
                'nickname' => $userInfo['nickName'],
                'avatar' => $userInfo['avatarUrl'],
                'gender' => $userInfo['gender'],
            ]);
            $token = auth()->login($user);
            return json_response([
                'userInfo' => $user,
                'token' => $token
            ]);
        } catch (Exception $e) {
            throw new ApiException('授权失败', 500);
        }

    }

    public function me()
    {
        return response()->json(auth()->user());
    }

    public function logout()
    {
        auth()->logout();

        return response()->json(['message' => 'Successfully logged out']);
    }

    public function refresh()
    {
        return $this->respondWithToken(auth()->refresh());
    }

    protected function respondWithToken($token)
    {
        return response()->json([
            'access_token' => $token,
            'token_type' => 'Bearer',
            'expires_in' => auth()->factory()->getTTL() * 60
        ]);
    }
}
