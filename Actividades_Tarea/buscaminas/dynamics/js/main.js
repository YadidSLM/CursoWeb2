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
const jugarOtraVez = document.getElementById("play_again");
const guardarPuntaje = document.getElementById("guardar_puntaje");


let primera = new Partida(obtenerCookie("nivel"));
primera.startGame();
jugarOtraVez.addEventListener("click", ()=>{
    primera.endGame();
    primera = new Partida(obtenerCookie('nivel'));
    primera.startGame();
    primera.tablero.crono.innerHTML = "0 : 0 : 0";
    guardarPuntaje.style.display = "none";
    puntajes.style.display = "flex";
});

puntajes.addEventListener("click", ()=>{
    if(primera && !primera.tablero.primerClick){ //Si existe la partida y no ha dado el primer click que redireccione
        window.location = "../php/ver_puntajes.php";
    }
});

guardarPuntaje.addEventListener("click", ()=>{
    console.log(primera.tablero.duracion);
    //Redirección a guardar_partida.php generando un form escondido que mande por post la duracion para que nadie pueda ingresar la duración por la url si fuera por get con fetch.
    const hiddenForm = document.createElement("form");
    hiddenForm.method = "POST";
    hiddenForm.action = "../php/guardar_puntajes.php";

    const inDuracion = document.createElement("input");
    inDuracion.type = "hidden";
    inDuracion.name = "duration";
    inDuracion.value = primera.tablero.duracion;

    hiddenForm.appendChild(inDuracion);
    document.body.appendChild(hiddenForm);
    hiddenForm.submit();
});