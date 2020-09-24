<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Model;

class Swipe extends Model
{
	
    protected $table = 'swipe';
    public $timestamps = false;

    public function product()
    {
        return $this->belongsTo(Product::class);
    }

}
