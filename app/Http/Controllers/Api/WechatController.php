<?php

namespace App\Http\Controllers\Api;


use App\Models\Swipetwo;
use Illuminate\Http\Request;
use App\Http\Controllers\Api\Controller;
use EasyWeChat\Factory;
use function EasyWeChat\Kernel\Support\generate_sign;
use Cache;
use App\Models\User;
use Storage;
use Illuminate\Support\Str;
use App\Models\Swipe;
use App\Models\Settings;
class WechatController extends Controller
{
    //登陆

    public function wechat(Request $request)
    {
        $data = $request->all();
//        dd($data);
        $app = \EasyWeChat::miniProgram();
        $wq = $app->auth->session($data['code']); // $code 为wx.login里的code
//        dd($wq);
        if (isset($wq['errcode'])) {
            return $this->failed('code已过期或不正确');
        }
        $weappOpenid = $wq['openid'];
        $weixinSessionKey = encrypt( $wq['session_key']);
        $user = User::where('weapp_openid', $weappOpenid)->first();
        //没有，就注册一个用户
        if (!$user) {
            $user = new User();
            $user->weapp_openid = $weappOpenid;
            $user->nickname = $data['userInfo']['nickName'];
            $user->weapp_avatar = $data['userInfo']['avatarUrl'];
            $user->save();
        }else{
            $user->weapp_openid=$weappOpenid;
            $user->nickname=$data['userInfo']['nickName'];
            $user->weapp_avatar=$data['userInfo']['avatarUrl'];
            $user->save();
        }

//        $token= auth('api')->login($user);
        $token =auth('api')->tokenById($user['id']);
        return  $this->success($this->respondWithToken($token));
//        return $this->success(['openid'=>$weappOpenid,'token'=>$user['token']]);
    }

    //刷新token
    public function tokenupdate()
    {
        $token = auth('api')->refresh();
        return $this->success($this->respondWithToken($token)) ;
    }
    //用户信息
    public function usershow(Request $request)
    {
//        dd($this->user);
        $user = auth('api')->user();
        return $this->success($user);
    }

    public function cache()
    {

        $value = Cache::get('key');
        $value1 = Cache::get('key1');
        dump($value);
        dump($value1);
    }

    public function ma(Request $request)
    {
        $app = \EasyWeChat::miniProgram();
//        $user = auth('api')->user();
//        $str=$user['id'];
//        dump($str);

        if ($request->has('product_id')) {
            $str=$request->input('product_id');
            $response =  $app->app_code->getUnlimit($str,[ 'page'  => 'pages/shop/shopinfo']);
            // 保存小程序码到文件
            if ($response instanceof \EasyWeChat\Kernel\Http\StreamResponse) {
                $filename = $response->save(public_path('uploads'));
                $a=   Storage::disk('admin')->url($filename);
               return $this->success($a);
            }

            return $response;
        }else{
            return $this->success('传入商品id');
        }
    }


    public function image()
    {
        $data=Swipe::all();
        return $this->success($data);
    }

    public function image2()
    {
        $data=Swipetwo::all();
        return $this->success($data);
    }

    //设置
    public function setting()
    {
        $data=Settings::first();
        return  $this->success($data);
    }







}
