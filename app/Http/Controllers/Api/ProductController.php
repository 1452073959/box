<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\Controller;
use App\Models\Category;
use App\Models\ProductSku;
use App\Models\Shop;
use App\Models\UserDiscount;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\User;
use Cache;
use Illuminate\Support\Facades\Redis;
use Illuminate\Support\Arr;
class ProductController extends Controller
{
    //分类别表
    public function cate(Request $request)
    {
//        $q = $request->get('q');
//        return Category::where('title', 'like', "%$q%")->get();
        $comments = Category::with('childrenCategories')->where('parent_id',0)->get();

        return $comments;

    }
    //商品添加分类(去除目录)
    public function productcate(Request $request)
    {
//        $data= Category::all();
//        return $data;
        $data= Category::where('parent_id','!=',0)->get();
        return $data;
    }
    public function admincate(Request $request)
    {
        $data= Category::where('parent_id',0)->get();
        return $this->success($data);
    }

    public function homeproduct()
    {
         $data=Product::all();
         foreach($data as $k=>$v)
         {
             $data[$k]['text']=$v['title'];
         }

        return $data;
    }



    //商品列表
    public function index(Request $request)
    {
        $builder = Product::query()->where('status', 1);
        // 判断是否有提交 search 参数，如果有就赋值给 $search 变量
        // search 参数用来模糊搜索商品
        if ($search = $request->input('search', '')) {
            $user = auth('api')->user();
            Redis::lpush($user['weapp_openid'],$search);
            $like = '%'.$search.'%';
            // 模糊搜索商品标题、商品详情、SKU 标题、SKU描述
            $builder->where(function ($query) use ($like) {
                $query->where('title', 'like', $like)
                    ->orWhere('description', 'like', $like);
            });
        }
        if($request->input('cid', ''))
        {
            $builder->where('cid', request('cid'));
        }
        $products = $builder->withCount('skus')->paginate(16);
        return $this->success($products);
    }

    //首页推荐
    public function stick()
    {
        $builder = Product::query()->where('status', 1)->where('recommended',1)->get();
        return $this->success($builder);
    }

    //商品详情
    public function show(Product $product, Request $request)
    {
        // 判断商品是否已经上架，如果没有上架则抛出异常。
        $user = auth('api')->user();
        if($user){
            //清除该摇一摇缓存
            Redis::del($user['id'].'+'.$product['id']);//true
        }
        if ($product->status==2) {
            return $this->failed('该商品已下架');
        }
        $productsku=$product->skus()->get();

        return $this->success(['product'=>$product,'product_sku'=>$productsku]);
    }
//

