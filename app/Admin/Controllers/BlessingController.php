<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\Blessing;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Controllers\AdminController;

class BlessingController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new Blessing(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('title','名称');
            $grid->column('image','图片')->image();

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
        return Show::make($id, new Blessing(), function (Show $show) {
            $show->field('id');
            $show->field('title');
            $show->field('image');
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Form::make(new Blessing(), function (Form $form) {
            $form->display('id');
            $form->text('title','物品名称')->required();
            $form->image('image','图片')->uniqueName()->required();;
            // 去除整个工具栏内容
            $form->disableHeader();
            $form->disableResetButton();
            $form->disableViewCheck();
            $form->disableEditingCheck();
            $form->disableCreatingCheck();
            $form->display('created_at');
            $form->display('updated_at');
        });
    }
}
