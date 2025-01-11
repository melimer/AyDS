let id_medico;
let id_persona;
let tipo_emisor;
let id_emisor;
const MEDICO = "1";
const PERSONA = "0";

document.addEventListener("DOMContentLoaded", function () {
     let $data = document.querySelector("data");
     id_emisor = $data.getAttribute("data_e");
     let id_receptor = $data.getAttribute("data_r");
     tipo_emisor = $data.getAttribute("data_te");

     if (tipo_emisor === MEDICO) {
          id_medico = id_emisor;
          id_persona = id_receptor;
     } else {
          id_medico = id_receptor;
          id_persona = id_emisor;
     }

     document.getElementById("enviar").addEventListener("click", ()=>{
          let mensaje = document.getElementById("mensaje").value;
          if(mensaje != ""){
               let formData = new FormData();
               formData.append("id_medico", id_medico);
               formData.append("id_persona", id_persona);
               formData.append("tipo_emisor", tipo_emisor);
               formData.append("id_emisor", id_emisor);
               formData.append("cont", mensaje);

               let url = window.location.origin + "/GAIA/ProcesarMensajes"


               fetch(url, {
                    method: "POST",
                    body: formData
               }).then(response => {
                    let e = 1;
                    if (response.ok) {
                         document.getElementById("mensaje").value = "";
                         e = 0;
                    } 
                    cargarMensaje(mensaje, e);
               });
          }
     });
});


function cargarMensaje(mensaje, error){
     let $article = document.createElement("article");
     let $div1 = document.createElement("div");
     let $div2 = document.createElement("div");
     if(error){
          $article.classList.add("error");
          $imgError = document.createElement("img");
          $imgError.src = "../../IMG/error-msg.png";
          $article.appendChild($imgError);
     }

     $div1.innerHTML = obtenerTiempoActual();
     $div2.innerHTML = mensaje;
     $article.appendChild($div1);
     $article.appendChild($div2);
     let $main = document.querySelector(".main");
     $main.insertBefore($article, $main.firstChild);
}

function obtenerTiempoActual(){
      let now = new Date();

    let year = now.getFullYear();
    let month = String(now.getMonth() + 1).padStart(2, '0'); // Mes: +1 porque getMonth() empieza en 0
    let day = String(now.getDate()).padStart(2, '0'); // Día
    let hours = String(now.getHours()).padStart(2, '0'); // Hora
    let minutes = String(now.getMinutes()).padStart(2, '0'); // Minutos

    return `${day}-${month}-${year} ${hours}:${minutes}`;
}
