
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.Modelo.ActsUser" %>
<%@page import="com.Modelo.Usuario" %>
<%@page import="com.Modelo.Medico" %>
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
                    String id_doc = act.BuscarDRUsuario(id_usuario);
                    Medico med = act.BuscarDR(id_doc);
                    String especialidad = med.getEspecialidad();
                    String cedula = med.getCedula();
        
        %>

<!DOCTYPE html>
<html>
<script type='text/javascript'>
    function borrar(){
    var r = confirm("¿Está seguro que desea eliminar su cuenta?");
    if (r == true) {
        document.body.innerHTML += '<form id="borrarJS" action="../BorrarUsuarioDoctor" method="post"><input type="submit" name="" value=""></form>';
        document.getElementById("borrarJS").submit();
        }
    }
    function cerrar(){
    var r = confirm("¿Está seguro que desea cerrar sesión?");
    if (r == true) {
        document.body.innerHTML += '<form id="cerrarJS" action="../CerrarSesion" method="post"><input type="submit" name="" value=""></form>';
        document.getElementById("cerrarJS").submit();
        }
    }
</script>

<!-- Asteria: Proyecto GAIA-->
 <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title> Mi Perfil </title>
    <link rel="stylesheet" href="../CSS/PerfilMed.css">
    </style>
 </head>
 <body>
   <header id="main-header">
 		<a id="logo-header" href="#">
 			<span class="site-name">GAIA</span>
 			<span class="site-desc">Por Asteria</span>
 		</a>
 		<nav>
 			<ul>
 				<li><a href="InicioMed.jsp">Inicio</a></li>
 			</ul>
 		</nav>
 	</header>

   <div class="cabeza">
     <img src="../IMG/InicioMed.png" alt="IMGMED" class="avatar"/>
     <h1 class="nomusuario"> <%out.println(nombre);%> </h1>
   </div>
   <div class="cont">
     <p> Correo electrónico: <%out.println(correo);%></p>
     <p> Fecha en la que se unió: <%out.println(fecha);%></p>
     <p> Especialidad: <%out.println(especialidad);%></p>
     <p> Cédula: <%out.println(cedula);%></p>
   </div>

 <center><input type="button" value="Cerrar Sesión" class="boton" onClick="cerrar()">
       <input type="button" value="Eliminar cuenta" class="boton" onClick="borrar()">
       <input type="button" value="Actualizar datos" class="boton" onClick="window.location.assign('Rmed.jsp');"></center>
 

 </body>
</html>
<% }; %>