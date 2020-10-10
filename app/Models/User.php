<?php

namespace App\Models;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Tymon\JWTAuth\Contracts\JWTSubject;
class User extends Authenticatable implements JWTSubject
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
//jwt
    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    public function getJWTCustomClaims()
    {
        return [];
    }

    //地址
    public function addresses()
    {
        return $this->hasMany(UserAddress::class);
    }
//    卡包
    public function userDiscount()
    {
        return $this->hasMany(UserDiscount::class);
    }

    //优惠券
    public function coupon()
    {
        return $this->belongsToMany(Coupon::class,'user_coupon')->withPivot(['status','not_before','not_after'])
            ->withTimestamps();
    }
    //
    public function usercoupon()
    {
        return $this->hasMany(UserCoupon::class);
    }
    public function task()
    {
        return $this->belongsToMany(Task::class, 'user_task')->withPivot('status')
            ->withTimestamps();
    }

    protected static function boot()
    {
        parent::boot();
        // 监听模型创建事件，在写入数据库之前触发
        static::created(function ($model) {
            $task=Task::all();
            foreach ($task as $k=>$v)
            {
                if ($model->task()->find($v->id)) {
                    return [];
                }
                $model->task()->attach($v);
            }
        });
        static::updated(function($model) {
            $task=Task::all();
            foreach ($task as $k=>$v)
            {
                if ($model->task()->find($v->id)) {
                    return [];
                }
                $model->task()->attach($v);
            }
        });
        static::created(function ($model) {
            $discount=Discount::all();
            foreach ($discount as $k=>$v){
                $cart = new UserDiscount(['amount' => 0]);
                $cart->user()->associate($model['id']);
                $cart->discount()->associate($v['id']);
                $cart->save();
            }
        });

    }
    ///用户充值
    ///
    public function recharge()
    {
        return $this->hasMany(Recharge::class);
    }

    //p



}
