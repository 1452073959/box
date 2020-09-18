<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Model;

class Order extends Model
{

    protected $table = 'order';
    protected $guarded = [];

    protected $casts = [
        'address'   => 'json',
        'ship_data' => 'json',
    ];
    protected $dates = [
        'paid_at',
    ];

    //订单流水号
    protected static function boot()
    {
        parent::boot();
        // 监听模型创建事件，在写入数据库之前触发
        static::creating(function ($model) {
            // 如果模型的 no 字段为空
            if (!$model->no) {
                // 调用 findAvailableNo 生成订单流水号
                $model->no = static::findAvailableNo();
                // 如果生成失败，则终止创建订单
                if (!$model->no) {
                    return false;
                }
            }
        });
    }
    //订单用户
    public function user()
    {
        return $this->belongsTo(User::class);
    }
    //订单商品
    public function items()
    {
        return $this->hasMany(OrderItem::class);
    }
    //生成订单号的方法
    public static function findAvailableNo()
    {
        // 订单流水号前缀
        $prefix = date('YmdHis');
        for ($i = 0; $i < 10; $i++) {
            // 随机生成 6 位的数字
            $no = $prefix.str_pad(random_int(0, 999999), 6, '0', STR_PAD_LEFT);
            // 判断是否已经存在
            if (!static::query()->where('no', $no)->exists()) {
                return $no;
            }
        }
        \Log::warning('find order no failed');

        return false;
    }
    //
    public function shop()
    {
        return $this->belongsTo(Shop::class,'shop_id','id');
    }

    public function getAddressAttribute($extra)
    {
        return json_decode($extra, true);
    }

    public function setAddressAttribute($value)
    {
        $this->attributes['address'] = json_encode($value);
    }
    //
    public function sign()
    {
        return $this->hasOne(Sign::class,'order_id','id');
    }
}
