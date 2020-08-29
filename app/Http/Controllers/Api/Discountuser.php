<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Product;
use App\Models\UserDiscount;
class Discountuser extends Controller
{
    //添加商品到购物车
    public function add(Request $request)
    {
        $user = auth('api')->user();

//        dd($user);
        $skuId  = $request->input('discount_id');
        $amount = $request->input('amount');
//        dd($user->userDiscount()->get());
        // 从数据库中查询该商品是否已经在购物车中
        if ($cart = $user->userDiscount()->where('discount_id', $skuId)->first()) {

            // 如果存在则直接叠加商品数量
            $cart->update([
                'amount' => $cart->amount + $amount,
            ]);
        } else {

            // 否则创建一个新的购物车记录

            $cart = new UserDiscount(['amount' => $amount]);
            $cart->user()->associate($user);
            $cart->discount()->associate($skuId);
            $cart->save();

        }

        return $this->success($cart);
    }
    //查看购物车
    public function index(Request $request)
    {
        $user = auth('api')->user();
        $cartItems = $user->userDiscount()->with(['discount'])->get();

        foreach ($cartItems as $k => $v) {
            $totalprice = 0;
            $totalprice += $v['product']['price'] * $v['amount'];
            $cartItems[$k]['totalprice'] =$totalprice;
        }
        return $this->success($cartItems);
    }
    //移除购物车
    public function del( )
    {
        $data=request('product_id');
        $user = auth('api')->user();
        $res= CartItem::where('user_id',$user['id'])->whereIn('product_id',$data)->delete();
        return $this->success($res);
    }

    //购物车编辑
    public function update(Request $request )
    {
        $data=request('product_id');
        $amount = $request->input('amount');
        $user = auth('api')->user();
        $res= CartItem::where('user_id',$user['id'])->where('product_id',$data)->update([
            'amount' => $amount,
        ]);
        $totalprice = 0;
        $sku = Product::find($data);
        $totalprice += $sku->price * $amount;
        return $this->success(['totalprice'=>$totalprice]);
    }
}
