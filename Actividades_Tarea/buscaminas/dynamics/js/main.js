import { Partida } from "./Partida.js";

function obtenerCookie(wantedCookie){
    //Guardando en una lista todas las cookies del documento (que son todas aquellas cookies cuya ruta es la de la url actual)
    const allCookies = document.cookie.split("; ");
    //Se recorren todas las cookies y val toma el valor de cada una de ellas recordando que una cookie es una cadena "nombre_de_cookie=valor"
    for(const valCookie of allCookies){
        //Se separa cada cookie por su nombre y vaor y se guarda en las variables nombreCookie y valor
        const [nombreCookie, valor] = valCookie.split("=");
        //Si el nombre de la cookie obtenida de las cookies del documento es igual a la que queremos que la función regrese su valor decodificado
        // Porque estaba encriptado para usarse en la url del tipo Juan%20P%C3%A9rez, los caracteres raros son espacios y acentos, a la forma "Juan Pérez"
        if(nombreCookie === wantedCookie){
            return decodeURIComponent(valor);
        }
    }
    return allCookies;
}

const puntajes = document.getElementById("puntajes");

const primera = new Partida(obtenerCookie("nivel"));
primera.startGame();

puntajes.addEventListener("click", ()=>{
    primera.verPuntaje(puntajes);
});