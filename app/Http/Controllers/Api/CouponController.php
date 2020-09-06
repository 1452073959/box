<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\ApiController;
use Illuminate\Http\Request;
use Carbon\Carbon;

class CouponController extends Controller
{
    //优惠券领取
    public function add(Request $request)
    {
        $user = auth('api')->user();
        $counpon_id = $request->input('counpon_id');
        $user->coupon()->attach($counpon_id, ['not_before' => time(), 'not_after' => strtotime("+1 week")]);
        return $this->success('领取成功');
    }

    public function list()
    {
        $user = auth('api')->user();
        $task = $user->coupon()->with('coupon')->get();
        return $this->success($task);
    }

    //优惠券使用
    public function del(Request $request)
    {
        $user = auth('api')->user();
//        dd($user);
        $id = $request->input('id');

        $coupon = $user->coupon()->with('coupon')->where('id', $id)->first();

        if ($coupon['not_before'] && $coupon['not_before'] >time()) {
            return $this->failed('该优惠券现在还不能使用');
        }
        if ($coupon['not_after'] && $coupon['not_after'] < time()) {
            return $this->failed('该优惠券已过期');
        }
        $user->coupon()->with('coupon')->where('id', $id)->update(['status' => 3]);
        return $this->success('使用成功');
    }
}
