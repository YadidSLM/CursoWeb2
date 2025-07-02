// const padre = document.getElementById("padre");
// const hijo = document.getElementById("hijo");
// const hijitos = document.getElementsByClassName("hijito");
// const contenedor = document.getElementById("contenedor");

// console.log(padre);
// console.log(hijo);

// padre.addEventListener("click", ()=>{
//     console.log("Le hiciste click al padre");
// }, true); //Capturing, primero detecta el padre luego el hijo, lo contrario a bubbling

// hijo.addEventListener("click", ()=>{
//     console.log("Le hiciste click al hijo");

// });

// contenedor.addEventListener("click", (evento)=>{
//     console.log(evento.target); //Target hace el console.log del objeto que recibe el evento
//     evento.target.style.color = "red"; //.target es una propiedad del evento que guarda el objeto en donde ocurrió específicamente el evento.
// });


// const tarjeta = document.getElementById("tarjeta");
// const sub = document.getElementById("sub");

// tarjeta.addEventListener("click", ()=>{
//     window.location = "http://youtube.com";
// });

// sub.addEventListener("click", (evemto)=>{
//     alert("Botón picado con éxito");
//     evemto.stopPropagation();
// })

//Añadir compra
const agregar = document.getElementById("agregar");
const input = document.getElementById("input");
const lista = document.getElementById("lista");
const botones = document.getElementsByClassName("boton");

agregar.addEventListener("click", ()=>{
    lista.innerHTML = lista.innerHTML + '<li>' + input.value + '<button class="boton">Borrar</button></li>';
});
//Botones es un HTMLcollection y lista es un solo objeto padre
lista.addEventListener("click", (evento)=>{
    if(evento.target.className == "boton"){
        console.log(evento.target); //Regresa el bot+on pues ahí ocurrió el evento
        // evento.target.outerHTML = ''; //Está refiriendose a la etiqueta que gyarda el contenido
        evento.target.parentElement.outerHTML = ''; // Se refiere al elemento que contiene al botón, es el li, lo borra
    }
});