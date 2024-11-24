

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
        }else{
            String nombre = objSesion.getAttribute("loggedUser").toString();
            ActsUser act = new ActsUser();
            String id = act.BuscarSesion(nombre);
            Usuario usr = act.Usuario(nombre);
            String nomb = usr.getNombre();
            String correo = usr.getCorreo();
            String apodo = usr.getApodo();

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

    <form action= "../ActualizarUsrMed" method="post">
        <H6> MEDICO </H6>
        <label for="nombre">Nombre</label>
        <input type="text" name="nombre" id="nombre" placeholder="Escriba su nombre"
               required pattern="[A-Za-z0-9].{3,40}" value="<%out.println(nomb); %>"/></p>
    <label for="apodo">Nombre de Usuario</label>
    <input type="text" name="apodo" id="apodo" placeholder="Nombre de usuario" required
           pattern="[A-Za-z0-9]{3,40}" value="<%out.println(apodo); %>"/></p>
<label for="mail">Correo electrónico</label>
<input type="email" id="mail" name="user_mail" placeholder="Ingrese su correo" value="<%out.println(correo); %>"
       required/></p>

<HR>

<input type="submit" name="guardar" value="Actualizar"/>
<input type="button" name="cancelar" value="Cancelar" onClick="window.location.assign('PerfilMed.jsp');">
</form>
</body>
</html>
<% }
    } catch (Exception e) {
        LoggedIn = true;
    }%>