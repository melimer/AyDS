
<%@page import="com.Modelo.ActsUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession" %>

<%boolean notLoggedIn;
    try {
        HttpSession objSesion = request.getSession();
        String logged = objSesion.getAttribute("loggedIn").toString();
        if ("true".equals(logged)) {
            String nombre = objSesion.getAttribute("loggedUser").toString();
            ActsUser act = new ActsUser();
            String id = act.BuscarSesion(nombre);
            if (act.BuscarPadre(id) != null) {
                response.sendRedirect("../PagsPadre/InicioPadre.jsp");
            } else if (act.BuscarDR(id) != null) {
                response.sendRedirect("../PagsDoctor/InicioMed.jsp");
            }
            notLoggedIn = false;
        } else {
            notLoggedIn = true;
        }
    } catch (Exception e) {
        notLoggedIn = true;
    }
    if (notLoggedIn) {

%>
<!DOCTYPE html>
<html>
    <!-- Asteria: Proyecto GAIA-->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title> Registro para Médico </title>
        <link rel="stylesheet" href="../CSS/Rmed.css">
    </style>
</head>

<body>

    <form action= "../RegistroMedico" method="post">
        <H6> MEDICO </H6>
        <label for="nombre">Nombre</label>
        <input type="text" name="nombre" id="nombre" placeholder="Escriba su nombre"
               required pattern="[A-Za-z0-9].{3,40}"/></p>
    <label for="apodo">Nombre de Usuario</label>
    <input type="text" name="apodo" id="apodo" placeholder="Nombre de usuario" required
           pattern="[A-Za-z0-9]{3,40}"/></p>
<label for="mail">Correo electrónico</label>
<input type="email" id="mail" name="user_mail" placeholder="Ingrese su correo"
       required/>
<label for="pass">Contraseña</label>
<input type="password" name="pass" id="pass" minlength="6" maxlength="40" placeholder="Ingrese Contraseña"
       required pattern="[A-Za-z0-9]{3,40}"/></p>

<HR>

<label for="cedula">Cedula</label>
<input type="number" name="cedula" id="cedula" placeholder="Ingrese la cedula" maxlength="8" minlength="6"
       required/></p>
<label for="especial">Especialidad</label>
<select name="especialidad" id="espe" required/>
<option value="Ginecologia">Ginecología</option>
<option value="Obstetricia">Obstetricia</option>
<option value="OB/GYN">OB/GYN</option>
</select></p>

<HR>

<input type="submit" name="guardar" value="Registrarse"/>
</form>
</body>
</html>
<% }%>