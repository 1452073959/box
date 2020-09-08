<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Model;

class OrderItem extends Model
{
	
    protected $table = 'order_items';
    public $timestamps = false;
    protected $guarded = [];
    //商品
    public function product()
    {
        return $this->belongsTo(Product::class,'product_id','id');
    }

    public function productSku()
    {
        return $this->belongsTo(ProductSku::class);
    }

    //订单
    public function order()
    {
        return $this->belongsTo(Order::class);
    }
}
