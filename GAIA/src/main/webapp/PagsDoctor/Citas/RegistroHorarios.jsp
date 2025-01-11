<%-- 
    Document   : RegistroHorarios
    Created on : 4 ene. 2025, 11:33:16
    Author     : karlaviles
--%>

<%@page import="com.Modelo.ActsUser"%>
<%@page import="com.Modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        String id_Medico = act.BuscarMedico(id_usuario);

%>
<!DOCTYPE html>
<head>
    <html>
    <link rel="stylesheet" type="text/css" href="../../CSS/horarios.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Días y Horarios de Servicio</title>
    
    <script>
        const schedule = [];
        function addSchedule() {
            const day = document.getElementById('day').value;
            const startTime = document.getElementById('startTime').value;
            const endTime = document.getElementById('endTime').value;
            const estado = document.getElementById('estado').value;
            const municipio = document.getElementById('municipio').value;
            const colonia = document.getElementById('colonia').value;
            const calle = document.getElementById('calle').value;
            const numeroExt = document.getElementById('numero_ext').value;
            const numeroInt = document.getElementById('numero_int').value.trim();
            const unidadMedica = document.getElementById('unidad_medica').value;

            const errorMessage = document.getElementById('errorMessage');
            errorMessage.textContent = ''; // Reset error message

            // **Validación básica**
            if (!day || !startTime || !endTime || !estado || !municipio || !colonia || !calle || !numeroExt || !unidadMedica) {
                errorMessage.textContent = 'Todos los campos son obligatorios, excepto el número interior.';
                return;
            }

            if (startTime >= endTime) {
                errorMessage.textContent = 'La hora de inicio debe ser menor a la hora de fin.';
                return;
            }

            // **Construir la dirección**
            var direccion = calle + " " + numeroExt;
            if (numeroInt) {
                direccion += ", Int. " + numeroInt;
            }
            direccion += ", " + colonia + ", " + municipio + ", " + estado + ", " + unidadMedica;

            // **Validación de traslape**
            for (var i = 0; i < schedule.length; i++) {
                var entry = schedule[i];
                if (entry.day === day) {
                    if (
                            (startTime >= entry.startTime && startTime < entry.endTime) ||
                            (endTime > entry.startTime && endTime <= entry.endTime) ||
                            (startTime <= entry.startTime && endTime >= entry.endTime)
                            ) {
                        errorMessage.textContent = "El horario ingresado se traslapa con otro servicio en el día " + day + ".";
                        return;
                    }
                }
            }

            // **Agregar horario al arreglo**
            schedule.push({day: day, startTime: startTime, endTime: endTime, location: direccion});

            // **Actualizar tabla**
            var tableBody = document.getElementById('scheduleTable').querySelector('tbody');
            var row = document.createElement('tr');
            row.innerHTML = "<td>" + day + "</td><td>" + startTime + "</td><td>" + endTime + "</td><td>" + direccion + "</td>";
            tableBody.appendChild(row);

            // **Agregar campos ocultos**
            var hiddenInputsContainer = document.getElementById('hiddenInputsContainer');
            hiddenInputsContainer.innerHTML +=
                    "<input type='hidden' name='schedules[" + (tableBody.rows.length - 1) + "][day]' value='" + day + "'>" +
                    "<input type='hidden' name='schedules[" + (tableBody.rows.length - 1) + "][startTime]' value='" + startTime + "'>" +
                    "<input type='hidden' name='schedules[" + (tableBody.rows.length - 1) + "][endTime]' value='" + endTime + "'>" +
                    "<input type='hidden' name='schedules[" + (tableBody.rows.length - 1) + "][estado]' value='" + estado + "'>" +
                    "<input type='hidden' name='schedules[" + (tableBody.rows.length - 1) + "][municipio]' value='" + municipio + "'>"+
                    "<input type='hidden' name='schedules[" + (tableBody.rows.length - 1) + "][col]' value='" + colonia + "'>"+
                    "<input type='hidden' name='schedules[" + (tableBody.rows.length - 1) + "][calle]' value='" + calle + "'>"+
                    "<input type='hidden' name='schedules[" + (tableBody.rows.length - 1) + "][numExt]' value='" + numeroExt + "'>"+
                    "<input type='hidden' name='schedules[" + (tableBody.rows.length - 1) + "][numInt]' value='" + numeroInt + "'>"+
                    "<input type='hidden' name='schedules[" + (tableBody.rows.length - 1) + "][uniMed]' value='" + unidadMedica + "'>";

            // **Mantener o limpiar lugar de trabajo**
            var keepLocation = document.getElementById('keepLocation').checked;
            if (!keepLocation) {
                document.getElementById('estado').value = '';
                document.getElementById('municipio').value = '';
                document.getElementById('colonia').value = '';
                document.getElementById('calle').value = '';
                document.getElementById('numero_ext').value = '';
                document.getElementById('numero_int').value = '';
                document.getElementById('unidad_medica').value = '';
            }

            // **Limpiar los campos generales**
            document.getElementById('day').value = '';
            document.getElementById('startTime').value = '';
            document.getElementById('endTime').value = '';

            document.getElementById('finalizeButton').disabled = false;
        }
    </script>
