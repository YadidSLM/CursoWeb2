const add = document.getElementById("agregar");
const form = document.getElementById("form")
const enviar = document.getElementById("enviar");

add.addEventListener("click", ()=>{
    form.style.display = "block";
});

enviar.addEventListener("click", ()=>{
    form.style.display = "none";
});