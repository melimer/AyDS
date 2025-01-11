

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
<script type='text/javascript'>
    function borrar(){
    var r = confirm("¿Está seguro que desea eliminar su cuenta?");
    if (r === true) {
        document.body.innerHTML += '<form id="borrarJS" action="../BorrarUsuarioPadre" method="post"><input type="submit" name="" value=""></form>';
        document.getElementById("borrarJS").submit();
        }
    }
    function cerrar(){
    var r = confirm("¿Está seguro que desea cerrar sesión?");
    if (r === true) {
        document.body.innerHTML += '<form id="cerrarJS" action="../CerrarSesion" method="post"><input type="submit" name="" value=""></form>';
        document.getElementById("cerrarJS").submit();
        }
    }
    
    function actualizar(){
            window.location.assign("RPM.jsp");

    }
</script>
    <!-- Asteria: Proyecto GAIA-->
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title> Mi Perfil </title>
        <link rel="stylesheet" href="../CSS/1MiPerfil.css">
</head>
<body>
    <header id="main-header">
        <a id="logo-header" href="#">
            <span class="site-name">GAIA</span>
            <span class="site-desc">Por Asteria</span>
        </a>
        <nav>
            <ul>
                 <li class="chat-icon"><a href="Chat/Lista_Chats.jsp"><img src="../IMG/chat-icon.png" alt="alt"/></img></a></li>
                <li><a href="InicioPadre.jsp">Inicio</a></li>
                <li><a href="Lista/Medicos.jsp">Lista de médicos</a></li>
            </ul>
        </nav>
    </header>

    <div class="cabeza">
        <img src="../IMG/Nutricion1.png" alt="IMGUSUARIO" class="avatar"/>
        <h1 class="nomusuario"> <%out.println(nombre);%></h1>
    </div>
    <div class="cont">
        <p> Correo electronico: <%out.println(correo);%></p>

        <p> Apodo: <%out.println(apodo);%></p>
        <p> Fecha en la que se unio: <% out.println(fecha);%></p>
        <%      Calendar cal = Calendar.getInstance();
                long millis=System.currentTimeMillis();  
                Date fechas = cal.getTime();
                fechas.setHours(00);
                fechas.setMinutes(00);
                fechas.setSeconds(00);
            if (semanas != null) {
                int semanasRes = Integer.parseInt(semanas);
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

                Date firstDate = sdf.parse(fecha);
                long diff1 = fechas.getTime() - firstDate.getTime();
                long diff= TimeUnit
                      .MILLISECONDS
                      .toDays(diff1)
                  % 365;
                int sem = (int)diff/7;
                int semenasTotal = semanasRes + sem;
                out.println("<p> Semanas de embarazo: " + semenasTotal + " semanas</p>");
            }

        %>
    </div>
        <center><input type="button" value="Cerrar Sesión" class="boton" onClick="cerrar()">
        <center><input type="button" value="Actualizar datos" class="boton" onClick="actualizar()">
       <input type="button" value="Eliminar cuenta" class="boton" onClick="borrar()"></center>
 

</body>
</html>
<% }%>