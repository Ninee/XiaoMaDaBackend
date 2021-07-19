<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('throttle:10')->get('common/sms', 'CommonController@sendSMS');
Route::get('test', 'CommonController@test');
Route::get('/product/filter', 'ProductController@index');
Route::get('/product/virtual', 'ProductController@virtual');
Route::get('/product', 'ProductController@detail');
Route::get('/common/configs', 'CommonController@configs');
Route::get('/common/about', 'CommonController@about');
Route::get('/common/banners', 'CommonController@banners');
Route::get('/third/updateOrder', 'CommonController@updateOrder');

Route::group(['namespace' => 'Api'], function ($router) {
   Route::get('/task/index', 'TaskController@index');
   Route::get('/task/detail', 'TaskController@detail');
});

Route::group([
    'namespace' => 'Api',
    'prefix' => '/payment'
], function () {
    Route::post('/notify/alipay', 'PaymentController@alipay');
    Route::post('/notify/wechat', 'PaymentController@wechat');
    Route::post('/notify/ios', 'PaymentController@ios')->middleware('auth:api');
});

Route::group([
    'middleware' => 'api',
    'namespace' => 'Api',
    'prefix' => 'business'
], function ($router) {
    Route::get('/task/list', 'BusinessController@taskList');
    Route::post('/storage/upload', 'BusinessController@uploadImage');
    Route::get('/task/category', 'BusinessController@category');
    Route::post('/task/create', 'BusinessController@taskCreate');
    Route::post('/contact/create', 'BusinessController@contactCreate');
});

Route::group([
    'middleware' => 'api',
    'namespace' => 'Api',
], function ($router) {
    Route::post('/user/enroll', 'AuthController@enroll')->name('enroll');
    Route::post('/user/login', 'AuthController@loginByPassword')->name('login_by_password');
    Route::post('/auth/login_by_weixin', 'AuthController@loginByWeixin')->name('login_by_weixin');
    Route::post('logout', 'AuthController@logout');
    Route::post('refresh', 'AuthController@refresh');
    Route::post('me', 'AuthController@me');

    Route::get('/user/profile', 'UserController@profile');
    Route::get('/user/get_upload_token', 'UserController@getUploadToken');
    Route::post('/user/profile/edit', 'UserController@profileEdit');
    Route::post('/user/add_opus', 'UserController@addOpus');
    Route::get('/user/opus_list', 'UserController@opusList');
    Route::post('/user/opus_del', 'UserController@opusDel');
    Route::get('/user/my_task_list', 'UserController@myTaskList');

    Route::get('/task/list', 'TaskController@taskList');
    Route::get('/task/apply', 'TaskController@apply');
    Route::get('/task/start', 'TaskController@start');
    Route::post('/task/submit_order_info', 'TaskController@submitOrderInfo');
    Route::post('/task/submit_release', 'TaskController@submitRelease');
    Route::post('/task/re_release', 'TaskController@reRelease');
    Route::get('/task/release_info', 'TaskController@releaseInfo');

    Route::get('/user/integral', 'UserController@integral');
    Route::post('/user/addOrder', 'UserController@addOrder');
    Route::post('/user/addOrder/virtual', 'UserController@addVirtualOrder');
    Route::post('/user/orderCash', 'UserController@orderCash');

    Route::get('/user/address/detail', 'UserController@addressDetail');
    Route::post('/user/address/save', 'UserController@address');
    Route::get('/user/address_list', 'UserController@addressList');
    Route::post('/user/address/delete', 'UserController@addressDel');

    Route::get('/user/orderList', 'UserController@orderList');
    Route::post('/user/shiming', 'UserController@shiming');
    Route::get('/user/shiming_info', 'UserController@shimingInfo');
    Route::post('/user/bind_phone', 'UserController@bindPhone');
    Route::post('/user/bind_alipay', 'UserController@bindAlipay');
    Route::post('/user/withdraw', 'UserController@withdraw');
    Route::get('/user/record', 'UserController@record');
    Route::get('/user/notifications', 'UserController@allNotifications');
    Route::get('/user/notification/unread', 'UserController@unread');
    Route::post('/user/notification/read', 'UserController@read');

    Route::get('/match/get_zone_list', 'MatchController@zoneList');
    Route::post('/match/enroll', 'MatchController@enroll');
    Route::get('/match/enroll_result', 'MatchController@enrollResult');

    Route::get('/daren/list', 'DarenController@darenList');
    Route::get('/daren/profile', 'DarenController@profile');
    Route::get('/daren/more_opus', 'DarenController@opusList');
    Route::post('/daren/follow', 'DarenController@follow');
    Route::get('/hot/list', 'DarenController@hotList');
    Route::get('/hot/profile', 'DarenController@HotProfile');

    Route::post('order/checkout', 'OrderController@checkout');
    Route::post('order/submit', 'OrderController@submit');
    Route::post('order/prepay', 'OrderController@prepay');
    Route::get('order/list', 'OrderController@orderList');


    Route::get('/sys/vip_goods', 'SysController@vipGoods');
    Route::get('/sys/try_goods', 'SysController@tryGoods');
    Route::get('/sys/try_good/detail', 'SysController@tryGoodDetail');
});
