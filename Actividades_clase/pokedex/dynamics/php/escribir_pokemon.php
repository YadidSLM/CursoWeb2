<?php
    require "./config.php";
    $conexion = connect();
    if(isset($_GET['q'])){
        $letra = $_GET['q'];
        $sql = "SELECT pok_id, pok_name FROM pokemon WHERE pok_name LIKE '$letra%';";
        $query = mysqli_query($conexion, $sql);
        $todos_los_resultados = [];
        while($fila = mysqli_fetch_assoc($query)){
            array_push($todos_los_resultados, $fila);
        }
        echo json_encode($todos_los_resultados);
    }
?>