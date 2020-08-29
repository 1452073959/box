<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Model;

class UserDiscount extends Model
{
	
    protected $table = 'user_discount';
    public $timestamps = false;

    protected $guarded = [];
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function discount()
    {
        return $this->belongsTo(Discount::class,'discount_id','id');
    }

}
