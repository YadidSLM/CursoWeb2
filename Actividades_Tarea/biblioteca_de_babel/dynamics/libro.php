<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Libro</title>
</head>
<body>
    <?php
        $input = (isset($_POST["search"]) && $_POST["search"] != "") ? $_POST["search"] : "La escritura ordenada de letras con signififcado no se ingresó";
        $timezone = (isset($_POST["timezone"]) && $_POST["timezone"] != "") ? $_POST["timezone"] : "No especifica";
        $modo = (isset($_POST["modo"]) && $_POST["modo"] != "") ? $_POST["modo"] : "No especifica";
        //Generación de título aleatorio
        $array = [];
        for($i = 0; $i < rand(0,8); $i++) //Sí incluye el 0 y el 8
            array_push($array, chr(rand(97, 122)));
        $cadena = implode("", $array);
        $titulo = rand(0, 1000).strtoupper($cadena);

        //Generación de texto aleatorio al unir palabras aleatorias
        $palabra_arr = [];
        $texto_arr = [];
        $num_palabras = rand(300,500);
        for($i = 0; $i < $num_palabras; $i++){
            for($j = 0; $j < rand(4,10); $j++)
                array_push($palabra_arr, chr(rand(97, 122)));
            $palabra = implode("", $palabra_arr);
            array_push($texto_arr, $palabra);
            $palabra_arr = [];
        }
        //Despliegue del input de acuerdo a los modos
        if($modo == "normal"){
            $texto_arr[rand(0, $num_palabras)] = "<strong>".$input."</strong>";
        }elseif($modo == "orden"){
            $input_arr = explode(" ", $input);
            asort($input_arr);
            $reordenado_input = implode(" ",$input_arr);
            $texto_arr[rand(0, $num_palabras)] = "<strong>".$reordenado_input."</strong>";
        }elseif($modo == "palabras"){
            $input_arr = explode(" ", $input);
            foreach($input_arr as $val){
                $texto_arr[rand(0, $num_palabras)] = "<strong>".$val."</strong>";
            }
        }
        //Pasar el arreglo texto a una cadena para poder imprimirla en la tabla.
        $texto = implode(" ", $texto_arr);
        echo "<table cellpadding='20px' border=2 align='center'>
                <th><h2>Libro: $titulo</h2></th>
                <tbody>
                    <td>$texto</td>
                </tbody>
            </table>";
        //Tiempo y configuración de zona horaria
        $zona = date_default_timezone_set($timezone);
        $fecha = localtime(time(), true);
        echo "<h3>La fecha de consulta de este libro fue el: ".date("d M Y")." en $timezone</h3>";
    ?>
</body>
</html>