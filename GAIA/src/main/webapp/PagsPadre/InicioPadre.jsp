
<%@page import="com.Modelo.ActsUser"%>
<%@page import="com.Modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%
    boolean LoggedIn=false;
    String algo="";
    try {
        HttpSession objSesion = request.getSession();
        
        String logged = objSesion.getAttribute("loggedIn").toString();
        
        if ("false".equals(logged)) {
            response.sendRedirect("../index.jsp");
            
        } else {
            LoggedIn = true;
        }
    } catch (Exception e) {
        LoggedIn = true;
    }
    
    if (LoggedIn==true) {
        HttpSession objSesion = request.getSession();
        String user = objSesion.getAttribute("loggedUser").toString();
        ActsUser act = new ActsUser();
        Usuario usr = act.Usuario(user);
        String nombre = usr.getNombre();

%>
<!DOCTYPE html>
<html>
<!-- Asteria: Proyecto GAIA-->
 <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title> Inicio </title>
    <link rel="stylesheet" href="../CSS/1Inicio.css">
 </head>
 <body>
   <header id="main-header">
 		<a id="logo-header" href="#">
 			<span class="site-name">GAIA</span>
 			<span class="site-desc">Por Asteria</span>
 		</a>
 		<nav>
 			<ul>
        <li><a href="Agenda.jsp">Agenda</a></li>
 				<li><a href="MiPerfil.jsp">Usuario</a></li>
 			</ul>
 		</nav>
 	</header>
     
     <%out.println("<h1>" + nombre +"</h1>"); %>
   <DIV id="contenedor">
   <div id="D1">
     <h3>Foros</h3>
     <a href="MenuForoPa.html">
        <img id="img" src="../IMG/1Inicio1.png" alt="I1" />
     </a>
   </div>
   <div id="D2">
     <h3>Información</h3>
     <a href="MenuInformacion.html">
        <img id="img" src="../IMG/1Inicio2.png" alt="I2" />
     </a>
   </div>
   <div id="D3">
     <h3>Registro</h3>
     <a href="MenuRegistro.html">
        <img id="img" src="../IMG/1Inicio3.png" alt="I3" />
     </a>
   </div>
   </DIV>
 </body>
</html>
<% } %>