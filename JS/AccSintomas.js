var agrebtn=document.getElementById('btnAgrega');
var formu=document.getElementById('formulario');
var registros=document.getElementById('vistaRegis');
var noagrebtn=document.getElementById('btnNoAgrega');

function agregar(){
    agrebtn.hidden=true;
    formu.hidden=false;
    registros.hidden=true;
    noagrebtn.hidden=false;
}
function NoAgregar(){
    agrebtn.hidden=false;
    formu.hidden=true;
    registros.hidden=false;
    noagrebtn.hidden=true;
}

function seRegistro(){
    agrebtn.hidden=false;
    formu.hidden=true;
    registros.hidden=false;
    noagrebtn.hidden=true;
}


 var selector=document.getElementById('espe');
    var est=document.getElementById('estatus');
    var desc=document.getElementById('textoNo');
    var fecha=document.getElementById('fechaF');
    var submi=document.getElementById('btnGua');
    var crear=document.getElementById('crear');
    var btn=document.getElementById('boton');
function actualizar(){    
    btn.hidden=true;
        submi.hidden=false;
        est.hidden=true;
        selector.hidden=false;
        desc.removeAttribute("readonly");
       fecha.removeAttribute("readonly");
       crear.hidden=false;
        
    }
    
