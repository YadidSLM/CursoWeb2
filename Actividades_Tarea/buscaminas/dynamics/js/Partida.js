import { Tablero } from "./Tablero.js";

function delay(miliSeg){
    return new Promise(resolve => setTimeout(resolve, miliSeg));
}

export class Partida{
    //Constructores
    constructor(nivel){
        //Atributos
        this.primerClick = false;
        this.tablero = new Tablero(nivel, this.primerClick);
        this.crono = document.getElementById("duracion");
    }
    //Métodos
    startGame(){
        this.tablero.generarTablero();
        this.tablero.verifyPos();
        console.log(this.tablero.endGame);
    }
    
    endGame(){
        this.tablero.endGame = true;
        this.tablero.tableroPadre.innerHTML = "";
        this.tablero = null;
    }
}