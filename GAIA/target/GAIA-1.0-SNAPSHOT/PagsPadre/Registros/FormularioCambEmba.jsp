

<%@page import="com.Modelo.CamEmb"%>
<%@page import="com.Modelo.CamEmbCRUD"%>
<%@page import="com.Modelo.Usuario"%>
<%@page import="com.Modelo.ActsUser"%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title> Cambios-Embarazo </title>
    <h1><%out.println(request.getParameter("id"));%></h1>
        <link rel="stylesheet" href="../../CSS/cambem.css">
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
                    <li><a href="../MiPerfil.jsp">Usuario</a></li>
                    <li><a href="../InicioPadre.jsp">Inicio</a></li>
                </ul>
            </nav>
        </header>

        <div id="Panel Acciones">
            <button class="btns" onclick="window.location.assign('Camb_emba.jsp')"> Ver Cambios del Embarazo</button>

        </div>
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
        if(request.getParameter("id") == null){
%>

        <div id="">
            <form action= "../../AgregarCamEm" method="Post" id="formulario">
                <input hidden name="id_padre" value="<%=id_padre%>">
                <h2> Cambios embarazo </h2>
                <p for="antojos">Antojos:</p>
                <ul>
                    <li><input type="text" id="antojos" name="antojos" maxlength="20" required></li>
                </ul>
                <p for="sexo"> ¿Ha habido cambios en la piel? </p>
                <ul>
                    <li> <input type="radio" name="cambios_piel" value="true" onclick="document.getElementById('cambios_pdes').disabled = false;"/> Si </li>
                    <li> <input type="radio" name="cambios_piel" value="false" onclick="document.getElementById('cambios_pdes').disabled = true; document.getElementById('cambios_pdes').value = '';"/> No </li>
                </ul>
                <p for="cambpiel">Cambios en la piel</p>
                <ul>
                    <li><input type="text" id="cambios_pdes" name="cambios_pdes" maxlength="50"></li>
                </ul>
                <p for="orina">Frecuencia al orinar</p>
                <ul>
                    <li><input type="text" id="frecuencia_u" name="frecuencia_u" maxlength="15" required></li>
                </ul>
                <p for="dpanza">Diámetro de la barriga</p>
                <ul>
                    <li><input type="number" id="diametro_p" name="diametro_p" placeholder="cm" maclength="140" required></li>
                </ul>
                <p for="notas">Notas</p>
                <ul>
                    <li><input type="text" id="notas_ce" name="notas_ce" maxlength="140"></li>
                </ul>
                <hr>
                <input type="submit" name="guardar" value="Guardar"/>
                <input type="Reset" value="Borrar todo">
            </form>
        </div>
<%}else{
    CamEmbCRUD camcrud = new CamEmbCRUD();
    CamEmb cam = camcrud.buscarCambioEm(Integer.parseInt(request.getParameter("id")));
    String piel1 = cam.getCambios_piel()==true?"true":"false";
    String piel2 = cam.getCambios_piel()==false?"true":"false";
    String campiel = cam.getCambios_pdes();
    if(campiel == null){
        campiel = " ";
    }
%>
    <div id="">
            <form action= "../../ModifCamEm" method="Post" id="formulario">
                <input hidden name="id_padre" value="<%=id_padre%>">
                <input hidden name="id_cam_emba" value="<%=request.getParameter("id")%>">
                <h2> Cambios embarazo </h2>
                <p for="antojos">Antojos:</p>
                <ul>
                    <li><input type="text" id="antojos" name="antojos" maxlength="20" value="<%out.println(cam.getAntojos());%>" required></li>
                </ul>
                <p for="sexo"> ¿Ha habido cambios en la piel? </p>
                <ul> 
                    <li> <input type="radio" name="cambios_piel" <% if(piel1.equals("true")){%> checked <%}%> value="true" onclick="document.getElementById('cambios_pdes').disabled = false;"/> Si </li>
                    <li> <input type="radio" name="cambios_piel" <%if(piel2.equals("true")){%> checked <%}%>  value="false" onclick="document.getElementById('cambios_pdes').disabled = true; document.getElementById('cambios_pdes').value = '';"/> No </li>
                </ul>
                <p for="cambpiel">Cambios en la piel</p>
                <ul>
                    <li><input type="text" id="cambios_pdes" name="cambios_pdes" <%if(piel2.equals("true")){%> disabled <%}%> maxlength="50" value="<%out.println(campiel);%>"></li>
                </ul>
                <p for="orina">Frecuencia al orinar</p>
                <ul>
                    <li><input type="text" id="frecuencia_u" name="frecuencia_u" maxlength="15" value="<%out.println(cam.getFrecuencia_u());%>" required></li>
                </ul>
                <p for="dpanza">Diámetro de la barriga</p>
                <ul>
                    <li><input type="number" id="diametro_p" name="diametro_p"  maxlength="140" value="<%out.print(cam.getDiametro_p());%>" required></li>
                </ul>
                <p for="notas">Notas</p>
                <ul>
                    <li><input type="text" id="notas_ce" name="notas_ce" maxlength="140" value="<%out.println(cam.getNotas_ce());%>"></li>
                </ul>
                <hr>
                <input type="submit" name="guardar" value="Guardar"/>
                <input type="Reset" value="Borrar todo">
            </form>
        </div>

<%}
}
%>
        <script type="text/javascript" src="../../JS/calendario.js"></script>
    </body>
</html>