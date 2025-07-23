<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../statics/style/index.css">
    <link rel="shortcut icon" href="../../statics/imgs/banana.png" type="image/x-icon">
    <title>Busca</title>
</head>
<body id="body_puntajes">
    <?php
        require './config.php';
        date_default_timezone_set("Etc/GMT+6");
        $jugador = (isset($_POST['player']) && $_POST['player'] != "") ? $_POST['player'] : false;
        $confirmedPlayer = (isset($_POST['confirmName']) && $_POST['confirmName'] != "") ? $_POST['confirmName'] : false;
        $jugador = (isset($_POST['player']) && $_POST['player'] != "") ? $_POST['player'] : false;
        $duracion = (isset($_POST['duration']) && $_POST['duration'] != "") ? $_POST['duration'] : "0 0 : 0 0";
        $fecha = date('Y-m-d H:i:s');
        
        if($jugador == $confirmedPlayer && $jugador && $confirmedPlayer && isset($_COOKIE['nivel'])){ //Ya se validó que jugador no sea nada != "".
            $conexion = connect();
            //Inserta puntaje
            $sql1 = "INSERT INTO puntajes (DURACION, FECHA) VALUES ('". $duracion ."', '". $fecha ."')";
            $query1 = mysqli_query($conexion, $sql1); //Regresa un booleano
            
            //Obtiene el id del puntaje recién agregado (eso se logra ubicando la fecha en que se insertó).
            $sql2 = "SELECT ID_PUNTAJES FROM PUNTAJES
                    WHERE FECHA='".$fecha."'";
            $query2 = mysqli_query($conexion, $sql2);
            $id_puntaje_recien_agregado = mysqli_fetch_array($query2, MYSQLI_ASSOC);
            
            //Inserta el usuario con el id de su puntaje
            $sql3 = "INSERT INTO usuario (NOMBRE, ID_PUNTAJES) VALUES ('". $jugador ."', ". $id_puntaje_recien_agregado['ID_PUNTAJES'] .")";
            $query3 = mysqli_query($conexion, $sql3);
            
            //Obtiene el id del usuario recién agregado con la fecha de agregación.
            $sql4 = "SELECT ID_USUARIO FROM USUARIO
                    NATURAL JOIN PUNTAJES
                    WHERE FECHA='".$fecha."'";
            $query4 = mysqli_query($conexion, $sql4);
            $id_usuario_recien_agregado = mysqli_fetch_array($query4, MYSQLI_ASSOC);
            
            //Inserta la dificultad con la que jugó y el id del usuario.
            $sql6 = "INSERT INTO dificultad (TIPO_DIFICULTAD, ID_USUARIO) VALUES ('".$_COOKIE['nivel']."', ". $id_usuario_recien_agregado['ID_USUARIO'] .")";
            $query5 = mysqli_query($conexion, $sql6);
            header("location:./ver_puntajes.php");
        }
        echo "
            <div id='all'>
                <h2 class='titulo' id='titulo_partida'>Busca Bananas <br> ¿Quieres guardar tu puntaje?</h2>
                <div class='menu' id='gameBtns'>
                    <a href='../../index.html' id='volver'>Volver al inicio</a>
                </div>
                <form id='guardar' action='./guardar_puntajes.php' method='post'>
                    <p>Tiempo de la partida: </p>
                    <span>" . $duracion . "</span>
                    <input type='hidden' name='duration' id='duration' value='" .$duracion. "'>
                    <label for='player'>Nombre del jugador</label>
                    <input type='text' name='player' id='player'> <br><br>
                    <label for='confirmName'>Confirmar nombre</label>
                    <input type='text' name='confirmName' id='confirmName'> <br><br>
                    <button type='submit'>Registrar puntaje</button>
                </form>
                <div class='menu' id='punt_menu'>
                    <a id='puntajes' href='./ver_puntajes.php'>Puntajes</a>
                    <a id='guardar_puntaje'>Guardar puntaje</a>
                </div>
            </div>  
        ";
        //El input hidden es para pasar de nueva cuenta la duración por POST para que al recaragar no se borre el valor que habías recibido del main.js
        //<!-- La propiedad name del input es la que define el nombre de la variable $_POST['named']. -->
        
    ?>
    
    <!-- <script type="module" src="../js/main.js"></script> -->
</body>
</html>