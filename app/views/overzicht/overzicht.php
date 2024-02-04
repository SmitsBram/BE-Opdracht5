<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="<?= URLROOT; ?>/img/store-avatar.png" type="image/x-icon">
    <link rel="stylesheet" href="<?= URLROOT; ?>/css/style.css">
    <title>Magazijn Overzicht</title>
</head>

<body>

    <div class="logo">
        <a href="<?= URLROOT; ?>/overzicht">
            <img src="<?= URLROOT; ?>/img/logo-wit.png">
        </a>
    </div>

    <div class="card">
        <div class="title">
            <h1>
                <?= $data['title']; ?>
            </h1>
        </div>
        <table>
            <thead>
                <th>Barcode</th>
                <th>Snoepnaam</th>
                <th>Verpakkingseenheid</th>
                <th>Voorraad</th>
                <th>Allergie Info</th>
                <th>Leverings Info</th>
            </thead>
            <tbody>
                <?= $data['rows']; ?>
            </tbody>
        </table>
    </div>

    <script src="<?= URLROOT; ?>/js/column.js"></script>
    <script src="<?= URLROOT; ?>/js/copy.js"></script>

</body>

</html>