<?php

namespace App\Admin\Forms;

use Dcat\Admin\Widgets\Form;
use Symfony\Component\HttpFoundation\Response;
use App\Models\Settings;
class Setting extends Form
{
    /**
     * Handle the form request.
     *
     * @param array $input
     *
     * @return Response
     */
    public function handle(array $input)
    {

        $data=Settings::first();
        $data->freight=$input['freight'];
        $data->maxmoney=$input['maxmoney'];
        $data->save();
        // return $this->error('Your error message.');

        return $this->success('更新成功.', '/');
    }

    /**
     * Build a form here.
     */
    public function form()
    {
        $this->text('freight','运费金额')->required();
        $this->text('maxmoney','免运费金额')->required();
//        $this->rate('rate','分成比率')->required();
    }

    /**
     * The data of the form.
     *
     * @return array
     */
    public function default()
    {

        $data=Settings::first();
//        dump($data);
        return [
            'freight'  => $data['freight'],
            'maxmoney' => $data['maxmoney'],
        ];
    }
}
