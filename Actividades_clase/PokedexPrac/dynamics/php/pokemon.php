<?php
  require "config.php";

  $con = mysqli_connect($db_host, $db_user, $db_pass, $db_schema);

  if(!$con)
  {
    echo "No se pudo conectar a la base de datos";
  }
  else
  {
    if(isset($_GET['q']))
    {
      $query = $_GET['q'];
      $sql = "SELECT pok_id FROM pokemon WHERE pok_name LIKE '%".$query."%'";
      $res = mysqli($con, $sql);
      $resultados = [];
      while($row = mysqli_fetch_asscoc($res))
      {
        $resultados[] = $row;
      }
      echo  json_encode($resultados);
    }
  }