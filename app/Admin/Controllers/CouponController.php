<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\Coupon;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Controllers\AdminController;

class CouponController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new Coupon(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('name');
            $grid->column('money');
            $grid->column('min_amount');
            $grid->column('num');
            //关闭新增按钮
//            $grid->disableCreateButton();
            $grid->disableDeleteButton();
            // 禁用详情按钮
            $grid->disableViewButton();
            // 禁用过滤器按钮
            $grid->disableFilterButton();
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
        return Show::make($id, new Coupon(), function (Show $show) {
            $show->field('id');
            $show->field('name');
            $show->field('money');
            $show->field('min_amount');
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Form::make(new Coupon(), function (Form $form) {
            $form->display('id');
            $form->text('name');
            $form->text('money');
            $form->text('min_amount');
            $form->number('num');
            $form->disableResetButton();
            $form->disableViewCheck();
            $form->disableEditingCheck();
            $form->disableCreatingCheck();
            // 去除整个工具栏内容
            $form->disableHeader();
        });
    }
}
