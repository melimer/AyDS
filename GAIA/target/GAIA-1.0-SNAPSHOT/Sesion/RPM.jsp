

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
        <title> Registro para persona embarazada </title>
        <link rel="stylesheet" href="../CSS/RPM.css">
</head>
<body>
    <h5> Persona embarazada </h5>
    <form action= "../RegistroEmba" method="post">

        <BR>
        <label for="nombre">Nombre</label>
        <input type="text" name="nombre" id="nombre" placeholder="Escriba su nombre"
               maxlength="40" minlength="3" required/>
    <label for="nombre">Nombre de usuario</label>
    <input type="text" name="apodo" id="apodo" placeholder="Nombre de usuario"
           maxlength="40" minlength="3" required/>
<label for="mail">Correo electrónico</label>
<input type="email" id="user_mail" name="user_mail" placeholder="Ingrese su correo"
       maxlength="320" required/>
<label for="pass">Contraseña</label>
<input type="password" name="pass" id="pass" minlength="6" maxlength="40" placeholder="Ingrese Contraseña"
       maxlength="30" required/>
<br>
<hr>
<br>

<label for="pregunta">Sexo del bebé</label><br>
<input type="radio" id="masc" name="sexo" value="Masculino" onClick="" >
            <label for="masculino">Masculino</label><br> </br>

<input type="radio" id="fem" name="sexo" value="Femenino" >
            <label for="femenino">Femenino</label> </br> </br>

<input type="radio" id="fem" name="sexo" value="Femenino" >
            <label for="desconocido">No compartir</label> </br> </br>

<label for="semana"> Semanas de embarazo</label>
<input type="number" name="semanas" id="semanas" min="1" max="50" required="">
<HR>

<input type="submit" name="registrarse" value="Registrarse"/>
<br>
    </form>
</body>
</html>
<% } %>