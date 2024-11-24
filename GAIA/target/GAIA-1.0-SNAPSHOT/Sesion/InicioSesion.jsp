
<%@page import="com.Modelo.ActsUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession" %>
<%boolean notLoggedIn = true;
    try {
        HttpSession objSesion = request.getSession();
        String logged = objSesion.getAttribute("loggedIn").toString();
        if ("true".equals(logged)) {
            String nombre = objSesion.getAttribute("loggedUser").toString();
            ActsUser act = new ActsUser();
            if(act.BuscarSesion(nombre) != null && !act.BuscarSesion(nombre).equals("1")){
            String id = act.BuscarSesion(nombre);
            if (act.BuscarPadreusuario(id) != null) {
                response.sendRedirect("../PagsPadre/InicioPadre.jsp");
            } else if (act.BuscarDRUsuario(id) != null) {
                response.sendRedirect("../PagsDoctor/InicioMed.jsp");
            }
            notLoggedIn = false;
            }else if(act.BuscarSesion(nombre).equals("1")){
                response.sendRedirect("../Admin.jsp");
            }
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
        <title> Iniciar Sesión </title>
        <link rel="stylesheet" href="../CSS/InicioSesion.css">
</head>

<body>
    <form action="../InicioSesion" method="post">
        <div id="login-box">
            <h1>Iniciar Sesión</h1>
            <HR>
            <BR>
            <div class="form">
                <div class="item">
                    <i class="fa fa-user-circle" aria-hidden="true"></i>
                    <input type="text" placeholder="Correo electrónico o nombre de usuario" name="username" required style="color: black">
                </div>
                <BR>
                <div class="item">
                    <i class="fa fa-key" aria-hidden="true"></i>
                    <input type="password" placeholder="Contraseña" name="password" required style="color: black"
                </div>
            </div>
            <button type="submit">Entrar</button>
        </div>
    </form>
</body>
</html>
<% }%>