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
        //Si donde da click es una casilla que tiene todas las casillas de su alrededor...
        if(y >= 1 && y <= this.numCasillas - 2 && x >= 1 && x <= this.numCasillas - 2){ //Es para que no entre en el if donde evalúa localidades alrededor en el caso de haber dado click en una esquina o borde  donde no haya casillas a su alrededor.
            if(!this.tablero[x][y].revelado){
                if(this.tablero[x-1][y-1].tile.id == "bomba"){
                    this.tablero[x][y].nearBombs++;
                }
                if(this.tablero[x-1][y].tile.id == "bomba"){
                    this.tablero[x][y].nearBombs++;
                }
                if(this.tablero[x-1][y+1].tile.id == "bomba"){
                    this.tablero[x][y].nearBombs++;
                }
                if(this.tablero[x][y-1].tile.id == "bomba"){
                    this.tablero[x][y].nearBombs++;
                }
                if(this.tablero[x][y+1].tile.id == "bomba"){
                    this.tablero[x][y].nearBombs++;
                }
                if(this.tablero[x+1][y-1].tile.id == "bomba"){
                    this.tablero[x][y].nearBombs++;
                }
                if(this.tablero[x+1][y].tile.id == "bomba"){
                    this.tablero[x][y].nearBombs++;
                }
                if(this.tablero[x+1][y+1].tile.id == "bomba"){
                    this.tablero[x][y].nearBombs++;
                }
            }
        } else if(x == 0 && y == 0){ //Si pica esquina superior izquierda.
            if(!this.tablero[x][y].revelado){
                if(this.tablero[x][y+1].tile.id == "bomba"){
                    this.tablero[x][y].nearBombs++;
                }
                if(this.tablero[x+1][y].tile.id == "bomba"){
                    this.tablero[x][y].nearBombs++;
                }
                if(this.tablero[x+1][y+1].tile.id == "bomba"){
                    this.tablero[x][y].nearBombs++;
                }
            }
        } else if(x == this.numCasillas - 1 && y == 0){//Si pica esquina inferior izquierda.
            if(!this.tablero[x][y].revelado){
                if(this.tablero[x-1][y].tile.id == "bomba"){
                    this.tablero[x][y].nearBombs++;
                }
                if(this.tablero[x-1][y+1].tile.id == "bomba"){
                    this.tablero[x][y].nearBombs++;
                }
                if(this.tablero[x][y+1].tile.id == "bomba"){
                    this.tablero[x][y].nearBombs++;
                }
            }
        } else if(x == 0 && y == this.numCasillas - 1){//Si pica esquina superior derecha.
            if(!this.tablero[x][y].revelado){    
                if(this.tablero[x][y-1].tile.id == "bomba"){
                    this.tablero[x][y].nearBombs++;
                }
                if(this.tablero[x+1][y-1].tile.id == "bomba"){
                    this.tablero[x][y].nearBombs++;
                }
                if(this.tablero[x+1][y].tile.id == "bomba"){
                    this.tablero[x][y].nearBombs++;
                }
            }
        } else if(x == this.numCasillas - 1 && y == this.numCasillas - 1){//Si pica esquina inferior derecha.
            if(!this.tablero[x][y].revelado){
                if(this.tablero[x-1][y-1].tile.id == "bomba"){
                    this.tablero[x][y].nearBombs++;
                }
                if(this.tablero[x-1][y].tile.id == "bomba"){
                    this.tablero[x][y].nearBombs++;
                }
                if(this.tablero[x][y-1].tile.id == "bomba"){
                    this.tablero[x][y].nearBombs++;
                }
            }
        } else if(x >= 1 && x <= this.numCasillas - 2 & y == 0){//Si pica borde izq.
            if(!this.tablero[x][y].revelado){
                if(this.tablero[x-1][y].tile.id == "bomba"){
                    this.tablero[x][y].nearBombs++;
                }
                if(this.tablero[x-1][y+1].tile.id == "bomba"){
                    this.tablero[x][y].nearBombs++;
                }
                if(this.tablero[x][y+1].tile.id == "bomba"){
                    this.tablero[x][y].nearBombs++;
                }
                if(this.tablero[x+1][y+1].tile.id == "bomba"){
                    this.tablero[x][y].nearBombs++;
                }
                if(this.tablero[x+1][y].tile.id == "bomba"){
                    this.tablero[x][y].nearBombs++;
                }
            }
        } else if(x == this.numCasillas - 1 && y >= 1 & y <= this.numCasillas - 2){//Si pica borde inferior.
            if(!this.tablero[x][y].revelado){ //Para que no sume más bombas cercanas cada vez que se detecta el evento, solo se suma cuando las bombas no han sido reveladas.
                if(this.tablero[x][y-1].tile.id == "bomba"){
                    this.tablero[x][y].nearBombs++;
                }
                if(this.tablero[x-1][y-1].tile.id == "bomba"){
                    this.tablero[x][y].nearBombs++;
                }
                if(this.tablero[x-1][y].tile.id == "bomba"){
                    this.tablero[x][y].nearBombs++;
                }
                if(this.tablero[x-1][y+1].tile.id == "bomba"){
                    this.tablero[x][y].nearBombs++;
                }
                if(this.tablero[x][y+1].tile.id == "bomba"){
                    this.tablero[x][y].nearBombs++;
                }
            }    
        } else if(x >= 1 && x <= this.numCasillas - 2 & y == this.numCasillas - 1){//Si pica borde der.
            if(!this.tablero[x][y].revelado){
                if(this.tablero[x+1][y].tile.id == "bomba"){
                    this.tablero[x][y].nearBombs++;
                }
                if(this.tablero[x+1][y-1].tile.id == "bomba"){
                    this.tablero[x][y].nearBombs++;
                }
                if(this.tablero[x][y-1].tile.id == "bomba"){
                    this.tablero[x][y].nearBombs++;
                }
                if(this.tablero[x-1][y-1].tile.id == "bomba"){
                    this.tablero[x][y].nearBombs++;
                }
                if(this.tablero[x-1][y].tile.id == "bomba"){
                    this.tablero[x][y].nearBombs++;
                }
            }
        } else if(x == 0 && y >= 1 & y <= this.numCasillas - 2){//Si pica borde superior.
            if(!this.tablero[x][y].revelado){
                if(this.tablero[x][y-1].tile.id == "bomba"){
                    this.tablero[x][y].nearBombs++;
                }
                if(this.tablero[x][y+1].tile.id == "bomba"){
                    this.tablero[x][y].nearBombs++;
                }
                if(this.tablero[x+1][y+1].tile.id == "bomba"){
                    this.tablero[x][y].nearBombs++;
                }
                if(this.tablero[x+1][y].tile.id == "bomba"){
                    this.tablero[x][y].nearBombs++;
                }
                if(this.tablero[x+1][y-1].tile.id == "bomba"){
                    this.tablero[x][y].nearBombs++;
                }
            }
        }
        console.log("Casilla: (" + x + "," + y + "), Bomb cercanas: " + this.tablero[x][y].nearBombs);
        return this.tablero[x][y].nearBombs;
    }
    getSurroundings(x, y){
        //Si donde da click es una casilla que tiene todas las casillas de su alrededor...
        if(y >= 1 && y <= this.numCasillas - 2 && x >= 1 && x <= this.numCasillas - 2){ //Es para que no entre en el if donde evalúa localidades alrededor en el caso de haber dado click en una esquina o borde  donde no haya casillas a su alrededor.
            if(!this.tablero[x][y].revelado){
                if(this.tablero[x-1][y-1].tile.id != "bomba"){
                    this.getNearBombs(x-1,y-1);
                    this.tablero[x-1][y-1].revelar();
                }
                if(this.tablero[x-1][y].tile.id != "bomba"){
                    this.getNearBombs(x-1,y);
                    this.tablero[x-1][y].revelar();
                }
                if(this.tablero[x-1][y+1].tile.id != "bomba"){
                    this.getNearBombs(x-1,y+1);
                    this.tablero[x-1][y+1].revelar();
                }
                if(this.tablero[x][y-1].tile.id != "bomba"){
                    this.getNearBombs(x,y-1);
                    this.tablero[x][y-1].revelar();
                }
                if(this.tablero[x][y+1].tile.id != "bomba"){
                    this.getNearBombs(x,y+1);
                    this.tablero[x][y+1].revelar();
                }
                if(this.tablero[x+1][y-1].tile.id != "bomba"){
                    this.getNearBombs(x+1,y-1);
                    this.tablero[x+1][y-1].revelar();
                }
                if(this.tablero[x+1][y].tile.id != "bomba"){
                    this.getNearBombs(x+1,y);
                    this.tablero[x+1][y].revelar();
                }
                if(this.tablero[x+1][y+1].tile.id != "bomba"){
                    this.getNearBombs(x+1,y+1);
                    this.tablero[x+1][y+1].revelar();
                }
            }
        } else if(x == 0 && y == 0){ //Si pica esquina superior izquierda.
            if(!this.tablero[x][y].revelado){
                if(this.tablero[x][y+1].tile.id != "bomba"){
                    this.getNearBombs(x,y+1);
                    this.tablero[x][y+1].revelar();
                }
                if(this.tablero[x+1][y].tile.id != "bomba"){
                    this.getNearBombs(x+1,y);
                    this.tablero[x+1][y].revelar();
                }
                if(this.tablero[x+1][y+1].tile.id != "bomba"){
                    this.getNearBombs(x+1,y+1);
                    this.tablero[x+1][y+1].revelar();
                }
            }
        } else if(x == this.numCasillas - 1 && y == 0){//Si pica esquina inferior izquierda.
            if(!this.tablero[x][y].revelado){
                if(this.tablero[x-1][y].tile.id != "bomba"){
                    this.getNearBombs(x-1,y);
                    this.tablero[x-1][y].revelar();
                }
                if(this.tablero[x-1][y+1].tile.id != "bomba"){
                    this.getNearBombs(x-1,y+1);
                    this.tablero[x-1][y+1].revelar();
                }
                if(this.tablero[x][y+1].tile.id != "bomba"){
                    this.getNearBombs(x,y+1);
                    this.tablero[x][y+1].revelar();
                }
            }
        } else if(x == 0 && y == this.numCasillas - 1){//Si pica esquina superior derecha.
            if(!this.tablero[x][y].revelado){    
                if(this.tablero[x][y-1].tile.id != "bomba"){
                    this.getNearBombs(x,y-1);
                    this.tablero[x][y-1].revelar();
                }
                if(this.tablero[x+1][y-1].tile.id != "bomba"){
                    this.getNearBombs(x+1,y-1);
                    this.tablero[x+1][y-1].revelar();
                }
                if(this.tablero[x+1][y].tile.id != "bomba"){
                    this.getNearBombs(x+1,y);
                    this.tablero[x+1][y].revelar();
                }
            }
        } else if(x == this.numCasillas - 1 && y == this.numCasillas - 1){//Si pica esquina inferior derecha.
            if(!this.tablero[x][y].revelado){
                if(this.tablero[x-1][y-1].tile.id != "bomba"){
                    this.getNearBombs(x-1,y-1);
                    this.tablero[x-1][y-1].revelar();
                }
                if(this.tablero[x-1][y].tile.id != "bomba"){
                    this.getNearBombs(x-1,y);
                    this.tablero[x-1][y].revelar();
                }
                if(this.tablero[x][y-1].tile.id != "bomba"){
                    this.getNearBombs(x,y-1);
                    this.tablero[x][y-1].revelar();
                }
            }
        } else if(x >= 1 && x <= this.numCasillas - 2 & y == 0){//Si pica borde izq.
            if(!this.tablero[x][y].revelado){
                if(this.tablero[x-1][y].tile.id != "bomba"){
                    this.getNearBombs(x-1,y);
                    this.tablero[x-1][y].revelar();
                }
                if(this.tablero[x-1][y+1].tile.id != "bomba"){
                    this.getNearBombs(x-1,y+1);
                    this.tablero[x-1][y+1].revelar();
                }
                if(this.tablero[x][y+1].tile.id != "bomba"){
                    this.getNearBombs(x,y+1);
                    this.tablero[x][y+1].revelar();
                }
                if(this.tablero[x+1][y+1].tile.id != "bomba"){
                    this.getNearBombs(x+1,y+1);
                    this.tablero[x+1][y+1].revelar();
                }
                if(this.tablero[x+1][y].tile.id != "bomba"){
                    this.getNearBombs(x+1,y);
                    this.tablero[x+1][y].revelar();
                }
            }
        } else if(x == this.numCasillas - 1 && y >= 1 & y <= this.numCasillas - 2){//Si pica borde inferior.
            if(!this.tablero[x][y].revelado){ //Para que no sume más bombas cercanas cada vez que se detecta el evento, solo se suma cuando las bombas no han sido reveladas.
                if(this.tablero[x][y-1].tile.id != "bomba"){
                    this.getNearBombs(x,y-1);
                    this.tablero[x][y-1].revelar();
                }
                if(this.tablero[x-1][y-1].tile.id != "bomba"){
                    this.getNearBombs(x-1,y-1);
                    this.tablero[x-1][y-1].revelar();
                }
                if(this.tablero[x-1][y].tile.id != "bomba"){
                    this.getNearBombs(x-1,y);
                    this.tablero[x-1][y].revelar();
                }
                if(this.tablero[x-1][y+1].tile.id != "bomba"){
                    this.getNearBombs(x-1,y+1);
                    this.tablero[x-1][y+1].revelar();
                }
                if(this.tablero[x][y+1].tile.id != "bomba"){
                    this.getNearBombs(x,y+1);
                    this.tablero[x][y+1].revelar();
                }
            }    
        } else if(x >= 1 && x <= this.numCasillas - 2 & y == this.numCasillas - 1){//Si pica borde der.
            if(!this.tablero[x][y].revelado){
                if(this.tablero[x+1][y].tile.id != "bomba"){
                    this.getNearBombs(x+1,y);
                    this.tablero[x+1][y].revelar();
                }
                if(this.tablero[x+1][y-1].tile.id != "bomba"){
                    this.getNearBombs(x+1,y-1);
                    this.tablero[x+1][y-1].revelar();
                }
                if(this.tablero[x][y-1].tile.id != "bomba"){
                    this.getNearBombs(x,y-1);
                    this.tablero[x][y-1].revelar();
                }
                if(this.tablero[x-1][y-1].tile.id != "bomba"){
                    this.getNearBombs(x-1,y-1);
                    this.tablero[x-1][y-1].revelar();
                }
                if(this.tablero[x-1][y].tile.id != "bomba"){
                    this.getNearBombs(x-1,y);
                    this.tablero[x-1][y].revelar();
                }
            }
        } else if(x == 0 && y >= 1 & y <= this.numCasillas - 2){//Si pica borde superior.
            if(!this.tablero[x][y].revelado){
                if(this.tablero[x][y-1].tile.id != "bomba"){
                    this.getNearBombs(x,y-1);
                    this.tablero[x][y-1].revelar();
                }
                if(this.tablero[x][y+1].tile.id != "bomba"){
                    this.getNearBombs(x,y+1);
                    this.tablero[x][y+1].revelar();
                }
                if(this.tablero[x+1][y+1].tile.id != "bomba"){
                    this.getNearBombs(x+1,y+1);
                    this.tablero[x+1][y+1].revelar();
                }
                if(this.tablero[x+1][y].tile.id != "bomba"){
                    this.getNearBombs(x+1,y);
                    this.tablero[x+1][y].revelar();
                }
                if(this.tablero[x+1][y-1].tile.id != "bomba"){
                    this.getNearBombs(x+1,y-1);
                    this.tablero[x+1][y-1].revelar();
                }
            }
        }
    }

    verifyPos(primerClick){
        this.tableroPadre.addEventListener("click", (evento)=>{
            if(evento.target.id == "contenedorTablero"){//Para que no trate de agarrar el datasety y datasetx que no existe en el padre.
                return;
            }
            this.x = parseInt(evento.target.dataset.x);
            this.y = parseInt(evento.target.dataset.y);
            this.getNearBombs(this.x,this.y);
            if(primerClick == false){
                this.getSurroundings(this.x,this.y);
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
            if(evento.target.classList == "boton"){
                primerClick = true;
                this.tablero[this.x][this.y].revelar();
            }
        });
    }
}