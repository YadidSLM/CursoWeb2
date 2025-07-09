const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");
const boton = document.getElementById("new_creeper");

const canW = 480;
const numCasillasPorLado = 8;
const tamCasilla = canW/numCasillasPorLado;

function random(min, max){
    return Math.floor((Math.random() * (max - min + 1)) + 1);
}

let coloresVerdes = [
    "rgb(120, 145, 91)",
    "rgba(73, 125, 15, 1)",
    "rgb(53, 146, 34)",
    "rgb(36, 88, 12)",
    "rgb(79, 121, 31)",
    "rgb(90, 151, 20)",
    "rgb(111, 172, 41)",
    "rgb(94, 177, 0)",
];

function drawCreeper(numCuadritos, sizeCasilla){
    for(let j = 0; j < numCuadritos; j++){
        for(let i = 0; i < numCuadritos; i++){
            let n = random(0, coloresVerdes.length - 1);
            ctx.fillStyle = coloresVerdes[n];
            ctx.fillRect(sizeCasilla * i,  sizeCasilla * j, sizeCasilla, sizeCasilla);
        }
    }
    ctx.fillStyle = "#000000";
    ctx.fillRect(sizeCasilla, sizeCasilla * 2, sizeCasilla * 2, sizeCasilla * 2);
    ctx.fillRect(sizeCasilla * 5, sizeCasilla * 2, sizeCasilla * 2, sizeCasilla * 2);
    ctx.fillRect(sizeCasilla * 3, sizeCasilla * 4, sizeCasilla * 2, sizeCasilla * 3);
    ctx.fillRect(sizeCasilla * 2, sizeCasilla * 5, sizeCasilla, sizeCasilla * 3);
    ctx.fillRect(sizeCasilla * 5, sizeCasilla * 5, sizeCasilla, sizeCasilla * 3);
}

drawCreeper(numCasillasPorLado, tamCasilla);

boton.addEventListener(("click"), ()=>{
    ctx.clearRect(0, 0, canW, canW);
    drawCreeper(numCasillasPorLado, tamCasilla);
});