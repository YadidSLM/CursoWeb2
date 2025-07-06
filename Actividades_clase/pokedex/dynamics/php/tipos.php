<?php
    include("./config.php");
    $conexion = connect();
    $sql = "SELECT type_id, type_name FROM types";
    $peticionBD = mysqli_query($conexion, $sql);
    $todos_los_registros = [];
    while($fila = mysqli_fetch_assoc($peticionBD)){
        array_push($todos_los_registros, $fila);
    }
    echo json_encode($todos_los_registros); // Con ese echo se manda al js lo que regresa json_encode()
?>