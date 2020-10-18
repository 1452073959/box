<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Model;

class Shop extends Model
{
	
    protected $table = 'shop';
    public function order()
    {
        return $this->hasMany(Order::class);
    }
}
