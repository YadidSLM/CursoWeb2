import { Bomba } from "./Bomba.js";
import { Casilla } from "./Casilla.js";

function numAleatorio(min, max){
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

function delay(miliSeg){
    return new Promise(resolve => setTimeout(resolve, miliSeg));
}

export class Tablero{
    //Constructores
    constructor(nivel, primerClick){
        //Atributos
        this.nivel = nivel;
        this.primerClick = primerClick;
        //this.bombPos = []; //Se usa posiciones en generarTablero como lista de cadenas, bombPos es de números que aún no se ocupa.
        this.tablero = [];
        this.fila = [];
        this.tableroPadre = document.getElementById("contenedorTablero");
        this.crono = document.getElementById("duracion");
        this.guardarP = document.getElementById("guardar_puntaje");
        this.puntajes = document.getElementById("puntajes");
        this.body_partida = document.getElementById("body_partida");
        this.divAll = document.getElementById("all");
        this.duracion = "";
        this.endGame = false;
        this.posicionesB = [];
        this.x = 0;
        this.y = 0;
        if(this.nivel == "facil"){
            this.numCasillas = 8;
            this.bombas = 10; //10
            this.tableroPadre.setAttribute("style", "grid-template-columns: repeat(8, 1fr); grid-template-rows: repeat(8, 1fr);")
        }
        if(this.nivel == "medio"){
            this.numCasillas = 16;
            this.bombas = 40; //40
            this.tableroPadre.setAttribute("style", "grid-template-columns: repeat(16, 1fr); grid-template-rows: repeat(16, 1fr);")

        }
        if(this.nivel == "dificil"){
            this.numCasillas = 24;
            this.bombas = 99; //99
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
        return posiciones;
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
        // console.log("Casilla: (" + x + "," + y + "), Bomb cercanas: " + this.tablero[x][y].nearBombs);
        return this.tablero[x][y].nearBombs;
    }

    getSurroundings(x, y, primerClick){
        if(primerClick == false){
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
                            this.getSurroundings(nx, ny, false); //Woooow esperaba que solo se hiciera la recursión de la esquina superior derecha, pero se revelan todaass las necesarias, gracias a Dios que sorpresa wue haya sido lo justo para revelar lo que queríamos que se revelara.
                            // console.log("Recursión");
                        }
                    }
                }
            }
        }
    }

    alPrimerClick(x, y, primerClick){
        this.getSurroundings(x,y, primerClick);
        // console.log("Fue el primer click");
        //Mientras sea el primer click (primerClick=false) y sea una bomba o tanga bombas alrededor, si es bomba o tiene bombas alrededor se regenera el tablero
        while(this.tablero[x][y].tile.id == "bomba" && primerClick == false || this.tablero[x][y].nearBombs != 0 && primerClick == false){
            this.tablero = [];
            this.tableroPadre.innerHTML = "";
            // console.log("Se borró y regeneró el tablero");
            this.posicionesB = 0;
            this.posicionesB = this.generarTablero();
            this.getNearBombs(x,y, primerClick);
            this.getSurroundings(x,y, primerClick);
            //Siguiente paso 30 de junio de 2025 hacer recursivo que cheque donde no hay bombas contiguas y las revele. Puede ser que cheque abajo luego de lado derecho para arriba o puede verificar radialmente a la casilla seleccionada y que esas luego vuelvan a preguntar radialmente.
        }
    }

    async revBombs(posiciones, gano){
        const fondoWin = document.createElement("div");
        const fondoLose = document.createElement("div");
        for(let col = 0; col < this.numCasillas; col++){
            for(let row = 0; row < (this.numCasillas); row++){
                if(posiciones.includes(`${col},${row}`)){
                    this.tablero[col][row].revelar();
                }
            }
        }
        await delay(600);
        if(gano == false){
            fondoLose.style.backgroundColor = "#0000002c";
            fondoLose.style.backgroundImage = "url(../../statics/imgs/game_over.png)";
            fondoLose.style.backgroundPosition = "center";
            fondoLose.style.backgroundRepeat = "no-repeat";
            fondoLose.style.position = "absolute";
            fondoLose.style.width = "inherit";
            fondoLose.style.height = "inherit";
            fondoLose.style.zIndex = "5";
            for(let a = 1; a <= 100; a++){
                fondoLose.style.backgroundSize = `${a}%`;
                this.tableroPadre.appendChild(fondoLose);
                await delay(10);
            }
        } else {
            fondoWin.style.backgroundColor = "#0000002c";
            fondoWin.style.backgroundImage = "url(../../statics/imgs/backGWin.png)";
            fondoWin.style.backgroundPosition = "center";
            fondoWin.style.backgroundRepeat = "no-repeat";
            fondoWin.style.position = "absolute";
            fondoWin.style.width = "inherit";
            fondoWin.style.height = "inherit";
            fondoWin.style.zIndex = "5";
            for(let a = 1; a <= 100; a++){
                fondoWin.style.backgroundSize = `${a}%`;
                this.tableroPadre.appendChild(fondoWin);
                await delay(10);
            }
        }
    }

    gana(){
        let rev = 0;
        for(let col = 0; col < this.numCasillas; col++){
            for(let row = 0; row < (this.numCasillas); row++){
                if(this.tablero[col][row].revelado == true){
                    rev++;
                }
            }
        }
        if((rev + this.bombas) == (this.numCasillas * this.numCasillas)){ //Si los revelados + las bombas es igual al número total de casillas, gana.
            this.revBombs(this.posicionesB, true);
            this.guardarP.style.display = "flex";
            return true;
        } else{
            return false;
        }
    }

    async runCrono(){
        let seg = 0;
        let min = 0;
        let hr = 0;
        console.log("Inicio crono");
        while(this.tablero && !this.endGame && this.primerClick == true && this.endGame == false){ //Cuando se acabe el juegp termina.
            seg++;
            console.log(seg);
            this.crono.innerHTML = `${hr} : ${min} : ${seg}`;
            if(seg == 59){
                seg = 0;
                min++;
            }
            if(min == 59){
                min = 0;
                hr++;
            }
            this.duracion = `${hr}:${min}:${seg}`;
            await delay(1000);// Aquí porque sino cuando pierde al final aumenta en uno.
        }
        console.log("Fin crono");
    }

    verifyPos(){
        this.tableroPadre.addEventListener("mousedown", (evento)=>{
            if(this.endGame == true) return;
            if(evento.target.id == "contenedorTablero") return; //Para que no trate de agarrar el datasety y datasetx que no existe en el padre.
            if(evento.target.disabled) return;
            this.x = parseInt(evento.target.dataset.x);
            this.y = parseInt(evento.target.dataset.y);
            this.getNearBombs(this.x,this.y);
            //En el primer click
            if(!this.primerClick && evento.button == 0 && !this.tablero[this.x][this.y].bandera){
                this.alPrimerClick(this.x, this.y, this.primerClick);
                this.primerClick = true;
                this.puntajes.style.display = "none";
                this.runCrono();
            } else if(evento.button == 2){
                if(!this.tablero[this.x][this.y].bandera){
                    this.tablero[this.x][this.y].flaged();
                } else{
                    this.tablero[this.x][this.y].unflag();
                }
            //Después del primer click
            } else if(this.primerClick && evento.target.classList.contains("boton") && evento.button == 0 && !this.tablero[this.x][this.y].bandera){ //Si es botón, dió click izquierdo y no tiene bandera.
                this.tablero[this.x][this.y].revelar();
                evento.target.disabled = true;
                if(this.tablero[this.x][this.y].nearBombs == 0){ //Si pica en alguna que no tenga bombas cercanas que se revelen todas las contiguas que no tengan bombas, así pasa en el juego en línea.
                    this.getSurroundings(this.x, this.y, false);
                }
                if(this.tablero[this.x][this.y].tile.id == "bomba"){
                    this.endGame = true;
                    this.tableroPadre.style.pointerEvents = "none";
                    this.revBombs(this.posicionesB, false);
                }
            }
            
            if(this.gana()){
                this.endGame = true;
                this.tableroPadre.style.pointerEvents = "none";
                return;
            }

        });
    }
}