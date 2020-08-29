<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\Category;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Controllers\AdminController;

class CategoryController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new Category(), function (Grid $grid) {
//            $grid->id->sortable();
            $grid->text->tree();
// 禁用过滤器按钮
            $grid->disableFilterButton();
            //关闭新增按钮
//            $grid->disableCreateButton();
//            $grid->disableDeleteButton();
            // 禁用详情按钮
            $grid->disableViewButton();
//            $grid->parent_id;
//            $grid->is_directory;
//            $grid->level;
//            $grid->path;
            $grid->created_at;
            $grid->updated_at->sortable();

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
        return Show::make($id, new Category(), function (Show $show) {
            $show->field('id');
            $show->field('text');
            $show->field('parent_id');
            $show->field('is_directory');
            $show->field('image');
            $show->field('path');
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
        return Form::make(new Category(), function (Form $form) {
            $form->text('text');
            $form->image('image','分类图片')->uniqueName()->required();
            $form->disableResetButton();
            $form->disableViewCheck();
            $form->disableEditingCheck();
            $form->disableCreatingCheck();
            // 去除整个工具栏内容
            $form->disableHeader();
        });
    }
}
