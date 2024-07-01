<?php
    $nombre = (isset($_POST["firstData"]) && $_POST["firstData"] != "") ? $_POST["firstData"] : "No especifica";
    echo "<br>$nombre<br>";
?>