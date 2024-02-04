<?php

class OverzichtModel
{
    private $db;

    public function __construct()
    {
        $this->db = new Database();
    }

    public function getOverzicht()
    {
        $sql = "SELECT
                    P.Id,
                    P.Barcode,
                    P.Naam,
                    M.VerpakkingsEenheid,
                    IFNULL(M.AantalAanwezig, '0') AS AantalAanwezig
                FROM Product P
                JOIN Magazijn M ON P.Id = M.ProductId
                ORDER BY P.Barcode ASC;";

        $this->db->query($sql);

        return $this->db->resultSet();
    }
}
