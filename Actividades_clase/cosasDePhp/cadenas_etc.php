<?php
    $saludo = ["hey", "how you doing", 5];
    foreach($saludo as $key => $valor){
        echo "$key $valor";
    }
    echo "<br>";
    foreach($saludo as $valor){
        echo "$valor ";
    }
    
    //Funciones de cadena
    $string = "Yooooooo, Jesus loves you, :)";
    $size = strlen($string);
    echo "<br>El tamaño de $string es de $size.";

    //Convierte un arreglo en cadena
    $saludo_completo = implode(" ", $saludo);
    echo "<br><br>$saludo_completo as a string<br><br>";

    //Convietrte una cadena en un arreglo separando en cada cierto parámetro
    $array_from_string = explode(", ", $string);
    print_r($array_from_string);
    echo "<br><br>";

    //Convierte cadena en un arreglo separando por carcateres, si se indica x caracteres
    $text = "Me gustan los caballos";
    $arr = str_split($text, 2);
    print_r($arr);
    echo "<br><br>";

    //Pasar un texto a mayísculas
    echo strtoupper($string)."<br><br>";
    echo strtolower($string);

    //Cambiar una parte de la cadena por otra
    $frutas = "Hola soy fresita";
    $fruta_rica = str_replace("fresita", "manguito", $frutas);
    echo "<br><br>$fruta_rica<br><br>";

    echo chr(107)." ". ord("k")."En ascii <br><br>";
    var_dump($fruta_rica);
    echo "<br><br>";

    //Funciones para arreglos
    $arreglo = array("<Nuevo", "arreglo", TRUE);
    print_r($arreglo);
    echo "<br><br>";

    $numbers = array(2,65,3,8,7,4,5);
    $otroNum = [4,3,2,6,5,7,8,9,0];
    print_r($numbers);
    echo "<br><br>";
    print_r($otroNum);
    // sort()
    echo "<br><br>";

    //Obtener zona horaria
    date_default_timezone_set("America/Mexico_City");
    $fecha = date_default_timezone_get();
    echo $fecha;
    echo "<br><br>";

    //tiempo desde 1 enero de 1970 hasta hoy
    $tiempo = time();
    echo $tiempo;
    echo "<br><br>";

    $cumple = mktime(15,0,0,05,25,2005);
    $fecha = date("d-m-y h:i:s a", $cumple);
    echo $tiempo - $cumple."<br>";
    echo $fecha;
    echo "<br><br>";

    $existe_fecha = checkdate(2,29,2023);
    var_dump($existe_fecha);
    echo "<br><br>";

    $existe_fecha = checkdate(2,29,2024);
    var_dump($existe_fecha);
    echo "<br><br>";

    $actual = date('d-m-y h:i:s a');
    echo $actual;  
    echo "<br><br>";

    //En arreglo pone el timepo
    $hoy = localtime();
    print_r($hoy);
    echo "<br><br>";

    //Números aleatorios en un rango
    echo rand(0,10);

?>