const botonSi = document.getElementById("si");
const botonNo = document.getElementById("no");
/*
// Crear elementos html
let body = document.getElementsByTagName("body");
let nuevo1 = document.createElement("div");
let nuevo2 = document.createElement("div");
let nuevo3 = document.createElement("div");

//Añadirlos al doc
console.log(body[0].children);
body[0].prepend(nuevo1);
body[0].appendChild(nuevo2);
body[0].insertBefore(nuevo3, body[0].children[3]);
//Ponerles texto o estructura de html
body[0].children[0].innerText = "Primer nuevo"
body[0].children[6].innerHTML = "<br>Segundo nuevo";
body[0].children[3].innerText = "Tercer nuevo";

//Cambiar a uno de ellos propiedades de css
body[0].children[3].style.cssText = "display: contents;";
*/

function numAleatorio(min, max){
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

botonSi.addEventListener("click", ()=>{
    alert("Son buenos");
});

botonNo.addEventListener("click", ()=>{
    alert("Muchos pellejitos, ¿no?")
});

botonNo.addEventListener("mouseover", ()=>{
    let x = numAleatorio(1, window.innerWidth - 200);
    let y = numAleatorio(1, window.innerHeight - 200);
    botonNo.style.left = x + "px";
    botonNo.style.top = y + "px";

});

// console.log(numAleatorio(1,6));
console.log("Pantalla completa:", screen.width + "x" + screen.height);
console.log("Viewport visible:", window.innerWidth + "x" + window.innerHeight);
