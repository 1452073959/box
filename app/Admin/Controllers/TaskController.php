<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\Task;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Controllers\AdminController;

class TaskController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new Task(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('title');
            $grid->column('award');
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
        return Show::make($id, new Task(), function (Show $show) {
            $show->field('id');
            $show->field('title');
            $show->field('award');
            $show->field('type');
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Form::make(new Task(), function (Form $form) {
            $form->display('id');
            $form->text('title');
            $form->text('award');
            $form->text('num');
            $form->disableResetButton();
            $form->disableViewCheck();
            $form->disableEditingCheck();
            $form->disableCreatingCheck();
            // 去除整个工具栏内容
            $form->disableHeader();
        });
    }
}
