<?php

class Home extends BaseController
{
    public function index($id = NULL, $name = NULL)
    {
        header("refresh:0;url=" . URLROOT . "/overzicht");

        $data = [
            'title' => 'Welkom op de homepage',
            'id'    => $id,
            'name'  => $name
        ];

        $this->view('home/index', $data);
    }
}
