
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.Modelo.ActsUser" %>
<%@page import="com.Modelo.Usuario" %>
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
%>
<!DOCTYPE html>
<html>
 <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title> Inicio Médico </title>
    <link rel="stylesheet" href="../CSS/InicioMed.css">
 </head>
 <body>
   <header id="main-header">
 		<a id="logo-header" href="#">
 			<span class="site-name">GAIA</span>
 			<span class="site-desc">Por Asteria</span>
 		</a>
 		<nav>
 			<ul>
                            <li><a href="AgendaMed.jsp">Agenda</a></li>
 				<li><a href="PerfilMed.jsp">Usuario</a></li>
 			</ul>
 		</nav>
 	</header>
     <h1><% out.println(nombre); %></h1>
   <DIV id="contenedor">
   <div id="D1">
     <h3>Foros</h3>
     <a href="MenuForoDoc.html">
        <img id="img" src="../IMG/InicioMed.png" alt="I1" />
     </a>
   </div>
   </DIV>
 </body>
</html>
<% } %>
