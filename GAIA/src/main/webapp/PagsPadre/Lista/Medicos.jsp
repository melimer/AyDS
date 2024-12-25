
<%@page import="com.Modelo.Medico"%>
<%@page import="com.Modelo.Pamed"%>
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
        Pamed pamed = new Pamed();
        ArrayList<Pamed> lista = pamed.getMedicos(id_padre);

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
                    <li><a href="../InicioPadre.jsp">Inicio</a></li>
                </ul>
            </nav>
        </header>

        <section id="main-content">
            <div class="container">
                <div class="cont">
                    <h1>Sus médicos</h1>
                    <a href="Solicitudes.jsp">Ver solicitudes</a>
                    <a href="Mandar.jsp">Mandar una solicitud</a>

                    <table id="tabla1">
                        <tr>
                            <td>Nombre</td>
                            <td> Cedula</td>
                            <td> Especialidad </td>
                            <td> Correo </td>
                            <td> Acción </td>
                        </tr>
                        <% for (Pamed pa : lista) {
                                String datos[] = new String[2];
                                String id = act.BuscarUsuarioMedico(pa.getId_medico());
                                datos = act.BuscarPorId(id);
                                Medico med = act.BuscarDR(pa.getId_medico());
                        %>
                        <tr>
                            <td><%out.println(datos[0]); %></td>
                            <td><%out.println(med.getCedula());%></td>
                            <td><%out.println(med.getEspecialidad());%></td>
                            <td><%out.println(datos[1]); %></td>
                            <td>
                                <form action="../../ProcesarPamed" method="post">
                                    <input value="2" name="tipo_usr" id="tipo_usr" hidden>
                                    <input value="<% out.print(pa.getId_medico());%>" name="id_medico" id="id_medico" hidden>
                                    <input value="<% out.print(id_padre);%>" name="id_persona" id="id_persona" hidden>
                                    <button name="accion" type="submit" value="eliminar">Eliminar</button>
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