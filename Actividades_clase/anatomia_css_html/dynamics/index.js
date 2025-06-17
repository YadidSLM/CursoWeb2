// let header = document.getElementsByTagName("header");
// console.log(header);
//header.setAttribute("style", "background-color: rgb(40, 101, 14)");

// const art = document.getElementById("art");
const art = document.getElementsByClassName("art");
const aside = document.getElementById("aside");
console.log(art);
//[...art] convierte art un objeto del tipo HTMLCollection en un objeto tipo arreglo patra así usar el foreach y recorrer el nuevo arreglo
[...art].forEach(element => {
        element.addEventListener("mouseover", () => {
            element.style.backgroundColor = "rgb(23, 126, 223)";
        });
        element.addEventListener("mouseout", ()=>{
            element.style.backgroundColor = "rgb(110, 9, 204)";
        });
});


// window.addEventListener("blur", () => {
//     alert("Te fuistee");
// });