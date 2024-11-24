var agrebtn=document.getElementById('btnAgrega');
var formu=document.getElementById('Formulario');
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
    location.reload();
}

function seRegistro(){
    agrebtn.hidden=false;
    formu.hidden=true;
    registros.hidden=false;
    noagrebtn.hidden=true;
}

function gi(id) {
    return document.getElementById(id);
}
function refresh() {
    location.reload();
}
function agregarCita() {
    gi("divFormulario").style.display = 'inline';
}
function ocultarForm() {
    gi('ifecha').value = '';
    gi('ititulo').value = '';
    gi('itext').value = '';
    gi("divFormulario").style.display = 'none';
}
function guardar() {
    gi("formulario").submit();
    refresh();
    ocultarForm();
}

/*Por cada registro*/

function cancelar(id, id2, id3) {
    var form = id.toString();
    var borrar = id2.toString();
    var editar = id3.toString();
    gi(form).style.display = 'none';
    gi(borrar).style.display = 'inline';
    gi(editar).style.display = 'inline';
    id = "", id2 = "", id3 = "";
}
function abrirDialogo(dialog) {
    var id = dialog.toString(); //dialog = <%=p.getId_Pagina() + 9%>
    console.log(id);
    var dialogo = gi(id);
    dialogo.showModal();
}
function cerrarDialogo(dialog) {
    var id = dialog.toString();
    var dialogo = gi(id);
    dialogo.close();
}
function borrar() {
    gi("borrarPag").submit();
    refresh();
    cerrarDialogo();
}










