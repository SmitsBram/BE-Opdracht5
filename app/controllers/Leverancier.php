<?php

class Leverancier extends BaseController
{
    private $leverancierModel;

    public function __construct()
    {
        $this->leverancierModel = $this->model('LeverancierModel');
    }

    public function index($id)
    {
        $result = $this->leverancierModel->getLeverancier($id);


        if ($result[0]->AantalAanwezig == 0) {
            $th = "";
            $rows = "<h1 style='text-align: center'>Er is van dit product op dit moment geen voorraad aanwezig,<br> de verwachte eerstvolgende levering is: <span>" . $result[0]->DatumEVL . "</span></h1>";
            header("refresh:4;url=" . URLROOT . "/overzicht");
        } else {
            $th = "<th>Naam Product</th>
            <th>Datum Laatste Levering</th>
            <th>Aantal</th>
            <th>Eerstvolgende Levering</th>";

            $rows = "";
            foreach ($result as $leverancier) {

                $rows .= "<tr>
                <td>$leverancier->PNaam</td>
                <td>$leverancier->DatumLevering</td>
                <td>$leverancier->Aantal</td>
                <td>$leverancier->DatumEVL</td>
                </tr>";
            }
        }

        $data = [
            'title' => 'Leverings Informatie',
            'naamLeverancier' => $result[0]->LNaam,
            'contactPersoon' => $result[0]->ContactPersoon,
            'leverancierNummer' => $result[0]->LeverancierNummer,
            'mobiel' => $result[0]->Mobiel,
            'rows' => $rows,
            'th' => $th,
        ];

        $this->view('leverancier/leverancier', $data);
    }
}
