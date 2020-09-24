<div class="box box-info">
    <div class="box-header with-border">
        <h3 class="box-title">订单流水号：{{ $order->no }}</h3>
        <div class="box-tools">
            <div class="btn-group float-right" style="margin-right: 10px">
                <a href="" class="btn btn-sm btn-default"><i class="fa fa-list"></i> 列表</a>
            </div>
        </div>
    </div>
    <div class="box-body">
        <table class="table table-bordered">
            <tbody>
            <tr>
                <td>买家：</td>
                <td>{{ $order->user->nickname }}</td>
                <td>支付时间：</td>
                <td>{{ $order->paid_at }}</td>
            </tr>
            <tr>
                {{--<td>支付方式：</td>--}}
                {{--<td>{{ $order->payment_method }}</td>--}}
                <td>支付渠道单号：</td>
                <td>{{ $order->payment_no }}</td>
            </tr>

            @if(!empty($order['address']))

            <tr>
                <td>收货地址</td>
                <td colspan="3">{{ $order->address['address'] }} {{ $order->address['contact_name'] }} {{ $order->address['contact_phone'] }}</td>
            </tr>

            @endif
            @if($order->type==2)
                <tr>
                    <td rowspan="{{ $order->items->count() + 1 }}">订单类型</td>
                    <td>商品名称</td>
                    <td>单价</td>
                    {{--<td>数量</td>--}}
                </tr>
                <tr>
                    <td>商城商品 </td>
                    <td>{{$order->shop->titile}} </td>
                    <td>￥{{ $order->shop->price }}</td>
                    {{--<td>{{ $order->amount }}</td>--}}
                </tr>
            @else
            <tr>

                <td rowspan="{{ $order->items->count() + 1 }}">订单类型:         抽盒商品 </td>
                <td>商品名称</td>
                <td>单价</td>
                <td>数量</td>
            </tr>

            @foreach($order->items as $item)
                <tr>
                    <td>{{ $item->product->title }}  {{ $item->productSku->title }} </td>
                    <td>￥{{ $item->product->price }}</td>
                    <td>{{ $item->amount }}</td>
                </tr>
            @endforeach

            @endif
            <tr>
                <td>订单金额：</td>
                <td colspan="3">￥{{ $order->total_amount }}</td>
                <!-- 这里也新增了一个发货状态 -->
                {{--<td>发货状态：</td>--}}
                {{--<td>{{ \App\Models\Order::$shipStatusMap[$order->ship_status] }}</td>--}}
            </tr>
            <!-- 订单发货开始 -->
            <!-- 如果订单未发货，展示发货表单 -->
            @if($order->status == 2)
                @if(!empty($order['selfgain']))
                <tr>
                    <td>自提点：</td>
                    <td>{{ $order->selfgain->name }}</td>
                </tr>
                @endif
                <tr>
                    <td colspan="4">
                        <form  class="form-inline" id="myform">
                            <input type="hidden" name="id" value="{{$order->id}}">
                            <div class="form-group">
                                <label for="express_company" class="control-label">物流公司</label>
                                <input type="text" id="express_company" name="express_company" value="" class="form-control" placeholder="输入物流公司">
                            </div>
                            <div class="form-group">
                                <label for="express_no" class="control-label">物流单号</label>
                                <input type="text" id="express_no" name="express_no" value="" class="form-control" placeholder="输入物流单号">
                            </div>
                            <button type="button" class="btn btn-success" id="ship-btn">发货</button>
                        </form>
                    </td>
                </tr>
            @else
                <!-- 否则展示物流公司和物流单号 -->
                <tr>
                    <td>物流公司：</td>
                    <td>{{ $order->ship_data['express_company'] }}</td>
                    <td>物流单号：</td>
                    <td>{{ $order->ship_data['express_no'] }}</td>

                </tr>
                <tr>
                    <td>发货时间：</td>
                    <td>{{ $order->updated_at }}</td>
                </tr>
            @endif
            <!-- 订单发货结束 -->



            </tbody>
        </table>


    </div>
</div>
<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script>
    $("#ship-btn").click(function () {
        $.ajax({
            type:"post",
            url:"/api/shipments",
            data:$("#myform").serialize(),//这里data传递过去的是序列化以后的字符串
            success:function(data){
                layer.msg(data.data);
                window.location.reload();
            }
        });
    });
</script>
