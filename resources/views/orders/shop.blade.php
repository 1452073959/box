<?php

$order= \App\Models\Order::with('items')->find($model['id']);
?>
        <form  class="form-inline" id="myform{{$order->id}}" style="width: 500px">
            <input type="hidden" name="id" value="{{$order->id}}">
            <div class="form-group">
                <label for="express_company" class="control-label">物流公司</label>
                <select class="form-control" name="express_company" >
                    <option value ="" @if($order->ship_data['express_company']=='') selected @endif >请选择快递</option>
                    <option value ="yuantong" @if($order->ship_data['express_company']=='yuantong') selected @endif >圆通</option>
                    <option value ="yunda" @if($order->ship_data['express_company']=='yunda') selected @endif>韵达</option>
                    <option value ="zhongtong" @if($order->ship_data['express_company']=='zhongtong') selected @endif>中通</option>
                    <option value ="shunfeng" @if($order->ship_data['express_company']=='shunfeng') selected @endif>顺丰</option>
                    <option value ="huitongkuaidi" @if($order->ship_data['express_company']=='huitongkuaidi') selected @endif>百世</option>
                    <option value ="tiantian" @if($order->ship_data['express_company']=='tiantian') selected @endif>天天</option>
                    <option value ="shentong" @if($order->ship_data['express_company']=='shentong') selected @endif>	申通</option>
                    <option value ="youzhengguonei" @if($order->ship_data['express_company']=='youzhengguonei') selected @endif>邮政</option>
                </select>
                {{--<input type="text" id="express_company" name="express_company" value="" class="form-control" placeholder="输入物流公司">--}}
            </div>
            <div class="form-group">
                <label for="express_no" class="control-label">物流单号</label>
                <input type="text" id="express_no" name="express_no" value="{{ $order->ship_data['express_no'] }}" class="form-control" placeholder="输入物流单号" size="20px">

            </div>
            <button type="button" class="btn btn-success" id="ship-btn{{$order->id}}">发货</button>
        </form>
<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script>
    $("#ship-btn{{$order->id}}").click(function () {
        $.ajax({
            type:"post",
            url:"/api/shipments",
            data:$("#myform{{$order->id}}").serialize(),//这里data传递过去的是序列化以后的字符串
            success:function(data){
                layer.msg(data.data);
                // window.location.reload();
            }
        });
    });

</script>
