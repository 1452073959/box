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
