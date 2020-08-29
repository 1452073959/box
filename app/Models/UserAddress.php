<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Model;

class UserAddress extends Model
{
	
    protected $table = 'user_addresses';
    public $timestamps = false;
    protected $guarded = [];
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function getFullAddressAttribute()
    {
        return "{$this->province}{$this->city}{$this->district}{$this->address}";
    }
}
