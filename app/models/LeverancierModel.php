<?php

class LeverancierModel
{
    private $db;

    public function __construct()
    {
        $this->db = new Database();
    }

    public function getLeverancier($id)
    {
        $sql = "SELECT
                    L.Naam AS LNaam,
                    L.ContactPersoon,
                    L.LeverancierNummer,
                    L.Mobiel,
                    P.Naam AS PNaam,
                    IFNULL(M.AantalAanwezig, '0') AS AantalAanwezig,
                    PL.DatumLevering,
                    PL.Aantal,
                    PL.DatumEerstVolgendeLevering AS DatumEVL
                FROM Leverancier L
                JOIN ProductPerLeverancier PL ON L.Id = PL.LeverancierId
                JOIN Product P ON PL.ProductId = P.Id
                LEFT JOIN Magazijn M ON P.Id = M.ProductId
                WHERE P.Id = $id
                ORDER BY PL.DatumLevering ASC;";

        $this->db->query($sql);

        return $this->db->resultSet();
    }
}
