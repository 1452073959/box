<?php

namespace App\Admin\Controllers;

use App\Models\Shop;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Controllers\AdminController;

class ShopController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new Shop(), function (Grid $grid) {
            $grid->id->sortable();

            $grid->titile;
            $grid->price;
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
        return Show::make($id, new Shop(), function (Show $show) {
            $show->field('id');
            $show->field('titile');
            $show->field('series');
            $show->field('image');
            $show->field('description');
            $show->field('price');
            $show->field('recommended');
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
        return Form::make(new Shop(), function (Form $form) {
            $form->display('id');
            $form->text('titile')->required();
            $form->text('series')->required();
            $form->image('image')->required();
            $form->multipleImage('img','横图')->saving(function ($paths) {
                // 可以转化为由 , 隔开的字符串格式
                // return implode(',', $paths);
                // 也可以转化为json
                return json_encode($paths);
            })->uniqueName()->required();;
            $form->editor('description')->required();
            $form->text('price')->required();
            $form->radio('recommended')->options(['1' => '是', '2'=> '否'])->default('1')->required();
            $form->radio('status')->options([1 => '上架', 2=> '下架'])->default('1')->required();

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
