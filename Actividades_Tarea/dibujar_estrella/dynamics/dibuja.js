const num_picos = document.getElementById("num_picos");
const puntiagudez = document.getElementById("puntiagudez");
const star_color = document.getElementById("star_color");
const rellenar = document.getElementById("rellenar");
const canW = 300;
const canvas = document.getElementById("estrella");
const ctx = canvas.getContext("2d");

function drawStar(lineColor, puntiagudez, numPicos){
    let x1 = 150;
    let y1 = 150;
    let longitud = [puntiagudez, 145];
    let grados = 0;
    let rad;
    let xDestino;
    let yDestino;
    // console.clear();
    ctx.beginPath();

    //Interior
    for(let theta = 0; theta < 360; theta++){
        rad = (theta) * (Math.PI/180);
        xDestino = longitud[0] * Math.cos(rad) + x1;
        yDestino = longitud[0] * Math.sin(rad) + y1;
        //Dibuja circunferencia
        // if(theta == 0){
        //     ctx.moveTo(xDestino, yDestino);
        // } else {
        //     ctx.lineTo(xDestino, yDestino);
        // }
        //Puntos internos de la estrella
        for(let pic = 0; pic < numPicos; pic++){
            if(theta == (Math.ceil(360/numPicos)) * pic){
                //Elipse
                ctx.moveTo(xDestino, yDestino);
                ctx.ellipse(xDestino, yDestino, 5, 5, 0, 0, 2 * Math.PI);
            }
        }  
    }
    
    //Exterior
    for(let theta = 0; theta < 360; theta++){
        rad = (theta) * (Math.PI/180);
        mitadRadEntrePicos = (Math.ceil(360/numPicos) / 2) * (Math.PI/180); //Ángulo en radianes de la mitad de ángulo que hay entre cada pico.
        xDestino = longitud[1] * Math.cos(rad + mitadRadEntrePicos) + x1;
        yDestino = longitud[1] * Math.sin(rad + mitadRadEntrePicos) + y1;
        //Dibuja circunferencia
        // if(theta == 0){
        //     ctx.moveTo(xDestino, yDestino);
        // } else {
        //     ctx.lineTo(xDestino, yDestino);
        // }
        //Puntos internos de la estrella
        for(let pic = 0; pic < numPicos; pic++){
            if(theta == ((Math.ceil(360/numPicos)) * pic)){
                //Elipse
                ctx.moveTo(xDestino, yDestino);
                ctx.ellipse(xDestino, yDestino, 5, 5, 0, 0, 2 * Math.PI);
            }
        }  
    }
    ctx.strokeStyle = lineColor;
    ctx.stroke();
    ctx.closePath();
}

drawStar(star_color.value, puntiagudez.value, num_picos.value, num_picos.value);


num_picos.addEventListener("change", ()=>{
    if(num_picos.value > 30){
        num_picos.value = 30;
    } else if(num_picos.value < 3){
        num_picos.value = 3;
    }
    ctx.clearRect(0, 0, canW, canW);
    console.log(num_picos.value);
    drawStar(star_color.value, puntiagudez.value, num_picos.value);
});

puntiagudez.addEventListener("change", ()=>{
    ctx.clearRect(0, 0, canW, canW);
    console.log(puntiagudez.value);
    drawStar(star_color.value, puntiagudez.value, num_picos.value);
});

star_color.addEventListener("input", ()=>{
    ctx.clearRect(0, 0, canW, canW);
    console.log(star_color.value);
    drawStar(star_color.value, puntiagudez.value, num_picos.value);
    
});

rellenar.addEventListener("change", ()=>{
    console.log(rellenar.checked);
});