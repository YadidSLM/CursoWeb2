//Aunque no use javascriot localhost lo ocupa para declarar cookies;

//La duración con max-age es en segundos.
document.cookie = "cookieUno=Esta es mi galleta; max-age = 3600";

const boton = document.getElementById("click");
boton.addEventListener("click", () => {
    console.log("Picado");
    document.cookie = "cookieUno=Esta es mi galleta; max-age = 0";
    boton.innerText = "Galleta eliminada";
});

let fecha = new Date();
//setTime le da al objeto fecha a lo que le pones en el argumento.
//getTime te da la cantidad actual de milisegundos que han pasado desde el 1 de enero de 1970.
// + 1000 (un segundo en milisegundos)* 60 (por 60 segundos que es un minuto) * 60 (por 60 que es una hora) * 24 (por 24 de lo anterior para un día) * 3 (por 3 días)
fecha.setTime(fecha.getTime() + 1000 * 60 * 60 * 24 * 3);
console.log(fecha);
console.log(fecha.toGMTString());

document.cookie = "cookieUno = Cambiando el valor; expires =" + fecha.toGMTString();
//Se puede colocar lo que dura la cookie con max-age o expires, es igual.

//Si se crea una cookie y quieres acceder a ella en php recarga la página con
document.cookie = "usuario=Sebas; path=/";
window.location.href = "../php/cookies.php"; // PHP ya podrá ver la cookie