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
            $grid->id->sortable();
            $grid->model()->with(['cate']);
            $grid->column('cate.text','分类');
            $grid->title;
//            $grid->description;
//            $grid->sold_count;
            $grid->price;
//            $grid->stock;
            $grid->recommended->using([ 1 => '是',2=>'否'])->filter(
                Grid\Column\Filter\In::make([
                    1 => '是',
                    2 => '否',
                ])
            );;;
            $grid->status->using([ 1 => '上架',2=>'下架'])->filter(
                Grid\Column\Filter\In::make([
                    1 => '上架',
                    2 => '下架',

                ])
            );;
//            $grid->created_at;
//            $grid->updated_at->sortable();
            $grid->disableViewButton();
            $grid->disableDeleteButton();
            $grid->filter(function (Grid\Filter $filter) {
                $filter->like('title', '商品名称');
                $filter->equal('cid','商品分类')->select(config('app.url').'/api/cate');

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
        return Form::make(new Product(['skus']), function (Form $form) {
//            $form->display('id');
//            $form->text('cid');
            $form->select('cid','所属分类')->options(config('app.url').'/api/cate')->required();
            $form->text('title')->required();
            $form->text('series')->required();
            $form->multipleImage('image')->saving(function ($paths) {
                // 可以转化为由 , 隔开的字符串格式
                // return implode(',', $paths);
                // 也可以转化为json
                return json_encode($paths);
            })->uniqueName();
//            $form->text('sold_count');
            $form->text('price')->required();
            $form->number('number')->required();

            $form->radio('recommended')->options(['1' => '是', '2'=> '否'])->default('1')->required();
            $form->radio('status')->options([1 => '上架', 2=> '下架'])->default('1')->required();

            $form->hasMany('skus','sku', function (Form\NestedForm $form) {
                $form->text('title','sku名称');
                $form->image('image','sku图片');
            });

            // 去除整个工具栏内容
            $form->disableHeader();
            $form->display('created_at');
            $form->display('updated_at');
            $form->disableResetButton();
            $form->disableViewCheck();
            $form->disableEditingCheck();
            $form->disableCreatingCheck();
        });
    }
}
