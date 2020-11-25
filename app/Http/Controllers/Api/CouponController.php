<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\ApiController;
use App\Models\Coupon;
use Illuminate\Http\Request;
use Carbon\Carbon;

class CouponController extends Controller
{
    //优惠券领取
    public function add(Request $request)
    {
        $user = auth('api')->user();

        if ($request->input('counpon_id')) {
            $counpon_id = $request->input('counpon_id');
//            dd($counpon_id);
            $user->coupon()->attach($counpon_id, ['not_before' => time(), 'not_after' => strtotime("+1 week")]);
            return $this->success('领取成功');
        }else{
            return $this->success('错误');
        }
    }


    public function new()
    {
//        $user = auth('api')->user();
//        $user->coupon()->attach(2, ['not_before' => time(), 'not_after' => strtotime("+1 month")]);
//        return $this->success('领取成功');
    }

    //
    public function couponlist()
    {
        $data= Coupon::all();
        return $this->success($data);
    }
    public function list(Request $request )
    {
        $user = auth('api')->user();
        $where=[];
        if ($request->input('status')) {
            $where[] = ['status', $request->input('status')];
        }
        $task = $user->usercoupon()->with('coupon')->where($where)->get();
        return $this->success($task);
    }

    public function  show(Request $request)
    {
        $user = auth('api')->user();
        $id = $request->input('id');
        $coupon = $user->usercoupon()->with('coupon')->where('id', $id)->first();
        return $this->success($coupon);
    }


    //优惠券使用
    public function del(Request $request)
    {
        $user = auth('api')->user();

        $id = $request->input('id');

        $coupon = $user->usercoupon()->with('coupon')->where('id', $id)->first();
//        dd($coupon);
        if ($coupon['not_before'] && $coupon['not_before'] >time()) {
            return $this->success('该优惠券现在还不能使用');
        }
        if ($coupon['not_after'] && $coupon['not_after'] < time()) {
            return $this->success('该优惠券已过期');
        }
       $res= $user->usercoupon()->with('coupon')->where('id', $id)->update(['status' => 3]);
       if($res){
           return $this->success('使用成功');
       }else{
           return $this->success('错误');
       }

    }
}
