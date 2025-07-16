import { Casilla } from "./Casilla.js";

export class Bomba extends Casilla{
    constructor(divTableroPadre, posXY){
        super(divTableroPadre, posXY);
        this.tile.id = "bomba";
    }
    revelar(){
        this.revelado = true;
        this.tile.style.backgroundImage = "url(../../statics/imgs/banana.png)";
        this.tile.style.backgroundSize = "90%";
        this.tile.style.backgroundPosition = "center";
        this.tile.style.backgroundRepeat = "no-repeat";
        this.tile.style.backgroundColor = "#c9be2a";
        this.tile.style.pointerEvents = "none";
        // divTableroPadre.disabled = true;
        //Aquí se ingresan los datos en la BD
        //Luego redirecciona al inicio
        // alert("Pisaste bannana");
        // window.location = "../../index.html";
    }
}