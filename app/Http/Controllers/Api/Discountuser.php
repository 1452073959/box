<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\Controller;
use App\Models\Discount;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Product;
use App\Models\UserDiscount;

//卡券
class Discountuser extends Controller
{

    public function add(Request $request)
    {
        $user = auth('api')->user();
        $skuId  = $request->input('discount_id');
        $amount = $request->input('amount');
//        dd($user->userDiscount()->get());
        // 从数据库中是否已经存在
        if ($cart = $user->userDiscount()->where('discount_id', $skuId)->first()) {

            // 如果存在则直接叠加数量
            $cart->update([
                'amount' => $cart->amount + $amount,
            ]);
        } else {

            // 否则创建一个新的记录
            $cart = new UserDiscount(['amount' => $amount]);
            $cart->user()->associate($user);
            $cart->discount()->associate($skuId);
            $cart->save();

        }

        return $this->success($cart);
    }
    //查看卡
    public function index(Request $request)
    {
        $user = auth('api')->user();
        $cartItems = $user->userDiscount()->with(['discount'])->get();
        return $this->success($cartItems);
    }
    //卡的列表
    public function kabiao( )
    {
        $res= Discount::all();
        return $this->success($res);
    }

    //用户积分更新
    public function gainupdate(Request $request)
    {
        $user = auth('api')->user();
        $user = User::find($user['id']);
        if($user['integral']<=10){
            return $this->success('积分不足');
        }
        $user->balance=$request->input('balance',$user['balance']);
        $user->integral=$request->input('integral',$user['integral']);
        $user->save();
        return $this->success($user);
    }
}
