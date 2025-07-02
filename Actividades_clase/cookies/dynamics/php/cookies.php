<?php
    //Si no le determinas su tiempo de expiración termina cuando cierras el navegador.
    setcookie("galleta", "Soy cadena", time() + 3600);
    

    $cookie = (isset($_COOKIE["galleta"]) && $_COOKIE["galleta"] != "") ? $_COOKIE["galleta"] : false;

    if($cookie){
        echo "El valor de la coockie es:" . $cookie;
    } else {
        echo 'Se comieron la galleta';
    }
    //Si quiero recibir una cookie creada en javascript se tiene que recargar la página porque las cookies
    // viajan en las cabeceras HTTP (que es una petición) y php solo puede leer cookies cuando elnavegaor 
    // hace una petición.
    if(isset($_COOKIE["usuario"]) && $_COOKIE["usuario"] != ""){
        echo $_COOKIE["usuario"];
    } else {
        echo "No se ha creado la cookie desde javascript";
    }
?>
<script src="./dynamics/js/cookies.js"></script>