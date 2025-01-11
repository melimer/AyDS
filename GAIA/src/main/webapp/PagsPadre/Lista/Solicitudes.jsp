
<%@page import="com.Modelo.Medico"%>
<%@page import="com.Modelo.SolicitudMedico"%>
<%@page import="com.Modelo.SolicitudPadre"%>
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
        String id_usuario = act.BuscarSesion(user);
        String id_padre = act.BuscarPadre2(id_usuario);
        SolicitudPadre soli = new SolicitudPadre();
        ArrayList<SolicitudMedico> lista = soli.SolicitudesRecibidas(id_padre);

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
            <div class="container">
                <div class="cont">
                    <h1>Sus solicitudes</h1>
                    <p>Aquí puede consultar los médicos que le hayan mandado solicitud. 
                        Aceptar la solicitud de un médico le permite al médico visualizar sus registros de síntomas, estudios médicos y citas, por lo que asegurese de
                        aceptar únicamente a los médicos que usted desee que visualicen estos datos.</p>
                    <a href="Medicos.jsp">Ver lista de médicos</a>

                    <table id="tabla1">
                        <tr>
                            <td>Nombre</td>
                            <td> Cedula</td>
                            <td> Especialidad </td>
                            <td> Correo </td>
                            <td> Acción </td>
                        </tr>
                        <% for (SolicitudMedico solicitud : lista) {
                                String id = act.BuscarUsuarioMedico(solicitud.getId_medico());
                                String datos[] = act.BuscarPorId(id);
                                Medico med = act.BuscarDR(solicitud.getId_medico());
                        %>
                        <tr>
                            <td><% out.println(datos[0]); %></td>
                            <td><%out.println(med.getCedula());%></td>
                            <td><%out.println(med.getEspecialidad());%></td>
                            <td><%out.println(datos[1]); %></td>

                            <td>
                                <form action="../../ProcesarSolicitudes" method="post">
                                    <input value="2" name="tipo_soli" id="tipo_soli" hidden>
                                    <input value="<%out.print(solicitud.getId_soli_med());%>" name="id_soli" id="id_soli" hidden>
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