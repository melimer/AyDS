
<%@page import="com.Modelo.Usuario"%>
<%@page import="com.Modelo.Sintomas"%>
<%@page import="com.Modelo.SintomasCRUD"%>
<%@page import="com.Modelo.ActsUser"%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%boolean LoggedIn;
    try {
        HttpSession objSesion = request.getSession();
        String logged = objSesion.getAttribute("loggedIn").toString();
        if ("false".equals(logged)) {
            response.sendRedirect("../index.html");
            LoggedIn = true; 
        } else {
            LoggedIn = true;
        }
    } catch (Exception e) {
        LoggedIn = true;
    }
    if (LoggedIn) {
        HttpSession objSesion = request.getSession();
        String user = objSesion.getAttribute("loggedUser").toString();
        ActsUser act = new ActsUser();
        Usuario usr = act.Usuario(user);
        String nombre = usr.getNombre();
        String correo = usr.getCorreo();
        String id_usuario = act.BuscarSesion(correo);
        String id_padre = act.BuscarPadre2(id_usuario);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>


        <title> Sintomas del Embarazo </title>
        <link rel="stylesheet" href="../../CSS/Sintomas.css">
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="sweetalert.js"></script>
        <link rel="stylesheet" href="sweetalert2.css">
    </head>
    <body>
        <header id="main-header">
            <a id="logo-header" href="#">
                <span class="site-name">GAIA</span>
                <span class="site-desc">Por Asteria</span>
            </a>
            <nav>
                <ul>
                    <li><a href="../MenuRegistro.html">Registro</a></li>
                    <li><a href="../InicioPadre.jsp">Inicio</a></li>
                    <li><a href="../MiPerfil.jsp">Usuario</a></li>
                </ul>
            </nav>
        </header>


        <div id="PanelAcciones">
            <button onclick="window.location.assign('FormularioSintomas.jsp');" class="btns" id="btnAgrega"> Registrar sintomas de hoy</button>
            <br><br>
        </div>
        <p></p>
        <div id="vistaRegis">

            <fieldset id="contenedor">
                <legend> Registros </legend>
                <%

                    SintomasCRUD sinC = new SintomasCRUD();
                    ArrayList<Sintomas> lista = sinC.ConsultaTotal(id_padre);
                    for (Sintomas sin : lista) {
                        String presentadosF = "";
                        String presentadosE = "";
                        if (sin.getDolor() == true || sin.getNauseas() == true || sin.getFatiga() == true || sin.getSe_sensible() == true
                                || sin.getHinchazon() == true || sin.getConstipacion() == true || sin.getVomito() == true || sin.getCalambres() == true
                                || sin.getSangrado() == true) {
                            if (sin.getDolor() == true) {
                                presentadosF = " dolor de cabeza,";
                            }
                            if (sin.getNauseas() == true) {
                                presentadosF = presentadosF + " nauseas,";
                            }
                            if (sin.getFatiga() == true) {
                                presentadosF = presentadosF + " fatiga,";
                            }
                            if (sin.getSe_sensible() == true) {
                                presentadosF = presentadosF + " senos sensibles,";
                            }
                            if (sin.getHinchazon() == true) {
                                presentadosF = presentadosF + " hinchazon,";
                            }
                            if (sin.getConstipacion() == true) {
                                presentadosF = presentadosF + " estreñimiento,";
                            }
                            if (sin.getVomito() == true) {
                                presentadosF = presentadosF + " vomito,";
                            }
                            if (sin.getCalambres() == true) {
                                presentadosF = presentadosF + " calambres,";
                            }
                            if (sin.getSangrado() == true) {
                                presentadosF = presentadosF + " sangrado vaginal,";
                            }

                            presentadosF = presentadosF.substring(0, presentadosF.length() - 1);
                        } else {
                            presentadosF = "No se presentó ningún malestar físico";
                        }
                        if (sin.getFeliz() == true || sin.getTriste() == true || sin.getSensible() == true || sin.getDisgusto() == true || sin.getIra() == true
                                || sin.getAngustia() == true || sin.getConfusion() || sin.getTranquilidad()) {
                            if (sin.getFeliz() == true) {
                                presentadosE = " felicidad,";
                            }
                            if (sin.getTriste() == true) {
                                presentadosE = presentadosE + " tristeza,";
                            }
                            if (sin.getSensible()) {
                                presentadosE = presentadosE + " sensibilidad,";
                            }
                            if (sin.getDisgusto()) {
                                presentadosE = presentadosE + " disgusto,";
                            }
                            if (sin.getIra()) {
                                presentadosE = presentadosE + " ira,";
                            }
                            if (sin.getAngustia()) {
                                presentadosE = presentadosE + " angustia,";
                            }
                            if (sin.getConfusion()) {
                                presentadosE = presentadosE + " confusión,";
                            }
                            if (sin.getTranquilidad()) {
                                presentadosE = presentadosE + " tranquilidad,";
                            }
                            presentadosE = presentadosE.substring(0, presentadosE.length() - 1);
                        } else {
                            presentadosE = "No hubo emociones registradas";
                        }

                %>
                <details  id="todoslosRegistros">

                    <summary >Registro de síntomas hecho el: <%=sin.getFecha()%><button class="botones" onclick="actualizar<%=sin.getId()%>()">Actualizar</button><button class="botones" onclick="confirmar<%=sin.getId()%>()">Eliminar</button></summary>
                    <h4>Síntomas físicos</h4>
                    <p>Los síntomas presentados fueron: <%=presentadosF%>.</p>
                    <h4>Emociones</h4>
                    <p>Las emociones presentadas fueron: <%=presentadosE%>.</p>
                    <p>Notas agregadas al registro:</p>
                    <textarea name="notas" id="textoNo" class="textarea" rows="10" cols="48" maxlength="140" readonly><%=sin.getNotas()%> </textarea>
                    <br><hr>
                </details><br>
                <script>
                    function confirmar<%=sin.getId()%>() {
                        Swal.fire({
                            title: 'Advertencia!',
                            text: '¿Estás seguro de eliminar este registro?',
                            icon: 'warning',
                            cancelButtonColor: "#E9B7B5",
                            showCancelButton: true,
                            confirmButtonColor: "#B4CDB4",
                            confirmButtonText: '<a class=visto href="../../SintomasEm?accion=elimina&id=<%=sin.getId()%>">Confirmar</a>',
                            cancelButtonText: '<a class=visto>No eliminar</a>'
                        })
                    }
                    
                    function actualizar<%=sin.getId()%>() {
                       window.location.assign("FormularioSintomas.jsp?id=<%=sin.getId()%>");
                    }
                </script>

                <%
                    }
}
                %>
            </fieldset>
        </div>

        <script src="../../JS/AccSintomas.js"></script>
    </body>
</html>
