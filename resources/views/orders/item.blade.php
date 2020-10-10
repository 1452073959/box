
<?php

$order= \App\Models\Order::with('items')->find($model['id']);
?>

    @foreach($order->items as $item)
       {{ $item->product->title }}  {{ $item->productSku->title }}
    @endforeach
