<?php

namespace App\Admin\Repositories;

use App\Models\Swipetwo as Model;
use Dcat\Admin\Repositories\EloquentRepository;

class Swipetwo extends EloquentRepository
{
    /**
     * Model.
     *
     * @var string
     */
    protected $eloquentClass = Model::class;
}
