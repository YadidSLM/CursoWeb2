<?php

    require "./config.php";
    $conexion = connect();
    if(isset($_GET['q']) && $_GET['q'] != "" && is_numeric($_GET['q'])){
        $pokemonId = $_GET['q'];
        $sql = "SELECT pok_id, pok_name, pok_height, pok_weight, pok_base_experience, type_name FROM pokemon
        NATURAL JOIN pokemon_types NATURAL JOIN types
        WHERE pok_id = ".$pokemonId." AND SLOT = 1";
        $query = mysqli_query($conexion, $sql); //Hace petición.
        $datos = mysqli_fetch_assoc($query); //Recibe la petición, o pone en $resp.
        $resp_ok = array("ok" => true, "datos" => $datos);
        echo json_encode($resp_ok);
    }
?>