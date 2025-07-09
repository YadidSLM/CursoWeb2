const add = document.getElementById("agregar");
const form = document.getElementById("form")
const enviar = document.getElementById("enviar");
const select_tipos = document.getElementById("select-tipos");
const input = document.getElementById("input");
const opciones = document.getElementById("opciones");
const desplegarPok = document.getElementById("despliegue-pokemon");
const abc = ['a','b','c','d','e','f','g','h','i','j','k','l','ñ','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];

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
        console.log("Hubo un error en fetch 1: \n" + erro);
    });


input.addEventListener("keyup", (evento)=>{
    // console.log(typeof evento.key);
    //Recorre el abecedario si el input solo contiene valores del abecedario hace la petición.
    for(letra of abc){
        if((input.value).includes(letra)){
            fetch("dynamics/php/escribir_pokemon.php?q=" + input.value)
                .then((resp)=>{
                    return resp.json();
                })
                .then((datosDelJSON)=>{
                    // console.log("\nFetch 2: " + evento.key);
                    opciones.innerHTML = "";
                    for(pokemon of datosDelJSON){
                        console.log(pokemon);
                        opciones.innerHTML += "<div class='option' id='" + pokemon.pok_id + "'>" + pokemon.pok_name + "</div>";
                    }
                })
                .catch((error)=>{
                    console.log("Hubo un error en fetch 2: \n" + error);
                });
        }
        if(input.value == ""){
            opciones.innerHTML = "";
        }
    }
    
});

opciones.addEventListener("click", (evento)=>{
    if(evento.target.id){
        console.log(evento.target.id);
        let idPokemon = evento.target.id;
        fetch("dynamics/php/datos_pokemon.php?q=" + idPokemon)
            .then((response)=>{
                return response.json();
            })
            .then((datosDelJSON)=>{
                opciones.innerHTML = "";
                input.value = datosDelJSON.datos.pok_name;
                console.log(datosDelJSON);
                if(datosDelJSON.ok == true){
                    desplegarPok.innerHTML = "<div class='info'><strong>Nombre:</strong><br>" + datosDelJSON.datos.pok_name + "</div>" +
                                            "<div class='info'><strong>Experiencia<br> base:<br></strong><br>" + datosDelJSON.datos.pok_base_experience + "</div>" +
                                            "<div class='info'><strong>Altura:<br></strong><br>" + datosDelJSON.datos.pok_height + "</div>" +
                                            "<div class='info'><strong>Peso:<br></strong><br>" + datosDelJSON.datos.pok_weight + "</div>" +
                                            "<div class='info'><strong>Tipo de <br>pokemón:<br></strong><br>" + datosDelJSON.datos.type_name + "</div>";
                }
            })
            .catch((error)=>{
                console.log("Error en desplegar info de pokemon" + error);
            });
    }
});