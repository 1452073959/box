<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Model;

class UserCoupon extends Model
{
	
    protected $table = 'user_coupon';
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function coupon()
    {
        return $this->belongsTo(Coupon::class,'coupon_id','id');
    }
}
