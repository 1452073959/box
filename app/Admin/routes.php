<?php

use Illuminate\Routing\Router;
use Illuminate\Support\Facades\Route;
use Dcat\Admin\Admin;

Admin::routes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
], function (Router $router) {

    $router->get('/', 'HomeController@index');
    //分类管理
    $router->resource('cate', 'CategoryController');
    //商品管理
    $router->resource('products', 'ProductController');
    //q券
    $router->resource('ticket', 'DiscountController');
    $router->resource('user', 'UserController');
    //商城
    $router->resource('shop', 'ShopController');
    //任务
    $router->resource('task', 'TaskController');
    //优惠券
    $router->resource('counpon', 'CouponController');
    //兑换
    $router->resource('conversion', 'ConversionController');
    //首页轮播
    $router->resource('swipe', 'SwipeController');
    //订单管理
    $router->resource('order', 'OrderController');
    //自提点设置
    $router->resource('ziti', 'SelfgainController');
});
