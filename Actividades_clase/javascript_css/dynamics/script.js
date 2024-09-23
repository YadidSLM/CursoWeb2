class cubo{
    constructor(tipo, tamano, marca){
        this.tipo = tipo;
        this.tamano = tamano;
        this.marc = marca;
    }
}

const dayan3X3 = new cubo('clásico', 3, 'Zhan Chi');

function por(a,b){
    console.log('Función llamada');
    return a * b;
}

console.log(por(4,5));

let v = 3;
console.log(parseInt('1111',2));
console.log(dayan3X3);
//'tipo' es un atributo de la instancia dayan3x3
console.log('marc' in dayan3X3);

let principal = new Array("Hey", 1, 3, "Sol");
let slice = principal.slice(1,5);
console.log(slice);
let cool = confirm("How you doing moto moto");

//Callback: Función con argumento de funciones
function saludo (func){
    console.log("Bienvenido: " + func());
}
//Lo que hace la función se define en la llamada a la función
saludo(()=>{
    return "Tucán libre";
});
