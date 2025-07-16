import { Tablero } from "./Tablero.js";

export class Partida{
    //Constructores
    constructor(nivel){
        //Atributos
        this.tablero = new Tablero(nivel);
        this.primerClick = false;
    }
    //Métodos
    startGame(){
        this.tablero.generarTablero();
        this.tablero.verifyPos(this.primerClick);
    }
    
    endGame(){}
    volverInicio(){}
    verPuntaje(p){
        console.log("A ver puntajes");
        p.innerText = "A ver";
    }
}