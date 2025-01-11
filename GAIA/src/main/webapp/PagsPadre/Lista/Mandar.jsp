
<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.Modelo.PEmbarazo"%>
<%@page import="com.Modelo.ActsUser"%>
<%@page import="com.Modelo.Usuario"%>
<%@page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="javax.servlet.http.HttpSession" %>

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
        String apodo = usr.getApodo();
        String fecha = act.fecha(user);
        String id_usuario = act.BuscarSesion(user);
        String id_padre = act.BuscarPadre2(id_usuario);
        PEmbarazo padre = act.BuscarPadre(id_padre);
        String semanas = padre.getSemanas();

%>
<!DOCTYPE html>
<html>

    <!-- Asteria: Proyecto GAIA-->
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>Lista de médicos </title>
        <link rel="stylesheet" href="../../CSS/1MiPerfil.css">
            <link rel="stylesheet" href="../../CSS/FOROS.css"> 

            

</head>
<style>
    form input[type="text"],
form input[type="email"],
form input[type="number"],
form input[type="date"],
form input[type="password"]{
	width:200px;
	padding:4px 14px;
	border:1px solid #F5F5EF;
	border-radius:3px;
	background-color:#F5F5EF;
	margin:8px 14px;
	display:inline-block;
}
</style>
<body>
    <header id="main-header">
        <a id="logo-header" href="#">
            <span class="site-name">GAIA</span>
            <span class="site-desc">Por Asteria</span>
        </a>
        <nav>
            <ul>
                 <li class="chat-icon"><a href="../Chat/Lista_Chats.jsp"><img src="../../IMG/chat-icon.png" alt="alt"/></img></a></li>
                <li><a href="../InicioPadre.jsp">Inicio</a></li>
            </ul>
        </nav>
    </header>
    
     <section id="main-content">
    <div class="cont">
        <h1>Mandar solicitud a un médico</h1>
        <a href="Medicos.jsp">Ver lista de médicos</a>
        
    <form action= "../../SolicitudPem" method="post">
        <label for="mail">Correo electrónico del médico</label><br>
        <input type="email" id="user_mail" name="user_mail" placeholder="Ingrese el correo" value="" 
               maxlength="320" required/>
        <br>
        <hr>

<input type="submit" class="boton" name="mandar" value="Mandar solicitud"/>
<input type="button" class="boton" name="cancelar" value="Cancelar" onClick="window.location.assign('Medicos.jsp');">
<br>
    </form>
    </div>
     </section>
</body>
</html>
<% }%>