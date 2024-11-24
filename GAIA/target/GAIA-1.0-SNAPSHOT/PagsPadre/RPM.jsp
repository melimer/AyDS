
<%@page import="com.Modelo.PEmbarazo"%>
<%@page import="com.Modelo.Usuario"%>
<%@page import="com.Modelo.ActsUser"%>
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
             String nombre = objSesion.getAttribute("loggedUser").toString();
            ActsUser act = new ActsUser();
        Usuario usr = act.Usuario(nombre);
        String nomb = usr.getNombre();
        String correo = usr.getCorreo();
        String apodo = usr.getApodo();
        String fecha = act.fecha(nombre);
        String id_usuario = act.BuscarSesion(nombre);
        String id_padre = act.BuscarPadre2(id_usuario);
        PEmbarazo padre = act.BuscarPadre(id_padre);
        String semanas = padre.getSemanas();
          
%>
<!DOCTYPE html>
    <!-- Asteria: Proyecto GAIA-->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title> Registro para persona embarazada </title>
        <link rel="stylesheet" href="../CSS/RPM.css">
</head>
<body>
    <h5> Persona embarazada </h5>
    <form action= "../ActualizarUsr" method="post">

        <BR>
        <label for="nombre">Nombre</label>
        <input type="text" name="nombre" id="nombre" placeholder="Escriba su nombre"
               maxlength="40" minlength="3" value="<% out.println(nomb); %>" required/>
    <label for="nombre">Nombre de usuario</label>
    <input type="text" name="apodo" id="apodo" placeholder="Nombre de usuario"
           maxlength="40" minlength="3" value="<% out.println(apodo); %>"  required/>
<label for="mail">Correo electrónico</label>
<input type="email" id="user_mail" name="user_mail" placeholder="Ingrese su correo" value="<% out.println(correo); %>" 
       maxlength="320" required/>
<br>
<HR>

<input type="submit" name="registrarse" value="Actualizar"/>
<input type="button" name="cancelar" value="Cancelar" onClick="window.location.assign('MiPerfil.jsp');">
<br>
    </form>
</body>
</html>
<%  }
    } catch (Exception e) {
        LoggedIn = true;
    }
        
%>