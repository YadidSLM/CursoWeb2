<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PHP</title>
</head>
<body>
<?php
    define('CONSTANTE', 5);
    const MAR = 'océano';
    echo '<h1>Imprimiendo en php</h1>';
    echo "<p>Para imprimir variables es con comilla doble (\") así:</p>";
    print "Hola, ";
    echo "¿Cómo", " estás?", "<br><br>";
    $var = "var_dump imprime información de la variable";
    $entero = 5;
    $otra = "hola";
    $tu = " tu";
    var_dump($var);
    print "<br>";
    var_dump($entero);
    printf("<br>También se puede imprimir con printf \$var: %s, %u", $var, $entero);
    echo "<br><br>Para concatenar es con un puntito $otra.$tu"."<br>";

    $diccionario = ["NUMERO"=>3,
                    "CARACTER"=>"h",
                    "CADENA"=>"Parangaricutirimícuaro"
                    ];
    foreach($diccionario as $clave => $valor){
        echo "$clave -> $valor<br>";
    }
    foreach($diccionario as $value){
        echo "$value <br>";
    }
    $nombre = (isset($_POST["firstData"]) && $_POST["firstData"] != "") ? $_POST["firstData"] : "No especifica";
    //Imprime el valor si sí se envió, a través de isset(), y si hay algo escrito.
    if(isset($_POST["firstData"]) && $_POST["firstData"] != ""){
        echo "Del formulario se tiene de nombre: $nombre<br/>";
    }
?>
</body>
</html>