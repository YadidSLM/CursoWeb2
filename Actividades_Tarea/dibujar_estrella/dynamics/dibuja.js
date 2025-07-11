const num_picos = document.getElementById("num_picos");
const puntiagudez = document.getElementById("puntiagudez");
const star_color = document.getElementById("star_color");
const rellenar = document.getElementById("rellenar");
const canW = 300;
const canvas = document.getElementById("estrella");
const ctx = canvas.getContext("2d");

function drawStar(lineColor, puntiagudez, numPicos, rellenar){
    let x1 = 150;
    let y1 = 150;
    let longitud = [puntiagudez, 145];
    let rad;
    let xDestino = [undefined, undefined];
    let yDestino = [undefined, undefined];
    document.body.parentElement.style.backgroundColor = lineColor;
    document.body.style.backgroundColor = lineColor;
    ctx.beginPath();

    //Estrella
    for(let theta = 0; theta < 360; theta++){
        rad = (theta) * (Math.PI/180);
        xDestino[0] = longitud[0] * Math.cos(rad) + x1;
        yDestino[0] = longitud[0] * Math.sin(rad) + y1;
        mitadRadEntrePicos = (Math.ceil(360/numPicos) / 2) * (Math.PI/180); //Ángulo en radianes de la mitad de ángulo que hay entre cada pico.
        xDestino[1] = longitud[1] * Math.cos(rad + mitadRadEntrePicos) + x1;
        yDestino[1] = longitud[1] * Math.sin(rad + mitadRadEntrePicos) + y1;

        for(let pic = 0; pic < numPicos; pic++){
            if(theta == (Math.ceil(360/numPicos)) * pic){
                ctx.lineTo(xDestino[0], yDestino[0]);
                ctx.lineTo(xDestino[1], yDestino[1]);
            }
            if(pic == numPicos - 1 && theta == 359){ //Si la pluma acabó de dibujar el último pico y está en la última iteración de theta entonces vuelve a la primera posición donde se empezó a dibujar el primer pico.
                xDestino[0] = longitud[0] * Math.cos(0) + x1;
                yDestino[0] = longitud[0] * Math.sin(0) + y1;
                ctx.lineTo(xDestino[0], yDestino[0]);
            }
        }
    }
    if(rellenar){
        ctx.fillStyle = lineColor;
        ctx.fill();
    } else {
        ctx.fillStyle = "#ffffff";
        ctx.fill();
    }
    ctx.strokeStyle = lineColor;
    ctx.stroke();
    ctx.closePath();
}

drawStar(star_color.value, puntiagudez.value, num_picos.value, rellenar.checked);

//Cuando haya un evento
num_picos.addEventListener("change", ()=>{
    if(num_picos.value > 30){
        num_picos.value = 30;
    } else if(num_picos.value < 3){
        num_picos.value = 3;
    }
    ctx.clearRect(0, 0, canW, canW);
    drawStar(star_color.value, puntiagudez.value, num_picos.value, rellenar.checked);
});

puntiagudez.addEventListener("input", ()=>{
    ctx.clearRect(0, 0, canW, canW);
    drawStar(star_color.value, puntiagudez.value, num_picos.value, rellenar.checked);
});

star_color.addEventListener("input", ()=>{
    ctx.clearRect(0, 0, canW, canW);
    drawStar(star_color.value, puntiagudez.value, num_picos.value, rellenar.checked);
    
});

rellenar.addEventListener("change", ()=>{
    drawStar(star_color.value, puntiagudez.value, num_picos.value, rellenar.checked);
});