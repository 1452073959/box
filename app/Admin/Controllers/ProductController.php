<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\Product;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Controllers\AdminController;

class ProductController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new Product(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('cid');
            $grid->column('title');
            $grid->column('description');
            $grid->column('image');
            $grid->column('price');
            $grid->column('recommended');
            $grid->column('status');
            $grid->column('created_at');
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
        return Show::make($id, new Product(), function (Show $show) {
            $show->field('id');
            $show->field('cid');
            $show->field('title');
            $show->field('description');
            $show->field('image');
            $show->field('price');
            $show->field('recommended');
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
        return Form::make(new Product(), function (Form $form) {
            $form->display('id');
            $form->text('cid');
            $form->text('title');
            $form->text('description');
            $form->text('image');
            $form->text('price');
            $form->text('recommended');
            $form->text('status');
        
            $form->display('created_at');
            $form->display('updated_at');
        });
    }
}
