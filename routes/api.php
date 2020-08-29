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

$api = app(\Dingo\Api\Routing\Router::class);

$api->version('v1', [
//    'prefix' => 'auth',
    'namespace' => 'App\Http\Controllers\Api'
], function ($api) {
    //需要登录
    Route::middleware('jwt.auth')->group(function ($api) {
//        Route::get('user', 'Api\WechatController@user');
        //

    });
    // 登录
    $api->post('logincode', 'WechatController@wechat');
    //用户信息
    Route::get('user','Api\WechatController@usershow');
    //刷新token
    $api->get('token', 'WechatController@tokenupdate');

    //收货地址列表
    Route::get('addresses', 'Api\AddressesController@index');
    //新增收货地址
    Route::post('addresses', 'Api\AddressesController@store');
    //修改收货地址
    Route::get('addresses/{user_address}', 'Api\AddressesController@edit');
    //
    Route::post('addresses/{user_address}', 'Api\AddressesController@update');
    //删除收货地址
    Route::get('deladdresses/{user_address}', 'Api\AddressesController@destroy');
    //设置默认收货地址
    Route::get('defaultaddresses/{user_address}', 'Api\AddressesController@default');

});
