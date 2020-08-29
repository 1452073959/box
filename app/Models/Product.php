<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{

    //分类
    public function cate()
    {
        //其中第一个参数是关联模型的类名。第二个参数是当前模型类所属表的外键，//第三个参数是关联模型类所属表的主键：
        return $this->belongsTo(Category::class,'cid','id');
    }
    // 与商品SKU关联
    public function skus()
    {
        return $this->hasMany(ProductSku::class);
    }


}
