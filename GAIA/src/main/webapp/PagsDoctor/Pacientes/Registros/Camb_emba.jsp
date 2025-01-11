

<%@page import="com.Modelo.CamEmb"%>
<%@page import="com.Modelo.CamEmbCRUD"%>
<%@page import="com.Modelo.Usuario"%>
<%@page import="com.Modelo.ActsUser"%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="javax.servlet.http.HttpSession" %>
<%boolean LoggedIn;
    try {
        HttpSession objSesion = request.getSession();
        String logged = objSesion.getAttribute("loggedIn").toString();
        if ("false".equals(logged)) {
            response.sendRedirect("../../../index.html");
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
        String id_padre = request.getParameter("id");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title> Cambios-Embarazo </title>

        <link rel="stylesheet" href="../../../CSS/cambem.css">
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
                    <li><a href="../MenuPacientes.jsp?id=<% out.print(id_padre);%>">Menú Registros</a></li>
                    <li><a href="../../Lista/Pacientes.jsp">Pacientes</a></li>
                    <li><a href="../../InicioMed.jsp">Inicio</a></li>
                </ul>
            </nav>
        </header>

        <div id="camb">
            <fieldset id="contenedor">
                <legend> Cambios </legend>
                <%
                    CamEmbCRUD accion = new CamEmbCRUD();
                    ArrayList<CamEmb> lista = accion.todosCambiosEm(Integer.parseInt(id_padre)); //id_padre
                    for (CamEmb c : lista) {
                        String camPiel = "";
                        if(c.getCambios_piel() == false){
                            camPiel = "No se presentó ningun cambio en la piel";
                        }else{
                            camPiel = c.getCambios_pdes();
                        }
                %>
                <details id="todoslosRegistros">
                    <summary>Cambio realizado el: <%=c.getFecha_cam_em()%></summary><br>
                    <p>Antojos: <%=c.getAntojos()%></p>
                    <p>Cambios en la piel: <%=camPiel%></p>
                    <p>Frecuencia al orinar: <%=c.getFrecuencia_u()%></p>
                    <p>Diámetro de la barriga: <%=c.getDiametro_p()%> cm</p>
                    <p>Notas del cambio:</p>
                    <textarea class="textarea" id="textoNo" rows="10" cols="48" maxlength="140" readonly><%=c.getNotas_ce()%></textarea>
                    <hr>
                </details>
                <br>
                <%
                    }
                %>
            </fieldset>
        </div>
        <script type="text/javascript" src="../../JS/calendario.js"></script>
    </body>
</html>
<%}%>