</head>

<body>
    <div class="container">
        <h2>Registro de Días y Horarios de Servicio</h2>
        <form id="scheduleForm">
            <div class="form-group">
                <label for="day">Día:</label>
                <select id="day" required>
                    <option value="" disabled selected>Seleccione un día</option>
                    <option value="Lunes">Lunes</option>
                    <option value="Martes">Martes</option>
                    <option value="Miércoles">Miércoles</option>
                    <option value="Jueves">Jueves</option>
                    <option value="Viernes">Viernes</option>
                    <option value="Sábado">Sábado</option>
                    <option value="Domingo">Domingo</option>
                </select>
            </div>
            <div class="form-group">
                <label for="startTime">Hora de inicio:</label>
                <input type="time" id="startTime" required>
            </div>
            <div class="form-group">
                <label for="endTime">Hora de fin:</label>
                <input type="time" id="endTime" required>
            </div>
            <fieldset>
                <legend>Detalles del lugar de trabajo</legend>
                <div class="form-group"><label>Estado:</label><input id="estado" type="text" required></div>
                <div class="form-group"><label>Municipio:</label><input id="municipio" type="text" required></div>
                <div class="form-group"><label>Colonia:</label><input id="colonia" type="text" required></div>
                <div class="form-group"><label>Calle:</label><input id="calle" type="text" required></div>
                <div class="form-group"><label>Número exterior:</label><input id="numero_ext" type="number" required></div>
                <div class="form-group"><label>Número interior:(Opcional)</label><input id="numero_int" type="number"></div>
                <div class="form-group"><label>Unidad médica:</label><input id="unidad_medica" type="text" required></div>
            </fieldset>
            <div class="form-group">
                <input type="checkbox" id="keepLocation" name="keepLocation">
                <label for="keepLocation">Mantener lugar de trabajo</label>
            </div>

            <button type="button" onclick="addSchedule()">Registrar Horario</button>
        </form>

        <p class="error" id="errorMessage"></p>
        <form id="formu" action="../../Citas?id_med=<%=id_Medico%>" method="post" >
            <table class="schedule-table" id="scheduleTable">
                <thead>
                    <tr>
                        <th>Día</th>
                        <th>Hora de inicio</th>
                        <th>Hora de fin</th>
                        <th>Lugar</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Horarios se agregarán dinámicamente -->
                </tbody>
            </table>
            <div id="hiddenInputsContainer"></div>
            <!--<button id="finalizeButton" name="accion" onclick="finalize()" disabled>Finalizar</button>-->
            <input id="finalizeButton" class="submi" type="submit" disabled  name="accion" value="Finalizar"/>
        </form>
    </div>

<%}%>

</body>
</html>