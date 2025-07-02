<?php
$semana = (isset($_POST['semana']) && $_POST['semana'] != '') ? $_POST['semana'] : "No especifica";

if($semana == 1 || $semana == 2 || $semana == 3){
    header("Content-Type: application/zip");
    /*attachment indica que tiene que descargar el archivo filename es el nombre con que descarga el usuario el archivo original que tiene su nombre*/
    header("Content-Disposition: attachment; filename=seamana$semana.zip");
    readfile("../statics/Semana$semana.zip");
    exit; //Permite que no se vea la dirección de este archivo y solo ejecuta el código de arriba y lo de abajo no.
}
echo "<a download href='../statics/azul.jpg'>Azul</a><br>";
echo "<a download href='../statics/Saludo.pdf'>Saludo PDF</a><br>";
echo '<p>Vista previa</p>';
echo '<iframe src="../statics/Saludo.pdf"></iframe>';
?>

<!-- header("Content-Type: image/png");
header("Content-Disposition: attachment; filename=imagencita.png");
readfile("../statics/morado.png");
exit; -->