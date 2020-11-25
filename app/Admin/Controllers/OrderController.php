<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\Order;
use App\Models\OrderItem;
use App\Models\Product;
use App\Models\ProductSku;
use App\Models\Shop;
use App\Models\User;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Controllers\AdminController;
use Dcat\Admin\Layout\Content;
use Illuminate\Support\Facades\DB;

class OrderController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new Order(), function (Grid $grid) {
            $grid->model()->orderBy('created_at', 'desc');
//            $grid->withBorder();
            $grid->fixColumns(3, -1);
            $grid->id->sortable()->responsive();;
            $grid->no->responsive();;
            $grid->model()->with(['user']);
            $grid->column('user.nickname', '用户')->responsive();;
//            $grid->user_id;
            $grid->address->explode()->label()->responsive()->setAttributes(['style' => 'width:14px']);;
            $grid->total_amount;
//            $grid->remark;
            $grid->model()->with(['shop']);
            $grid->column('shop.titile', '商城商品(商城)')->responsive();;
            $grid->model()->with(['items']);
            $grid->items('商品数据(抽盒)')->view('orders.item')->responsive();;
//            $grid->payment_no;
            $grid->column('快速发货')->view('orders.shop')->responsive()->width('400px');;
            $grid->paid_at->responsive();;
            $grid->status->using([1 => '未支付', 2 => '未发货', 3 => '已发货', 5 => '请立即发货',
                4 => '已取消',])->filter(
                Grid\Column\Filter\In::make([
                    0 => '未知',
                    1 => '未支付',
                    2 => '未发货',
                    3 => '已发货',
                    5 => '请立即发货',
                    4 => '已取消',
                ])
            );

//            $grid->ship_data;
//            $grid->created_at;
//            $grid->updated_at->sortable();
            // 显示
            $grid->showFilter();


            $grid->filter(function (Grid\Filter $filter) {

//                $filter->equal('id');
                $filter->like('no', '商户订单号');
//                $filter->equal('column', $label);
                $filter->like('user.nickname', '用户');
                $filter->whereBetween('created_at', function ($q) {
                    $start = $this->input['start'] ?? null;
                    $end = $this->input['end'] ?? null;
                    if ($start !== null) {
                        $q->where('created_at', '>=', $start);
                    }

                    if ($end !== null) {
                        $q->where('created_at', '<=', $end);
                    }
                })->datetime();
            });

            $grid->selector(function (Grid\Tools\Selector $selector) {
                $selector->selectOne('status', '订单状态', [
                    0 => '未知',
                    1 => '未支付',
                    2 => '未发货',
                    3 => '已发货',
                    5 => '请立即发货',
                    4 => '已取消',
                ]);
            });
            $grid->disableDeleteButton();
            $grid->disableEditButton();
            $grid->disableQuickEditButton();
            //关闭新增按钮
            $grid->disableCreateButton();
            $titles = ['no'=>'订单号','user_id' => '用户','address'=>'地址', 'total_amount' => '订单金额','商品数据(抽盒)'=>'商品数据(抽盒)','shop_id'=>'商城商品',
            'paid_at'=>'支付时间','status'=>'订单状态','type'=>'订单类型','电话'=>'电话'
            ];
            $grid->export()->titles($titles)->rows(function (array $rows) {

                foreach ($rows as $index => &$row) {
                    if($row['status']==1){
                       $mes= '未支付';
                    }
                    if($row['status']==2){
                        $mes= '未发货';
                    }
                    if($row['status']==3){
                        $mes= '已发货';
                    }
                    if($row['status']==4){
                        $mes= '已取消';
                    }
                    if($row['status']==5){
                        $mes= '请立即发货';
                    }
                    if($row['type']==1){
                        $mes1= '商城订单';
                    }
                    if($row['type']==2){
                        $mes1= '抽盒订单';
                    }
                    $p=OrderItem::where('order_id',$row['id'])->first();
                    $name1=Product::where('id',$p['product_id'])->value('title');
                    $name2=ProductSku::where('id',$p['product_sku_id'])->value('title');
                    $name=$name1.$name2;
                    $shop=Shop::where('id',$row['shop_id'])->value('titile');
                    $address= $row['address']['address'].'/'.$row['address']['contact_name'].'/';
                    $address2= $row['address']['contact_phone'];
                    $row['user_id'] = User::where('id', $row['id'])->value('nickname');
                    $row['address'] =$address;
                    $row['商品数据(抽盒)'] =$name;
                    $row['shop_id'] =$shop;
                    $row['status'] =$mes;
                    $row['type'] =$mes1;
                    $row['电话'] =$address2;
                }
                return $rows;
            });
            $grid->header(function ($collection)  {
                $time=date('Y-m-d',time());
                $Month=date('m',time());
                // 查询出已支付状态的订单总金额
                $data = DB::table('order')->whereDate('created_at',$time)->whereIn('status', ['2','3','5'])->sum('total_amount');
                $data2 = DB::table('order')
                    ->whereMonth('created_at', $Month)
                    ->whereIn('status', ['2','3','5'])->sum('total_amount');

                return "<div style='padding: 10px;'>今日总收入 ： $data.元</div>"."<div style='padding: 10px;'>本月总收入 ： $data2.元</div>";
            });

            $grid->quickSearch('no');

//            $grid->disableViewButton();
        });
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     *
     * @return Show
     */

    public function show($id, Content $content)
    {

//        dump( \App\Models\Order::with('items')->find($id));
        return $content->header('订单')
            ->description('详情')
            ->body(view('orders.show', ['order' => \App\Models\Order::find($id)]));
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Form::make(new Order(), function (Form $form) {
//            $form->display('id');
            $form->text('no');
            $form->text('user_id');
            $form->text('address');
            $form->text('total_amount');
            $form->text('remark');
            $form->text('paid_at');
            $form->text('payment_no');
            $form->text('status');
            $form->text('ship_data');
            // 去除整个工具栏内容
            $form->disableHeader();
            $form->display('created_at');
            $form->display('updated_at');
        });
    }
}
