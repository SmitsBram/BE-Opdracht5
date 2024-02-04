<?php

class Allergie extends BaseController
{
    private $allergieModel;

    public function __construct()
    {
        $this->allergieModel = $this->model('AllergieModel');
    }

    public function index($id)
    {
        $result = $this->allergieModel->getAllergien($id);
        $product = $this->allergieModel->getProduct($id);


        if ($result == NULL) {
            $th = "";
            $rows = "<h1 style='text-align: center'>In dit product zitten geen stoffen die een<br>allergische reactie kan veroorzaken</h1>";
            header("refresh:4;url=" . URLROOT . "/overzicht");
        } else {
            $th = "<th>Naam</th>
            <th>Omschrijving</th>";

            $rows = "";
            foreach ($result as $allergien) {

                $rows .= "<tr>
                            <td>$allergien->ANaam</td>
                            <td>$allergien->Omschrijving</td>
                        </tr>";
            }
        }

        $data = [
            'title' => 'Overzicht Allergenen',
            'naamProduct' => $product[0]->PNaam,
            'barcode' => $product[0]->Barcode,
            'rows' => $rows,
            'th' => $th,
        ];

        $this->view('allergie/allergie', $data);
    }
}
