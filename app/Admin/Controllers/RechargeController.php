<?php

namespace App\Admin\Controllers;

use App\Models\Recharge;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Controllers\AdminController;

class RechargeController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new Recharge(), function (Grid $grid) {
            $grid->model()->orderBy('created_at', 'desc');
            $grid->column('id')->sortable();
            $grid->column('no');
            $grid->model()->with(['user']);
            $grid->column('user.nickname', '用户')->responsive();;
            $grid->column('money','金额');
            $grid->column('paid_at','支付时间')->display(function($paid_at) {
                return date('Y-m-d H:i:s',(int)$paid_at);
            });;
            $grid->column('status')->using([ 1 => '成功',2=>'失败'])->filter(
                Grid\Column\Filter\In::make([
                    1 => '成功',
                    2 => '失败',

                ])
            );;;
//            $grid->column('created_at');
            $grid->column('updated_at')->sortable();
        
            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');
        
            });
        });
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     *
     * @return Show
     */
    protected function detail($id)
    {
        return Show::make($id, new Recharge(), function (Show $show) {
            $show->field('id');
            $show->field('no');
            $show->field('user_id');
            $show->field('money');
            $show->field('action');
            $show->field('paid_at');
            $show->field('status');
            $show->field('created_at');
            $show->field('updated_at');
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Form::make(new Recharge(), function (Form $form) {
            $form->display('id');
            $form->text('no');
            $form->text('user_id');
            $form->text('money');
            $form->text('action');
            $form->text('paid_at');
            $form->text('status');
        
            $form->display('created_at');
            $form->display('updated_at');
        });
    }
}
