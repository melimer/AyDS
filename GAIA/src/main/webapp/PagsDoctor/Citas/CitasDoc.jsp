<%-- 
    Document   : CitasDoc
    Created on : 5 ene. 2025, 16:15:51
    Author     : karlaviles
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="com.Modelo.Cita"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.Modelo.CitasCRUD"%>
<%@page import="java.util.ArrayList"%>
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
        String correo = usr.getCorreo();
        String id_usuario = act.BuscarSesion(correo);
        String idMedico = act.BuscarMedico(id_usuario);
        System.out.println("idMeico" + idMedico);
        System.out.println("iduser " + id_usuario);
        CitasCRUD ci = new CitasCRUD();
        if (!ci.MedtieneHorarios(Integer.parseInt(idMedico))) {
            response.sendRedirect("RegistroHorarios.jsp");
        }

        List<Cita> citas = null;

        try {
            // Buscar las citas del paciente (idPersona)
            citas = ci.buscarCitasPorMedico(Integer.parseInt(idMedico));
        } catch (Exception e) {
            out.println("<p>Error al cargar las citas: " + e.getMessage() + "</p>");
        }
%>
<!DOCTYPE html>
<html>
    <link rel="stylesheet" type="text/css" href="../../CSS/Agenda.css">
    <head>
        <title> Agenda </title>
        <script>
            function toggleSection(sectionId) {
               const sectionContent = document.getElementById("section-" + sectionId);
                if (!sectionContent) {
                    console.error("Sección con ID section-" + sectionId + " no encontrada.");
                    return;
                }

                const sectionHeader = sectionContent.previousElementSibling;
                if (!sectionHeader) {
                    console.error("Elemento hermano previo para section-" + sectionId + " no encontrado.");
                    return;
                }

                const arrow = sectionHeader.querySelector(".arrow");
                if (!arrow) {
                    console.error("Elemento flecha no encontrado en el encabezado de la sección para section-" + sectionId + ".");
                    return;
                }

                // Toggle display of section content
                const isHidden = sectionContent.style.display === "none" || sectionContent.style.display === "";
                sectionContent.style.display = isHidden ? "block" : "none";

                // Rotate arrow
                arrow.classList.toggle("down", !isHidden);
                arrow.classList.toggle("up", isHidden);
            }


        </script>
    </head>

    <body>
        <header id="main-header">
            <a id="logo-header" href="#">
                <span class="site-name">GAIA</span>
                <span class="site-desc">Por Asteria</span>
            </a>
            <nav>
                <ul>
                    <li><a href="../PerfilMed.jsp">Usuario</a></li>
                    <li><a href="../InicioMed.jsp">Inicio</a></li>
                </ul>
            </nav>
        </header><br><br><br><br><br>
        <div class="container">
            <a id="btnAgrega" href="CrearCitaDoc.jsp">Agendar Cita</a>
            <!-- Section 1 -->
            <div class="section">
                <div class="section-header" onclick="toggleSection(1)">
                    <span>Citas confirmadas</span>
                    <span class="arrow down">▼</span>
                </div>
                <div id="section-1" class="section-content">

                    <%
                        if (citas != null && !citas.isEmpty()) {
                            DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
                            DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");

                            for (Cita cita : citas) {
                                String fecha = cita.getFecha().format(dateFormatter);
                                String horaInicio = cita.getHoraInicio().format(timeFormatter);
                                String horaFin = cita.getHoraFin().format(timeFormatter);
                                String lugar = cita.getLugar();
                                System.out.println(lugar);
                    %>
                    <div class="record">
                        <strong>Fecha:</strong> <%= fecha%><br>
                        <strong>Hora Inicio:</strong> <%= horaInicio%><br>
                        <strong>Hora Fin:</strong> <%= horaFin%><br>
                        <strong>Lugar:</strong> <%= lugar%><br>
                    </div>
                    <br><br>
                    <%
                        }
                    } else {
                    %>
                    <div class="record">No hay citas confirmadas.</div>
                    <%
                        }
                    %>



                </div>
            </div>
        </div>

        <!-- 
        <div class="section">
            <div class="section-header" onclick="toggleSection(2)">
                <span>Solicitudes</span>
                <span class="arrow down">▼</span>
            </div>
            <div id="section-2" class="section-content">
                <div class="record">Registro 2.1</div>
                <div class="record">Registro 2.2</div>
                <div class="record">Registro 2.3</div>
            </div>
        </div>
    
        
        <div class="section">
            <div class="section-header" onclick="toggleSection(3)">
                <span>Rechazadas</span>
                <span class="arrow down">▼</span>
            </div>
            <div id="section-3" class="section-content">
                <div class="record">Registro 3.1</div>
                <div class="record">Registro 3.2</div>
                <div class="record">Registro 3.3</div>
            </div>
        </div>
        -->
    </div>


</body>
</html>
<% }%>