<?php
    echo "<br><br>
        <form action='./archivos.php' method='post' enctype='multipart/form-data'>
            <fieldset>
                <label for='nombre'>Nombre: </label>
                <input type='text' name='nombre' id='nombre'>
                <br><br>
                <input type='file' name='archivo1' id='archivo1'>
                <br><br>
                <button type='submit'>Guardar</button>
                <button type='reset'>Borrar</button>
            </fieldset>
        </form>
        <br><br>

        
        <p>De un archivo podemos conocer:</p>
        <ul>
            <li>Nombre: \$_FILES['fiechero_usuario']['name']</li>
            <li>Tipo de archivo: \$_FILES['fiechero_usuario']['type'] <br>
                Si el navegador porporciona la información.
                <ul>
                    <li>Image (png, jpg, jpeg)</li>
                    <li>Application (pdf, otect-stream)</li>
                    <li>Text/plain</li>
                </ul>
            </li>
            <li>Su tamaño en bytes: \$_FILES['fiechero_usuario']['size']</li>
            <li>Ruta temporal donde se carga el archivo: \$_FILES['fiechero_usuario']['tmp_name']</li>
            <li>Código de error asociado a la subida del archivo: \$_FILES['fiechero_usuario']['error']</li>
        </ul>
        
        
        ";
        //Errror 4 es porque no se envió nada.
    // print_r($_FILES);


    

    if(isset($_FILES["archivo1"]))
    {
        $nombre = (isset($_POST["nombre"]) && $_POST["nombre"] != "") ? $_POST["nombre"] : false;
        $originalName = $_FILES['archivo1']['name'];
        $arch = $_FILES['archivo1']['tmp_name'];
        $ext = pathinfo($originalName, PATHINFO_EXTENSION);
        rename($arch, "./statics/".$nombre.".".$ext);
        echo $originalName;
    } else {
        $carpeta = opendir("./statics");
        $archivos = [];
        $hay_archivos = true;
        $i = 0;
        while($hay_archivos){
            //Guarda el nombre de los archivos de la carpeta en el arreglo o lista $archivos.
             $archivo1 = readdir($carpeta);
             if($archivo1 != false){
                $i++;
                array_push($archivos, $archivo1);
             } else {
                $hay_archivos = false;
                closedir($carpeta);
             }
        }
        if($i > 0){
            echo "<h2>Imágenes dentro de statics</h2>";
            //foreach: La llave $key es el índice del arreglo $archivos y el valor es el nombre del archivo
            /*Solo colocamos la ruta donde se encuentran los archivos y colocamos el nombre y así vemos el
            archivo, por la ruta*/
            foreach($archivos as $key => $value){
                if($value != "." && $value != "..")
                    echo "<img src='./statics/$value' width='500'> <br>";
            }
        }

    }
?>