<?php

namespace App\Admin\Controllers;

use App\Models\Conversion;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Controllers\AdminController;

class ConversionController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new Conversion(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('name');
            $grid->column('num');
            $grid->column('described');
        
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
        return Show::make($id, new Conversion(), function (Show $show) {
            $show->field('id');
            $show->field('name');
            $show->field('num');
            $show->field('described');
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Form::make(new Conversion(), function (Form $form) {
            $form->display('id');
            $form->text('name');
            $form->text('num');
            $form->text('described');
        });
    }
}
