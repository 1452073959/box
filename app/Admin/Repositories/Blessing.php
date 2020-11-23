<?php

namespace App\Admin\Repositories;

use App\Models\Blessing as Model;
use Dcat\Admin\Repositories\EloquentRepository;

class Blessing extends EloquentRepository
{
    /**
     * Model.
     *
     * @var string
     */
    protected $eloquentClass = Model::class;
}
