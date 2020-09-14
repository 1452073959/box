<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\Order;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Controllers\AdminController;
use Dcat\Admin\Layout\Content;

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

            $grid->model()->whereIn('status',[ 2, 3])->orderBy('created_at', 'desc');
//            $grid->id->sortable();
            $grid->no;
            $grid->model()->with(['user']);
            $grid->column('user.nickname','用户');
//            $grid->user_id;
//            $grid->address;
            $grid->total_amount;
//            $grid->remark;
            $grid->paid_at;
//            $grid->payment_no;
            $grid->status->using([1 => '未支付', 2 => '未发货',3=>'已发货'])->filter(
                Grid\Column\Filter\In::make([
                    0 => '未知',
                    1 => '未支付',
                    2 => '未发货',
                    3 => '已发货',
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
                $filter->like('user.nickname', '用户');

            });
            $grid->disableDeleteButton();
            $grid->disableEditButton();
            $grid->disableQuickEditButton();
            //关闭新增按钮
            $grid->disableCreateButton();
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

    public  function show($id ,Content $content)
    {
//        dd( \App\Models\CommodityOrder::find($id)->toarray());
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
