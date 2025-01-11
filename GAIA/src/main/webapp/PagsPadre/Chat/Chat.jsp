<%@page import="com.Modelo.Medico"%>
<%@page import="com.Modelo.Mensaje"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.Modelo.Pamed"%>
<%@page import="com.Modelo.ActsUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%boolean LoggedIn;
    String id_medico = null;
    try {
        HttpSession objSesion = request.getSession();
        String logged = objSesion.getAttribute("loggedIn").toString();
        if ("false".equals(logged)) {
            response.sendRedirect("../index.html");
            LoggedIn = true; 
        } else {
            LoggedIn = true;
        }
        id_medico = request.getParameter("id");
    } catch (Exception e) {
        e.printStackTrace();
        LoggedIn = false;
    }
    if (LoggedIn && id_medico!=null) {
        HttpSession objSesion = request.getSession();
        String user = objSesion.getAttribute("loggedUser").toString();
        ActsUser act = new ActsUser();
        String id_usuario_persona = act.BuscarSesion(user);
        String id_persona = act.BuscarPadreusuario(id_usuario_persona);
        
        Pamed pm = new Pamed();
        if(!pm.sonRegistro(id_persona, id_medico)){
            response.sendRedirect("Lista_Chats.jsp");
            return;
        }
        String id_usuario_medico = act.BuscarUsuarioMedico(id_medico);
        
        System.out.println(id_usuario_medico);
        String nombre_medico = act.BuscarPorId(id_usuario_medico)[0];
        String nombre_persona = act.BuscarPorId(id_usuario_persona)[0];
        
        Medico medico = act.BuscarDR(id_medico);
        String especialidad = medico.getEspecialidad();
        Mensaje msg = new Mensaje();
        %>

<!DOCTYPE html>
<html>
<!-- Asteria: Proyecto GAIA-->
 <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title> Chat - <%=nombre_medico%> </title>
    <link rel="stylesheet" href="../..//CSS/Chat.css">
    <script src="../../JS/Mensaje.js"></script>
 </head>
 <body>
     <data data_e="<%=id_persona%>" data_r="<%=id_medico%>" data_te="<%=0%>"></data>
   <header id="main-header">
 		<a id="logo-header" href="#">
 			<span class="site-name">GAIA</span>
 			<span class="site-desc">Por Asteria</span>
 		</a>
 		<nav>
 			<ul>
                            <li class="chat-icon"><a href="Lista_Chats.jsp"><img src="../../IMG/chat-icon.png" alt="alt"/></img></a></li>
 				<li><a href="../InicioPadre.jsp">Inicio</a></li>
 			</ul>
 		</nav>
 	</header>
 <main id="main">
     
     <h2><%=especialidad%>: <%=nombre_medico%></h2>
     <section>
         <main class="main">
             <%
                ArrayList<Mensaje> mensajes = msg.obtenerMensajes(id_persona, id_medico);
                for(Mensaje mensaje:mensajes){
             %>
             <article class="<%=(mensaje.getId_emisor().equals(id_persona))?"":"recibido"%>">
                 <div><%=mensaje.getFecha()%> <%=mensaje.getHora()%></div>
                 <div><%=mensaje.getCont()%></div>
             </article>
             <%
                 }
             %>
         </main>
         <footer>
             <textarea id="mensaje" name="name" rows="1" cols="10" placeholder="Escribe un mensaje"></textarea>
             <img id="enviar" src="../../IMG/enviar_msg.png" alt="Icono enviar mensaje"/>
         </footer>
     </section>
     
 </main>

 </body>
</html>
<% 
    
    msg.colocarMensajesLeidos(id_persona,id_medico,id_persona);
    
    }; %>