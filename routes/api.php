<?php

use Illuminate\Http\Request;


$api = app(\Dingo\Api\Routing\Router::class);

$api->version('v1', [
//    'prefix' => 'auth',
    'namespace' => 'App\Http\Controllers\Api'
], function ($api) {
    //需要登录
    Route::middleware('jwt.auth')->group(function ($api) {

        //使用后悔卡
        Route::get('regret/{order}', 'Api\OrderController@regret');

        //添加卡
        Route::post('discount', 'Api\Discountuser@add');
        //查看卡
        Route::get('card', 'Api\Discountuser@index');
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

        //摇一摇
        Route::get('teeter/{product}', 'Api\ProductController@teeter');
        //任务列表
        Route::get('task', 'Api\TaskController@list');
        //领取积分
        Route::post('gain', 'Api\TaskController@gain');
        //积分更新
        Route::post('gainupdate', 'Api\Discountuser@gainupdate');
        //优惠券列表
        Route::get('couponlist', 'Api\CouponController@couponlist');
        //优惠券增加
        Route::post('couponadd', 'Api\CouponController@add');
        //我的优惠券列表
        Route::get('coupon', 'Api\CouponController@list');
//        优惠券详情
        Route::get('couponshow', 'Api\CouponController@show');
        //优惠券使用
        Route::post('coupondel', 'Api\CouponController@del');
        //商品下单
        //创建订单,发起支付
        Route::any('pay','Api\OrderController@pay');
        //订单列表
        Route::get('orderlist', 'Api\OrderController@index');
        //订单详情
        Route::get('orders/{order}', 'Api\OrderController@show');
        //订单立即发货
        Route::get('nowshipments/{order}', 'Api\OrderController@nowshipments');
        //用户充值下单
        Route::any('recharge', 'Api\OrderController@recharge');

    });

    Route::get('productshow/{product}', 'Api\ProductController@show');
    // 登录
    $api->post('logincode', 'WechatController@wechat');
    //用户信息
    Route::get('user','Api\WechatController@usershow');
    //刷新token
    $api->get('token', 'WechatController@tokenupdate');
    //分类的接口
    $api->get('cate', 'ProductController@cate');
    //后台商品的接口
    $api->get('homeproduct', 'ProductController@homeproduct');
//    前台
    $api->get('homecate', 'ProductController@admincate');
//    商品支付通知
    $api->any('notify', 'OrderController@notify');
    $api->any('recharge/notify', 'OrderController@rechagenotify');
    //商品列表
    $api->get('product', 'ProductController@index');
    //抽盒推荐
    $api->get('productstick', 'ProductController@stick');
    //商城商品
    $api->get('shop', 'ProductController@shop');
    Route::get('shop/{shop}', 'Api\ProductController@shopshow');
    //首页banner
    $api->get('swipe', 'WechatController@image');
    $api->get('swipetwo', 'WechatController@image2');
    //商城推荐
    $api->get('shopstick', 'ProductController@shopstick');
    //卡列表
    Route::get('cardlist', 'Api\Discountuser@kabiao');

    //订单发货
    $api->post('shipments', 'OrderController@shipments');
    //订单备注
    $api->post('remark', 'OrderController@remark');
    //设置
    Route::get('setting','Api\WechatController@setting');
    //小程序码
    Route::get('ma','Api\WechatController@ma');

    //弹幕
    Route::get('bulletscreen','Api\OrderController@bulletscreen');

//    Route::get('setting', 'Api\WechatController@setting');

    //自提点列表
    $api->get('selfgain', 'OrderController@selfgain');
    //测试路由
    $api->any('cache', 'OrderController@cache');


});
