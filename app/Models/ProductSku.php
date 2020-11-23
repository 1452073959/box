<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Model;
use App\Exceptions\InternalException;
class ProductSku extends Model
{
	
    protected $table = 'product_skus';
    public $timestamps = false;
    protected $guarded = [];
    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    public function decreaseStock($amount)
    {
        if ($amount < 0) {
            abort(40000, '减库存不能为0.');
        }

        return $this->where('id', $this->id)->where('stock', '>=', $amount)->decrement('stock', $amount);
    }

    public function addStock($amount)
    {
        if ($amount < 0) {
            abort(40000, '加库存不能为0.');
        }
        $this->increment('stock', $amount);
    }
}
