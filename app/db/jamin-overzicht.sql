-- Drop tables if they exist
DROP TABLE IF EXISTS ProductPerLeverancier;
DROP TABLE IF EXISTS Leverancier;
DROP TABLE IF EXISTS ProductPerAllergeen;
DROP TABLE IF EXISTS Allergeen;
DROP TABLE IF EXISTS Magazijn;
DROP TABLE IF EXISTS Product;

-- Create tables
CREATE DATABASE IF NOT EXISTS `jamin-overzicht`;
USE `jamin-overzicht`;

CREATE TABLE IF NOT EXISTS Product (
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Naam VARCHAR(250) NOT NULL,
    Barcode VARCHAR(250) NOT NULL,
    IsActief BIT NOT NULL DEFAULT 1,
    Opmerkingen VARCHAR(250) NULL DEFAULT NULL,
    DatumAangemaakt DATETIME(6) NOT NULL,
    DatumGewijzigd DATETIME(6) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS Magazijn (
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ProductId INT NOT NULL,
    VerpakkingsEenheid FLOAT NOT NULL,
    AantalAanwezig INT NULL,
    IsActief BIT NOT NULL DEFAULT 1,
    Opmerkingen VARCHAR(250) NULL DEFAULT NULL,
    DatumAangemaakt DATETIME(6) NOT NULL,
    DatumGewijzigd DATETIME(6) NOT NULL,
    FOREIGN KEY (ProductId) REFERENCES Product(Id)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS Allergeen (
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Naam VARCHAR(250) NOT NULL,
    Omschrijving VARCHAR(250) NOT NULL,
    IsActief BIT NOT NULL DEFAULT 1,
    Opmerkingen VARCHAR(250) NULL DEFAULT NULL,
    DatumAangemaakt DATETIME(6) NOT NULL,
    DatumGewijzigd DATETIME(6) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS ProductPerAllergeen (
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ProductId INT NOT NULL,
    AllergeenId INT NOT NULL,
    IsActief BIT NOT NULL DEFAULT 1,
    Opmerkingen VARCHAR(250) NULL DEFAULT NULL,
    DatumAangemaakt DATETIME(6) NOT NULL,
    DatumGewijzigd DATETIME(6) NOT NULL,
    FOREIGN KEY (ProductId) REFERENCES Product(Id),
    FOREIGN KEY (AllergeenId) REFERENCES Allergeen(Id)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS Leverancier (
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Naam VARCHAR(250) NOT NULL,
    ContactPersoon VARCHAR(250) NOT NULL,
    LeverancierNummer VARCHAR(250) NOT NULL,
    Mobiel VARCHAR(11) NOT NULL,
    IsActief BIT NOT NULL DEFAULT 1,
    Opmerkingen VARCHAR(250) NULL DEFAULT NULL,
    DatumAangemaakt DATETIME(6) NOT NULL,
    DatumGewijzigd DATETIME(6) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS ProductPerLeverancier (
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    LeverancierId INT NOT NULL,
    ProductId INT NOT NULL,
    DatumLevering DATE NOT NULL,
    Aantal INT NOT NULL,
    DatumEerstVolgendeLevering DATE NULL,
    IsActief BIT NOT NULL DEFAULT 1,
    Opmerkingen VARCHAR(250) NULL DEFAULT NULL,
    DatumAangemaakt DATETIME(6) NOT NULL,
    DatumGewijzigd DATETIME(6) NOT NULL,
    FOREIGN KEY (LeverancierId) REFERENCES Leverancier(Id),
    FOREIGN KEY (ProductId) REFERENCES Product(Id)
) ENGINE = InnoDB;

-- Insert data into tables
INSERT INTO Product VALUES 
(NULL, 'Mintnopjes', '8719587231278', 1, NULL, NOW(), NOW()),
(NULL, 'Schoolkrijt', '8719587326713', 1, NULL, NOW(), NOW()),
(NULL, 'Honingdrop', '8719587327836', 1, NULL, NOW(), NOW()),
(NULL, 'Zure Beren', '8719587321441', 1, NULL, NOW(), NOW()),
(NULL, 'Cola Flesjes', '8719587321237', 1, NULL, NOW(), NOW()),
(NULL, 'Turtles', '8719587322245', 1, NULL, NOW(), NOW()),
(NULL, 'Witte Muizen', '8719587328256', 1, NULL, NOW(), NOW()),
(NULL, 'Reuzen Slangen', '8719587325641', 1, NULL, NOW(), NOW()),
(NULL, 'Zoute Rijen', '8719587322739', 1, NULL, NOW(), NOW()),
(NULL, 'Winegums', '8719587327527', 1, NULL, NOW(), NOW()),
(NULL, 'Drop Munten', '8719587322345', 1, NULL, NOW(), NOW()),
(NULL, 'Kruis Drop', '8719587322265', 1, NULL, NOW(), NOW()),
(NULL, 'Zoute Ruitjes', '8719587323256', 1, NULL, NOW(), NOW());

INSERT INTO Magazijn VALUES
(NULL, '1', '5', '453', 1, NULL, NOW(), NOW()),
(NULL, '2', '2.5', '400', 1, NULL, NOW(), NOW()),
(NULL, '3', '5', '1', 1, NULL, NOW(), NOW()),
(NULL, '4', '1', '800', 1, NULL, NOW(), NOW()),
(NULL, '5', '3', '234', 1, NULL, NOW(), NOW()),
(NULL, '6', '2', '345', 1, NULL, NOW(), NOW()),
(NULL, '7', '1', '795', 1, NULL, NOW(), NOW()),
(NULL, '8', '10', '233', 1, NULL, NOW(), NOW()),
(NULL, '9', '2.5', '123', 1, NULL, NOW(), NOW()),
(NULL, '10', '3', NULL, 1, NULL, NOW(), NOW()),
(NULL, '11', '2', '367', 1, NULL, NOW(), NOW()),
(NULL, '12', '1', '467', 1, NULL, NOW(), NOW()),
(NULL, '13', '5', '20', 1, NULL, NOW(), NOW());

INSERT INTO Allergeen VALUES
(NULL, 'Gluten', 'Dit product bevat gluten', 1, NULL, NOW(), NOW()),
(NULL, 'Gelatine', 'Dit product bevat gelatine', 1, NULL, NOW(), NOW()),
(NULL, 'AZO-Kleurstof', 'Dit product bevat AZO-kleurstof', 1, NULL, NOW(), NOW()),
(NULL, 'Lactose', 'Dit product bevat lactose', 1, NULL, NOW(), NOW()),
(NULL, 'Soja', 'Dit product bevat soja', 1, NULL, NOW(), NOW());

INSERT INTO ProductPerAllergeen VALUES
(NULL, '1', '1', 1, NULL, NOW(), NOW()),
(NULL, '1', '2', 1, NULL, NOW(), NOW()),
(NULL, '1', '3', 1, NULL, NOW(), NOW()),
(NULL, '3', '4', 1, NULL, NOW(), NOW()),
(NULL, '6', '5', 1, NULL, NOW(), NOW()),
(NULL, '9', '2', 1, NULL, NOW(), NOW()),
(NULL, '9', '5', 1, NULL, NOW(), NOW()),
(NULL, '10', '2', 1, NULL, NOW(), NOW()),
(NULL, '12', '4', 1, NULL, NOW(), NOW()),
(NULL, '13', '1', 1, NULL, NOW(), NOW()),
(NULL, '13', '4', 1, NULL, NOW(), NOW()),
(NULL, '13', '5', 1, NULL, NOW(), NOW());

INSERT INTO Leverancier VALUES
(NULL, 'Venco', 'Bert van Linge', 'L1029384719', '06-28493827', 1, NULL, NOW(), NOW()),
(NULL, 'Astra Sweets', 'Jasper del Monte', 'L1029284315', '06-39398734', 1, NULL, NOW(), NOW()),
(NULL, 'Haribo', 'Sven Stalman', 'L1029324748', '06-24383291', 1, NULL, NOW(), NOW()),
(NULL, 'Basset', 'Joyce Stelterberg', 'L1023845773', '06-48293823', 1, NULL, NOW(), NOW()),
(NULL, 'De Bron', 'Remco Veenstra', 'L1023857736', '06-34291234', 1, NULL, NOW(), NOW());

INSERT INTO ProductPerLeverancier VALUES
(NULL, '1', '1', '2023-04-09', '23', '2023-04-16', 1, NULL, NOW(), NOW()),
(NULL, '1', '1', '2023-04-18', '21', '2023-04-25', 1, NULL, NOW(), NOW()),
(NULL, '1', '2', '2023-04-09', '12', '2023-04-16', 1, NULL, NOW(), NOW()),
(NULL, '1', '3', '2023-04-10', '11', '2023-04-17', 1, NULL, NOW(), NOW()),
(NULL, '2', '4', '2023-04-14', '16', '2023-04-21', 1, NULL, NOW(), NOW()),
(NULL, '2', '4', '2023-04-21', '23', '2023-04-28', 1, NULL, NOW(), NOW()),
(NULL, '2', '5', '2023-04-14', '45', '2023-04-21', 1, NULL, NOW(), NOW()),
(NULL, '2', '6', '2023-04-14', '30', '2023-04-21', 1, NULL, NOW(), NOW()),
(NULL, '3', '7', '2023-04-12', '12', '2023-04-19', 1, NULL, NOW(), NOW()),
(NULL, '3', '7', '2023-04-19', '23', '2023-04-26', 1, NULL, NOW(), NOW()),
(NULL, '3', '8', '2023-04-10', '12', '2023-04-17', 1, NULL, NOW(), NOW()),
(NULL, '3', '9', '2023-04-11', '1', '2023-04-18', 1, NULL, NOW(), NOW()),
(NULL, '4', '10', '2023-04-16', '24', '2023-04-30', 1, NULL, NOW(), NOW()),
(NULL, '5', '11', '2023-04-10', '47', '2023-04-17', 1, NULL, NOW(), NOW()),
(NULL, '5', '11', '2023-04-19', '60', '2023-04-26', 1, NULL, NOW(), NOW()),
(NULL, '5', '12', '2023-04-11', '45', NULL, 1, NULL, NOW(), NOW()),
(NULL, '5', '13', '2023-04-12', '23', NULL, 1, NULL, NOW(), NOW());
