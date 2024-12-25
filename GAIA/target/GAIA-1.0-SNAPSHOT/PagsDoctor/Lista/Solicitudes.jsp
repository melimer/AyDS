
<%@page import="com.Modelo.SolicitudPadre"%>
<%@page import="com.Modelo.Medico"%>
<%@page import="com.Modelo.SolicitudMedico"%>
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
        SolicitudMedico soli = new SolicitudMedico();
        ActsUser act = new ActsUser();
                    String id_usuario = act.BuscarSesion(user);
                    String id_medico = act.BuscarDRUsuario(id_usuario);
                    ArrayList<SolicitudPadre> lista = soli.SolicitudesRecibidas(id_medico);
                    
%>
<!DOCTYPE html>
<html>

    <!-- Asteria: Proyecto GAIA-->
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>Solicitudes </title>
        <link rel="stylesheet" href="../../CSS/1MiPerfil.css">
            <link rel="stylesheet" href="../../CSS/FOROS.css">
            

</head>
<body>
    <header id="main-header">
        <a id="logo-header" href="#">
            <span class="site-name">GAIA</span>
            <span class="site-desc">Por Asteria</span>
        </a>
        <nav>
            <ul>
                <li><a href="../InicioMed.jsp">Inicio</a></li>
            </ul>
        </nav>
    </header>
    
     <section id="main-content">
    <div class="container">
    <div class="cont">
        <h1>Sus solicitudes</h1>
        <p>Aquí puede consultar las personas embarazadas que le hayan mandado solicitud. 
            Aceptar la solicitud de una persona embarazada le permite a la persona embarazada visualizar sus horarios de consulta y agendar citas. Además, podrá visualizar los registros de síntomas, cambios en el embarazo y estudios médicos que suba la persona embarazada.</p>
        <a href="Pacientes.jsp">Ver lista de pacientes</a>
        
    <table id="tabla1">
      <tr>
          <td> Nombre </td>
          <td> Correo </td>
          <td> Acción </td>
      </tr>
          <% for(SolicitudPadre solicitud: lista){
              String id = act.BuscarUsuarioPersona(solicitud.getId_persona());
              String datos[] = act.BuscarPorId(id);
         %>
      <tr>
          <td><% out.println(datos[0]); %></td>
          <td><% out.println(datos[1]); %></td>
            
          <td>
              <form action="../../ProcesarSolicitudes" method="post">
                <input value="1" name="tipo_soli" id="tipo_soli" hidden>
                <input value="<% out.print(solicitud.getId_soli_pa());%>" name="id_soli" id="id_soli" hidden>
                <button name="accion" type="submit" value="aceptar">Aceptar</button> 
                <button name="accion" type="submit" value="rechazar">Rechazar</button>
              </form>
          </td>
          
      </tr>
          <% }%>
    </table>
    </div>
    </div>
     </section>
</body>
</html>
<% }%>