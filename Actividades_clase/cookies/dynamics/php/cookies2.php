<?php

    $cookie = (isset($_COOKIE["galleta"]) && $_COOKIE["galleta"] != "") ? $_COOKIE["galleta"] : false;
    echo $cookie;
    //Eliminando la cookie
    setcookie("galleta", "", time() - 1);
    if(isset($_COOKIE["galleta"]) && $_COOKIE["galleta"] != ""){
        echo "No se eliminó la galleta";
    } else {
        echo "Ya no tengo galletas, las eliminé";
    }

?>