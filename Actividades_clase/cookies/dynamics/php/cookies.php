<?php
    //Si no le determinas su tiempo de expiración termina cuando cierras el navegador.
    setcookie("galleta", "Soy cadena", time() + 3600);
    
    echo $_COOKIE["galleta"] . "<br><br>";

    $cookie = (isset($_COOKIE["galleta"]) && $_COOKIE["galleta"] != "") ? $_COOKIE["galleta"] : false;

    if($cookie){
        echo "El valor de la coockie es:" . $cookie;
    } else {
        echo 'Se comieron la galleta';
    }

?>