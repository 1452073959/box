<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\Controller;
use App\Models\Category;
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
        Redis::del($user['id'].'+'.$product['id']);//true
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
        // 判断商品是否已经上架，如果没有上架则抛出异常。
        if ($product->status==2) {
            return $this->failed('该商品已下架');
        }
//        dump($product);
        $user = auth('api')->user();

//        Redis::flushall();

        $productsku= $product->skus()->get();

//        dump($productsku);
        $noskuone=Arr::random($productsku->toarray());
        $teetercouunt= Redis::scard($user['id'].'+'.$product['id']);
        $nosku= Redis::smembers($user['id'].'+'.$product['id']);
        if($teetercouunt>2){
            return $this->success(['product'=>$product,'product_sku'=>$productsku,'nosku'=>$nosku,'msg'=>'不能再摇了']);
        }else{
            $teeter= Redis::sadd($user['id'].'+'.$product['id'],$noskuone['id']);
            $nosku= Redis::smembers($user['id'].'+'.$product['id']);
            if(!$teeter){
                return $this->success(['product'=>$product,'product_sku'=>$productsku,'nosku'=>$nosku,'msg'=>'什么都没摇到']);
            }else{
                return $this->success(['product'=>$product,'product_sku'=>$productsku,'nosku'=>$nosku,'msg'=>'摇到']);
            }
        }
    }

    //商品
    public function multiproduct(Request $request)
    {
        $items = $request->input('items');
        $product=[];
        foreach ($items as $k => $v) {
            $sku = Product::find($v['id']);
            $sku['totalAmount']=$sku['price'] * $v['amount'];
            $product[]=$sku;
        }
        return $this->success($product);
    }

    //浏览历史
    public function history()
    {
        $user = auth('api')->user();
        $history= Redis::lrange($user['id'],0,-1);
        $history=Product::wherein('id',$history)->paginate(16);
        return $this->success($history);
    }
    //
    public function searchhistory()
    {
        $user = auth('api')->user();
        $history= Redis::lrange($user['weapp_openid'],0,2);
        return $this->success($history);
    }

    public function del()
    {
        $user = auth('api')->user();
        Redis::del($user['weapp_openid']);
    }

}
