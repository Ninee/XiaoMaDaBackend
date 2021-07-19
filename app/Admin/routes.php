<?php

use Illuminate\Routing\Router;

Admin::registerAuthRoutes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
], function (Router $router) {

    $router->get('/', 'HomeController@index');
    $router->resource('virtuals', 'VirtualController');
    $router->resource('about', 'AboutController');
    $router->resource('cash', 'CashOrderController');
    $router->resource('banners', 'BannerController');
    $router->resource('articles', 'ArticleController');
    $router->resource('tasks', TaskController::class);
    $router->resource('match-tasks', MatchTaskController::class);
    $router->resource('good-sources', GoodSourceController::class);
    $router->resource('require-types', RequireTypeController::class);
    $router->resource('users', UserController::class);
    $router->get('/task_user/clear/{id}', 'TaskUserController@clear');
    $router->get('/task_user/confirm/{id}', 'TaskUserController@confirm');
    $router->post('/order/express', 'VipOrderController@express');
    $router->get('/vistor/upgrade/{id}', 'VisitorController@upgrade');
    $router->resource('task-users', TaskUserController::class);
    $router->resource('match-zones', MatchZoneController::class);
    $router->resource('match-enrolls', MatchEnrollController::class);
    $router->resource('vip-goods', VipGoodController::class);
    $router->resource('try-goods', TryGoodController::class);
    $router->resource('settings', SettingController::class);
    $router->resource('match-settings', MatchSettingController::class);
    $router->resource('vip-orders', VipOrderController::class);
    $router->resource('try-orders', TryOrderController::class);
    $router->resource('contacts', ContactController::class);
    $router->resource('tracks', TrackController::class);
    $router->resource('visitors', VisitorController::class);
    $router->resource('hot-ranks', HotRankController::class);
    $router->resource('platforms', PlatformController::class);
    $router->resource('tab-menus', TabMenuController::class);
});