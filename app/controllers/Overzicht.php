<?php

class Overzicht extends BaseController
{
    private $overzichtModel;

    public function __construct()
    {
        $this->overzichtModel = $this->model('OverzichtModel');
    }

    public function index()
    {
        $result = $this->overzichtModel->getOverzicht();

        $rows = "";
        foreach ($result as $overzicht) {

            $rows .= "<tr>
                        <td>$overzicht->Barcode</td>
                        <td>$overzicht->Naam</td>
                        <td>$overzicht->VerpakkingsEenheid</td>
                        <td>$overzicht->AantalAanwezig</td>
                        <td>
                            <a href='allergie/id/{$overzicht->Id}'>
                                <i class='fa-solid fa-xmark' style='color: #ff0000;'></i>
                            </a>
                        </td>
                        <td>
                            <a href='leverancier/id/{$overzicht->Id}'>
                                <i class='fa-solid fa-question' style='color: #0000ff;'></i>
                            </a>
                        </td>
                      </tr>";
        }

        $data = [
            'title' => 'Overzicht Magazijn Jamin',
            'rows' => $rows
        ];

        $this->view('overzicht/overzicht', $data);
    }
}
