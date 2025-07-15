export class Casilla{
    
    constructor(divTableroPadre, posXY){
        this.nearBombs = 0;
        this.revelado = false;
        this.bandera = false;
        this.posXY = posXY;
        this.tabM = []; //Cada casilla tiene como atributo su tablero donde está constenido.
        // this.estado=[
        //     [true, "bomba", this.nearBombs, "libre"],
        //     [false, "bandera"]
        // ];
        // this.tipo = tipo;
        this.tile = document.createElement("div");
        this.tile.dataset.x = this.posXY[0]; //Se guarda en el dataset-x la posicion en x del objeto y dataset-y la de y, estos dato ahora son parte de this.tile un elemento del DOM.
        this.tile.dataset.y = this.posXY[1]; //dataset es una propiedad de los elemetos HTML que te permite guardar y acceder a datos  personalizados 
        this.tile.classList.add("boton");
        this.tile.setAttribute("style", "display: flex; position: relative");
        divTableroPadre.appendChild(this.tile);
        // this.tile.addEventListener("click", (evt)=>{
        //     this.revelar(evt);
        // });
    }
    revelar(){
        this.revelado = true;
        this.tile.style.backgroundColor = "#c9be2a";
        if(this.nearBombs > 0){
            this.tile.innerText = `${this.nearBombs}`;
        }
        if(this.nearBombs == 1){
            this.tile.style.color = "#3c850c";
        }
        if(this.nearBombs == 2){
            this.tile.style.color = "#82560E";
        }
        if(this.nearBombs == 3){
            this.tile.style.color = "#5C2D0E";
        }
        if(this.nearBombs >= 4){
            this.tile.style.color = "#871A0E";
        }
        this.tile.style.pointerEvents = "none";
    }
}