<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\Controller;
use Illuminate\Http\Request;
use function EasyWeChat\Kernel\Support\generate_sign;
use Db;
use App\Models\Order;
class OrderController extends Controller
{
    //
    public function pay(Request $request)
    {

        $user = auth('api')->user();
//        dd($user);
        $order = \DB::transaction(function () use ($user, $request) {
            $data = $request->all();
            $order = new Order();
            $order->user_id = $user['id'];
            $order->total_amount = $data['total_amount'];
            $order->address = $data['address'];
            $order->save();
            return $order;
        });
        //支付逻辑
        $payment = \EasyWeChat::payment(); // 微信支付
        $result = $payment->order->unify([
            'body' => '商城订单',
            'out_trade_no' => $order['no'],
            'trade_type' => 'JSAPI',  // 必须为JSAPI
            'openid' => $user['weapp_openid'], // 这里的openid为付款人的openid
            'total_fee' => $order['total_amount'] * 100, // 总价
            'notify_url' => config('app.url') . 'api/notify'
        ]);

// 如果成功生成统一下单的订单，那么进行二次签名
        if ($result['return_code'] === 'SUCCESS') {
            // 二次签名的参数必须与下面相同
            $params = [
                'appId' => 'wx2f09f4c587931bac',
                'timeStamp' => (string)time(),
                'nonceStr' => $result['nonce_str'],
                'package' => 'prepay_id=' . $result['prepay_id'],
                'signType' => 'MD5',
            ];

            // config('wechat.payment.default.key')为商户的key
            $params['paySign'] = generate_sign($params, config('wechat.payment.default.key'));
            $sign=new  Sign();
            $sign->order_id=$order['id'];
            $sign->sign=json_encode($params);
            $sign->save();
            return $params;
        } else {
            return $result;
        }
    }
}
