import { Bomba } from "./Bomba.js";
import { Casilla } from "./Casilla.js";

function numAleatorio(min, max){
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

export class Tablero{
    //Constructores
    constructor(nivel){
        //Atributos
        this.nivel = nivel;
        //this.bombPos = []; //Se usa posiciones en generarTablero como lista de cadenas, bombPos es de números que aún no se ocupa.
        this.tablero = [];
        this.fila = [];
        this.tableroPadre = document.getElementById("contenedorTablero");
        this.x = 0;
        this.y = 0;
        if(this.nivel == "facil"){
            this.numCasillas = 8;
            this.bombas = 10;
            this.tableroPadre.setAttribute("style", "grid-template-columns: repeat(8, 1fr); grid-template-rows: repeat(8, 1fr);")
        }
        if(this.nivel == "medio"){
            this.numCasillas = 16;
            this.bombas = 40;
            this.tableroPadre.setAttribute("style", "grid-template-columns: repeat(16, 1fr); grid-template-rows: repeat(16, 1fr);")

        }
        if(this.nivel == "dificil"){
            this.numCasillas = 24;
            this.bombas = 99;
            this.tableroPadre.setAttribute("style", "grid-template-columns: repeat(24, 1fr); grid-template-rows: repeat(24, 1fr);")
        }       
    }
    //Métodos
    generarTablero(){
        //Tablero en matriz
        //Necesitamos colocar casillas con tipo bomba this.bombas veces en lugares aleatorios del tablero. Pienso que también se puede llenar el tablero como si fuera un sort.
        let i = 0;
        const posiciones = [];
        while(i < this.bombas){ //Chat me dijo cómo usar una lista de strings para detectar duplicados para luego meter los valores no duplicados en la lista con valores.
            let x = numAleatorio(0, this.numCasillas - 1);
            let y = numAleatorio(0, this.numCasillas - 1);
            let stringPos = `${x},${y}`;
            //Pasa a cadena para ser detectado por indexOf como mismos lugares en caso de haber repetidos.
            if(!posiciones.includes(stringPos)){
                posiciones.push(stringPos);
                // this.bombPos.push([x,y]); Funciona aunque esté comentado porque compara las cadenas solamente
                i++;
            }
        }
        //Llena tablero
        for(let col = 0; col < this.numCasillas; col++){
            for(let row = 0; row < (this.numCasillas); row++){
                if(posiciones.includes(`${col},${row}`)){
                    let banana = new Bomba(this.tableroPadre, [col, row]);
                    this.fila.push(banana);
                }else{
                    let casilla = new Casilla(this.tableroPadre, [col, row]);
                    this.fila.push(casilla);
                }
            }
            this.tablero.push(this.fila);
            this.fila = [];
        }
        console.table(this.tablero);
    }

    getNearBombs(x,y){
        const alrededor = [
            [x-1, y-1], [x-1, y], [x-1, y+1],
            [x  , y-1],           [x  , y+1],
            [x+1, y-1], [x+1, y], [x+1, y+1]
        ];
        let contador = 0;
        for(let [nx, ny] of alrededor){
            if(!this.tablero[x][y].revelado && nx >= 0 && ny >= 0 && nx < this.numCasillas && ny < this.numCasillas){
                if(this.tablero[nx][ny].tile.id == "bomba"){
                    contador++;
                }
            }
        }
        this.tablero[x][y].nearBombs = contador;
        console.log("Casilla: (" + x + "," + y + "), Bomb cercanas: " + this.tablero[x][y].nearBombs);
        return this.tablero[x][y].nearBombs;
    }
    getSurroundings(x, y){
        const alrededor = [
            [x-1, y-1], [x-1, y], [x-1, y+1],
            [x  , y-1],           [x  , y+1],
            [x+1, y-1], [x+1, y], [x+1, y+1]
        ];
        for(let [nx, ny] of alrededor){
            if(nx >= 0 && ny >= 0 && nx < this.numCasillas && ny < this.numCasillas){
                if(!this.tablero[nx][ny].revelado && this.tablero[nx][ny].tile.id != "bomba"){
                    this.getNearBombs(nx, ny);
                    this.tablero[nx][ny].revelar();
                    if(this.tablero[nx][ny].nearBombs == 0){
                        this.getSurroundings(nx, ny); //Woooow esperaba que solo se hiciera la recursión de la esquina superior derecha, pero se revelan todaass las necesarias, gracias a Dios que sorpresa wue haya sido lo justo para revelar lo que queríamos que se revelara.
                        console.log("Recursión");
                    }
                }
            }
        }
    }

    verifyPos(primerClick){
        this.tableroPadre.addEventListener("click", (evento)=>{
            let i = 0;
            if(evento.target.id == "contenedorTablero") return; //Para que no trate de agarrar el datasety y datasetx que no existe en el padre.
            if(evento.target.disabled) return;
            this.x = parseInt(evento.target.dataset.x);
            this.y = parseInt(evento.target.dataset.y);
            this.getNearBombs(this.x,this.y);
            if(primerClick == false){
                this.getSurroundings(this.x,this.y);
                console.log("Fue el primer click");
            }
            //Mientras sea el primer click (primerClick=false) y sea una bomba o tanga bombas alrededor, si es bomba o tiene bombas alrededor se regenera el tablero
            while(this.tablero[this.x][this.y].tile.id == "bomba" && primerClick == false || this.tablero[this.x][this.y].nearBombs != 0 && primerClick == false){
                this.tablero = [];
                this.tableroPadre.innerHTML = "";
                console.log("Se borró y regeneró el tablero");
                this.generarTablero();
                this.getNearBombs(this.x,this.y);
                this.getSurroundings(this.x,this.y);
                //Siguiente paso 30 de junio de 2025 hacer recursivo que cheque donde no hay bombas contiguas y las revele. Puede ser que cheque abajo luego de lado derecho para arriba o puede verificar radialmente a la casilla seleccionada y que esas luego vuelvan a preguntar radialmente.
            }
            if(evento.target.classList.contains("boton")){
                primerClick = true;
                this.tablero[this.x][this.y].revelar();
                evento.target.disabled = true;
            }
        });
    }
}