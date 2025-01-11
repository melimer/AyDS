<%-- 
    Document   : CrearCitaDoc
    Created on : 6 ene. 2025, 22:00:59
    Author     : karlaviles
--%>

<%@page import="com.Modelo.ActsUser"%>
<%@page import="com.Modelo.Usuario"%>
<%@page import="java.util.Map"%>
<%@page import="com.Modelo.CitasCRUD"%>
<%@page import="com.Modelo.DispMedico"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="stylesheet" type="text/css" href="../../CSS/crearCitas.css">
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
                String idMedico = act.BuscarMedico(id_usuario);

        %>
        <meta charset="UTF-8">
        <title>Registrar Nueva Cita</title>

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
        </header><br><br><br>


        <%        List<DispMedico> disponibilidades = new CitasCRUD().obtenerDisponibilidadesPorMedico(Integer.parseInt(idMedico));

            List<Map<String, Object>> pacientes = new CitasCRUD().obtenerPacientesPorMedico(Integer.parseInt(idMedico));

            String errorMessage = (String) request.getAttribute("errorMessage");
            String successMessage = (String) request.getAttribute("successMessage");
        %>

        <!-- Mostrar mensajes -->
        <% if (errorMessage != null) {%>
        <div class="error"><%= errorMessage%></div>
        <% } %>
        <% if (successMessage != null) {%>
        <div class="success"><%= successMessage%></div>
        <% } %>

        <form action="../../CrearCita?id_med=<%= idMedico %>" method="post">
            <h1 class="form-title">Registrar Nueva Cita</h1>

            <!-- Selección de disponibilidad -->
            <div class="form-group">
                <label for="disponibilidad">Seleccionar Disponibilidad:</label>
                <select name="idDisponibilidad" id="disponibilidad" required onchange="actualizarDiasPermitidos()">
                    <option value="" disabled selected>Seleccione una Opción</option>
                    <% for (DispMedico disp : disponibilidades) { %>
                    <option value="<%= disp.getIdDisp() %>" data-dia="<%= disp.getDia() %>">
                        <%= disp.getDia() %>, <%= disp.getHoraInicio() %> - <%= disp.getHoraFin() %> 
                        (<%= disp.getUnidadMedica() %>, <%= disp.getEstado() %>, <%= disp.getMunicipio() %>, <%= disp.getColonia() %>)
                    </option>
                    <% } %>
                </select>
            </div>

            <!-- Selección de fecha -->
            <div class="form-group">
                <label for="fecha">Seleccionar Fecha:</label>
                <input type="date" id="fecha" name="fecha" required>
                <div id="mensajeErrorFecha" class="error-message"></div>
            </div>

            <!-- Selección de paciente -->
            <div class="form-group">
                <label for="paciente">Seleccionar Paciente:</label>
                <select name="idPersona" id="paciente" required>
                    <option value="" disabled selected>Seleccione una Opción</option>
                    <% for (Map<String, Object> paciente : pacientes) { %>
                    <option value="<%= paciente.get("id_persona") %>">
                        <%= paciente.get("nombre") %> (<%= paciente.get("sem_emba") %> semanas, <%= paciente.get("sexo") %>)
                    </option>
                    <% } %>
                </select>
            </div>

            <!-- Duración de la consulta -->
            <div class="form-group">
                <label for="duracionConsulta">Duración de la Consulta (en minutos):</label>
                <input type="number" id="duracionConsulta" name="duracionConsulta" min="1" required>
            </div>

            <!-- Botón de enviar -->
            <input id="registrar" class="submi" type="submit" disabled name="accion" value="Registrar">
        </form>
    </div>
</body>
    <script>
        // Función para mapear los días en español a los índices de los días en JavaScript
        const diasMap = {
            "Lunes": 1,
            "Martes": 2,
            "Miércoles": 3,
            "Jueves": 4,
            "Viernes": 5,
            "Sábado": 6,
            "Domingo": 7
        };

        function actualizarDiasPermitidos() {
            const disponibilidadSelect = document.getElementById("disponibilidad");
            const fechaInput = document.getElementById("fecha");
            const registrarBtn = document.getElementById("registrar");
            const mensajeErrorFecha = document.getElementById("mensajeErrorFecha");

            const diaSeleccionado = disponibilidadSelect.selectedOptions[0]?.getAttribute("data-dia");
            if (!diasMap[diaSeleccionado]) {
                console.error("Día no reconocido: " + diaSeleccionado);
                return;
            }

            const diaPermitido = diasMap[diaSeleccionado];

            fechaInput.addEventListener("change", function () {
                const fechaSeleccionada = new Date(fechaInput.value);
                if (fechaSeleccionada.getDay() !== diaPermitido-1) {
                    mensajeErrorFecha.textContent = "Por favor selecciona una fecha que sea " + diaSeleccionado + ".";
                    fechaInput.value = ""; // Borra la fecha seleccionada incorrecta
                    registrarBtn.disabled = true;
                } else {
                    mensajeErrorFecha.textContent = ""; // Limpia el mensaje de error
                    registrarBtn.disabled = false;
                }
            });
        }



    </script>
    <% }%>
</html>