<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\Swipetwo;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Controllers\AdminController;

class SwipetwoController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new Swipetwo(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('img')->image();
            $grid->column('url');
        
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
        return Show::make($id, new Swipetwo(), function (Show $show) {
            $show->field('id');
            $show->field('img');
            $show->field('url');
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Form::make(new Swipetwo(), function (Form $form) {
            $form->display('id');
            $form->image('img')->uniqueName();;
            $form->url('url');
        });
    }
}
