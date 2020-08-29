<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Model;

class ProductSku extends Model
{
	
    protected $table = 'product_skus';
    public $timestamps = false;
    protected $guarded = [];
    public function product()
    {
        return $this->belongsTo(Product::class);
    }
}