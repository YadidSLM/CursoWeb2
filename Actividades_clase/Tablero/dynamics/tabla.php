<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tablero</title>
</head>
<body>
<?php
    $tamano = (isset($_POST["tamano"]) && $_POST["tamano"] != "") ? $_POST["tamano"] : "No especifica";
    echo "<table cellpadding='5px' border=1 align='center'>
            <tbody>";
    $m1 = "+";
    $m2 = "-";
    for($i = 0; $i < $tamano; $i++){
        echo "<tr>";
        for($j = 0; $j < $tamano; $j++){
            if($j % 2 == 0)
                echo "<td>$m1</td>";
            else
                echo "<td>$m2</td>";
        }
        $aux = $m1;
        $m1 = $m2;
        $m2 = $aux;
        echo "</tr>";
    }
    echo "</table>
        </tbody>";
?>
</body>
</html>