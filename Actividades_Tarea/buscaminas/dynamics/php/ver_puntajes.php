<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../statics/style/index.css">
    <link rel="shortcut icon" href="../../statics/imgs/banana.png" type="image/x-icon">
    <title>Busca</title>
</head>
<body id="body_ver_puntajes">
    <?php
        require "./config.php";
        $conexion = connect();

        $sql1 = "SELECT TIPO_DIFICULTAD, NOMBRE, DURACION, FECHA FROM dificultad
                NATURAL JOIN usuario
                NATURAL JOIN puntajes";

        $query1 = mysqli_query($conexion, $sql1);
        $arrFacil = [];
        while($datosFacil = mysqli_fetch_array($query1, MYSQLI_ASSOC)){
            array_push($arrFacil, $datosFacil);
        }
        echo "
        <div id='all'>
            <h2 class='titulo' id='titulo_partida'>Busca Bananas</h2>
            <div class='menu' id='gameBtns'>
            </div>
            <div id='puntajes_niveles'>
                <h2>Mejores Puntajes</h2>
                
        ";
        for($i = 0; $i < 3; $i++){ //Por las 3 tablas de cada nivel.
            echo "
                <table class='nivel_puntajes' cellpadding = 5%>
                    <thead>
                        <tr>
                        ";
                    if($i == 0){
                        echo "
                            <th colspan = '4'>Nivel fácil</th>
                        ";
                    } else if($i == 1){
                        echo "
                            <th colspan = '4'>Nivel medio</th>
                        ";
                    } else if($i == 2){
                        echo "
                            <th colspan = '4'>Nivel difícil</th>
                        ";
                    }
                    echo "
                        </tr>
                        <tr>
                            <th colspan = '2'>Nombre</th>
                            <th>Duración</th>
                            <th>Fecha</th>
                        </tr>
                    </thead>
                    <tbody>
                    ";
                    //¿Cómo se podría acomodar los valores de acuerdo a la duración de menor a mayor?
                    foreach($arrFacil as $cadaRegistro => $valor){
                        if($valor['TIPO_DIFICULTAD'] == 'facil' && $i == 0){
                            echo "
                                <tr>

                                    <td>". $valor['NOMBRE'] ."</td>
                                    <td>". $valor['DURACION'] ."</td>
                                    <td>". $valor['FECHA'] ."</td>
                                </tr>
                            ";
                        }
                        if($valor['TIPO_DIFICULTAD'] == 'medio' && $i == 1){
                            echo "
                                <tr>
                                    <td>". $valor['NOMBRE'] ."</td>
                                    <td>". $valor['DURACION'] ."</td>
                                    <td>". $valor['FECHA'] ."</td>
                                </tr>
                            ";
                        }
                        if($valor['TIPO_DIFICULTAD'] == 'dificil' && $i == 2){
                            echo "
                                <tr>
                                    <td>". $valor['NOMBRE'] ."</td>
                                    <td>". $valor['DURACION'] ."</td>
                                    <td>". $valor['FECHA'] ."</td>
                                </tr>
                            ";
                        }
                    }
            echo "
                    </tbody>
                </table>
            ";
        }

        echo "
                <a href='../../index.html' id='volver'>Volver al inicio</a>
            </div>
        </div>
        ";
    ?>
    
    <!-- <script type="module" src="../js/main.js"></script> -->
</body>
</html>