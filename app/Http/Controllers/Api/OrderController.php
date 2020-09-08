<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\Controller;
use Illuminate\Http\Request;
use function EasyWeChat\Kernel\Support\generate_sign;
use Db;
use App\Models\Order;
use App\Models\ProductSku;
use App\Models\Product;
use Cache;
class OrderController extends Controller
{
    //
    public function pay(Request $request)
    {
        $user = auth('api')->user();
//        dd($user);
        $order = \DB::transaction(function () use ($user, $request) {


            if($request->input('type')==2){
                $data = $request->all();
                $order = new Order();
                $order->user_id = $user['id'];
                $order->total_amount = $data['total_amount'];
                $order->address = $data['address'];
                $order->type = $data['type'];
                $order->shop_id = $data['shop_id'];
                $order->save();
            }else{
                $data = $request->all();
                $order = new Order();
                $order->user_id = $user['id'];
                $order->total_amount = $data['total_amount'];
                $order->address = $data['address'];
                $order->type = $data['type'];
                $order->save();

                $totalAmount = 0;
                $items = $request->input('items');
                // 遍历用户提交的 商品数组
                foreach ($items as $k => $v) {
                    $sku  = ProductSku::find($v['sku_id']);
                    $item = $order->items()->make([
                        'amount' => $v['amount'],
                        'price' => $sku->price,
                    ]);
                    $item->product()->associate($sku->product_id);
                    $item->productSku()->associate($sku);
                    $item->save();
                    $totalAmount += $sku->price * $v['amount'];
                }
            }
//            $this->dispatch(new CloseOrder($order, 3600));
            return $order;
        });
//        dd($order);
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
//dd($result);
// 如果成功生成统一下单的订单，那么进行二次签名
        if ($result['return_code'] === 'SUCCESS') {
            // 二次签名的参数必须与下面相同
            $params = [
                'appId' => 'wx002d9cfde7973324',
                'timeStamp' => (string)time(),
                'nonceStr' => $result['nonce_str'],
                'package' => 'prepay_id=' . $result['prepay_id'],
                'signType' => 'MD5',
            ];

            // config('wechat.payment.default.key')为商户的key
            $params['paySign'] = generate_sign($params, config('wechat.payment.default.key'));
            return $params;
        } else {
            return $result;
        }
    }

    public function notify()
    {
        Cache::put('key1', date('Y-m-d H:i:s', time()));
        $app = \EasyWeChat::payment(); // 微信支付
        $response = $app->handlePaidNotify(function ($message, $fail) {
            //数据库找到订单
            Cache::put('key', $message);
            $order = Order::where('no', $message['out_trade_no'])->first();
            if (!$order || $order['paid_at']) { // 如果订单不存在 或者 订单已经支付过了
                return; // 告诉微信，我已经处理完了，订单没找到，别再通知我了
            }
            if ($message['return_code'] === 'SUCCESS') { // return_code 表示通信状态，不代表支付状态
                // 用户是否支付成功
                $order->paid_at = date('Y-m-d H:i:s', time());; // 更新支付时间为当前时间
                $order->status = 2;
                $order->payment_no = $message['transaction_id'];
            } else {
                $order->status = 0;
                return $fail('通信失败，请稍后再通知我');
            }
            $order->save();

        });
        return $response;
    }


    //订单列表
    public function index(Request $request)
    {
        $user = auth('api')->user();

        $where = [];
        if (request('status')) {
            $where = ['status' => request('status')];
        }

        if (request('type')) {
            $where = ['type' => request('type')];
        }
        $orders = Order::query()
            // 使用 with 方法预加载，避免N + 1问题
            ->with(['items.product', 'items.productSku','shop'])
            ->where('user_id', $user['id'])
            ->where($where)
            ->orderBy('created_at', 'desc')
            ->paginate(16);
        return $this->success($orders);
    }

    //订单详情
    public function show(Order $order, Request $request)
    {
        $show=  $order->load(['items.productSku', 'items.product','shop']);
        return $this->success($show);
    }


    //测试方法
    public function cache()
    {
        $value = Cache::get('key');
        $value1 = Cache::get('key1');
        dump($value);
        dump($value1);
    }


}