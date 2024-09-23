// let header = document.getElementsByTagName("header");
// console.log(header);
//header.setAttribute("style", "background-color: rgb(40, 101, 14)");

const art = document.getElementById("art");
console.log(art);
art.addEventListener("mouseover", () => {
    art.style.display = "none";
});

window.addEventListener("blur", () => {
    // alert("Te fuistee");
});