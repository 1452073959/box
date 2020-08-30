<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Http\Requests\UserAddressRequest;
use App\Models\UserAddress;
class AddressesController extends Controller
{
    //收货地址列表
    public function index(Request $request)
    {

        $user = auth('api')->user();
        $addres=  $user->addresses;
      return $this->success($addres);
    }

    public function store(UserAddressRequest $request)
    {

        $user = auth('api')->user();
        $address=$user->addresses()->create($request->only([
            'province',
            'city',
            'district',
            'address',
            'contact_name',
            'contact_phone',
        ]));
        //设置默认收货地址
        if(request('default')){
            $user->defaultaddress_id=$address['id'];
            $user->save();
        }
        return $this->success($address);
    }
    //修改数据
    public function edit(UserAddress $user_address)
    {
        return $this->success($user_address);
    }
    //修改
    public function update(UserAddress $user_address, UserAddressRequest $request)
    {
        $user_address->update($request->only([
            'province',
            'city',
            'district',
            'address',
            'contact_name',
            'contact_phone',
        ]));
        return $this->success($user_address);
    }
    //删除地址
    public function destroy(UserAddress $user_address)
    {
        $user_address->delete();

        return $this->success($user_address);
    }

    public function default(UserAddress $user_address)
    {
        $user = auth('api')->user();
        $user->defaultaddress_id=$user_address['id'];
        $user->save();
        return $this->success($user);
    }
}
