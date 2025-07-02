<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../statics/style/index.css">
    <link rel="shortcut icon" href="../../statics/imgs/banana.png" type="image/x-icon">
    <title>Busca</title>
</head>
<body>
    <h2 class="titulo" id="titulo_partida">Busca Bananas</h2>
    <div class="menu">
        <a href="../../index.html" id="volver">Volver al inicio</a>
        <a id="puntajes">Puntajes</a>
    </div>
    <?php
        $nivel = (isset($_POST["nivel"]) && $_POST["nivel"] != "") ? $_POST["nivel"]: false;
        //La cookie guarda el nivel que metió el usuario por sesión (Hasta que se cierre el navegador). Con "/" esa variable(cookie) con nombre nivel está disponible en todas las carpetas dentro de buscaminas
        if(!isset($_COOKIE["nivel"])){
            header("location: ../../index.html");
        } else {
            setcookie("nivel", $nivel, "/");
            echo '<h2 id="nivel">'.$nivel.'</h2>';
        }
    ?>
    <div id="contenedorTablero">
        
    </div>
    <script type="module" src="../js/main.js"></script>
</body>
</html>