    public function teeter(Product $product, Request $request)
    {
//
        $user = auth('api')->user();

//        Redis::flushall();
        $productsku= $product->skus()->get()->toarray();
        foreach ($productsku as $k=>$v)
        {
            if($v['type']==2){
                unset($productsku[$k]);
            }
        }
        $noskuone=Arr::random($productsku);
        $teetercouunt= Redis::scard($user['id'].'+'.$product['id']);
        $nosku= Redis::smembers($user['id'].'+'.$product['id']);
        // 判断商品是否已经上架，如果没有上架则抛出异常。
        if ($product->status==2) {
            return $this->failed('该商品已下架');
        }

      $productnum = Product::find($product)->first()->toarray();
        $num=2;
        if($productnum['number']==6){
            $num=1;
        }
        if($productnum['number']==12){
            $num=2;
        }
        // 如果用户提交了
        if ($coupon = $request->input('coupon')) {

            $cartItems = $user->userDiscount()->with(['discount'])->where('discount_id',$coupon)->first();
//            dd($cartItems->toarray());
            if(!$cartItems['amount']){
                return $this->success('没有该卡了');
            }
            if($teetercouunt<=$num){
                return $this->success('您的普通摇卡次数还没用完');
            }
            if($cartItems['discount_id']==1){
                $num=$num+1;
                if($teetercouunt>$num) {
                    $nosku= Redis::smembers($user['id'].'+'.$product['id']);
                    $arr=$product->skus()->get();
                    foreach ($arr as $k=>$v)
                    {
                        if($v['type']==2){
                            unset($arr[$k]);
                        }else{
                            $arr1[]=$v['id'];
                        }
                    }
                    $yesintersection = array_diff($arr1, $nosku);
                    $yessku=Arr::random($yesintersection);
                    $arr=ProductSku::where('id',$yessku)->get();
                    return $this->success(['product' => $product, 'product_sku' => $productsku, 'nosku' => $nosku,'yessku'=>$arr, 'msg' => '只能使用一张提示卡']);
                }
                $arr=$product->skus()->get();
                foreach ($arr as $k=>$v)
                {
                    if($v['type']==2){
                        unset($arr[$k]);
                    }else{
                        $arr1[]=$v['id'];
                    }
                }
                 $intersection = array_diff($arr1, $nosku);
                $noskuone=Arr::random($intersection);
                $teeter= Redis::sadd($user['id'].'+'.$product['id'],$noskuone);
                $nosku= Redis::smembers($user['id'].'+'.$product['id']);
                UserDiscount::where('user_id',$user['id'])->where('discount_id',$cartItems['discount_id'])->update([
                    'amount' => $cartItems['amount']-1,
                ]);
                $yesintersection = array_diff($arr1, $nosku);
                $yessku=Arr::random($yesintersection);
                $arr=ProductSku::where('id',$yessku)->get();
                return $this->success(['product'=>$product,'product_sku'=>$productsku,'nosku'=>$nosku,'yessku'=>$arr,'msg'=>'又摇到一个']);
            }

            if($cartItems['discount_id']==2)
            {
                $arr=ProductSku::where('product_id',$product['id'])->get();
                foreach ($arr as $k=>$v)
                {
                    $arr1[]=$v['id'];
                }
                $intersection = array_diff($arr1, $nosku);

                $noskuone=Arr::random($intersection);
                $arr=ProductSku::where('id',$noskuone)->get();
                UserDiscount::where('user_id',$user['id'])->where('discount_id',$cartItems['discount_id'])->update([
                    'amount' => $cartItems['amount']-1,
                ]);
                return $this->success(['product'=>$product,'product_sku'=>$productsku,'nosku'=>$nosku,'yessku'=>$arr,'msg'=>'显示卡使用成功,里面是它']);
            }
        }






//        dump($productsku);

        if($teetercouunt>$num){
            $nosku= Redis::smembers($user['id'].'+'.$product['id']);
            $arr=$product->skus()->get();
            foreach ($arr as $k=>$v)
            {
                if($v['type']==2){
                    unset($arr[$k]);
                }else{
                    $arr1[]=$v['id'];
                }
            }
            $intersection = array_diff($arr1, $nosku);
            $yessku=Arr::random($intersection);
            $arr=ProductSku::where('id',$yessku)->get();
            return $this->success(['product'=>$product,'product_sku'=>$productsku,'nosku'=>$nosku,'yessku'=>$arr,'msg'=>'不能再摇了']);
        }else{
            $teeter= Redis::sadd($user['id'].'+'.$product['id'],$noskuone['id']);
            $nosku= Redis::smembers($user['id'].'+'.$product['id']);
            $arr=$product->skus()->get();
            foreach ($arr as $k=>$v)
            {
                if($v['type']==2){
                    unset($arr[$k]);
                }else{
                    $arr1[]=$v['id'];
                }
            }
            $intersection = array_diff($arr1, $nosku);
            $yessku=Arr::random($intersection);
            $arr=ProductSku::where('id',$yessku)->get();
            if(!$teeter){
                return $this->success(['product'=>$product,'product_sku'=>$productsku,'nosku'=>$nosku,'yessku'=>$arr,'msg'=>'什么都没摇到']);
            }else{
                return $this->success(['product'=>$product,'product_sku'=>$productsku,'nosku'=>$nosku,'yessku'=>$arr,'msg'=>'摇到']);
            }
        }
    }
        //商城商品
    public function shop()
    {

        $builder = Shop::query()->where('status', 1)->get();
        return $this->success($builder);
    }

    //商品详情
    public function shopshow(Shop $shop)
    {
        return $this->success($shop);
    }
    //商城商品推荐
    public function shopstick()
    {
        $builder = Shop::query()->where('status', 1)->where('recommended',1)->get();
        return $this->success($builder);
    }



}
