const add = document.getElementById("agregar");
const form = document.getElementById("form")
const enviar = document.getElementById("enviar");
const select_tipos = document.getElementById("select-tipos");

add.addEventListener("click", ()=>{
    form.style.display = "block";
});

enviar.addEventListener("click", ()=>{
    form.style.display = "none";
});

fetch("dynamics/php/tipos.php") //Toma solo en cuenta ruta absoluta, es decir, empieza a considerar las primeras carpetas o archivos que se encuentran dentro del proyecto.
    .then((response)=>{ //.then devuelve una promesa, ¿response es lo que regresa .then? Veo que cuando se convuerte a json, regresa una promesa en json.
        return response.json();
    })
    .then((datosJSON)=>{
        console.log(datosJSON);
        for(tipo of datosJSON){
            select_tipos.innerHTML += "<option value='" + tipo["type_id"]+ "'>" + tipo["type_name"] + "</option>";
        }
    })
    .catch((erro)=>{
        console.log("Hubo un error: \n" + erro);
    });