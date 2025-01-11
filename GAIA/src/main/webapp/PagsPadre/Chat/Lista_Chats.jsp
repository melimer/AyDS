<%@page import="com.Modelo.Medico"%>
<%@page import="com.Modelo.Mensaje"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.Modelo.Pamed"%>
<%@page import="com.Modelo.ActsUser"%>
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
        String id_usuario = act.BuscarSesion(user);
        String id_persona = act.BuscarPadreusuario(id_usuario);
        Pamed pamed = new Pamed();
        ArrayList<Pamed> lista = pamed.getMedicos(id_persona);
        Mensaje msg = new Mensaje();
        %>

<!DOCTYPE html>
<html>
<!-- Asteria: Proyecto GAIA-->
 <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title> Lista Chats </title>
    <link rel="stylesheet" href="../..//CSS/Lista_Chats.css">
    </style>
 </head>
 <body>
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
 <main>
     
     <h2>Lista de mensajes con medicos</h2>
     <section>
         <%
            for (Pamed pa : lista) {
                String datos_usuario[];
                String id_medico = pa.getId_medico();
                String id = act.BuscarUsuarioMedico(id_medico);
                datos_usuario = act.BuscarPorId(id);
                Medico medico = act.BuscarDR(id_medico);
                String especialidad = medico.getEspecialidad();
                Mensaje mensaje = msg.obtenerUltimoMensaje(id_persona, id_medico);
         %>
            <article>
                <%
                    if(mensaje != null && !mensaje.getLeido() && mensaje.getTipo_emisor() == msg.MEDICO){
                %>
                    <img src="../../IMG/msg_nuevo.png" alt="alt"/>
                <%}%>
                <a href='Chat.jsp?id=<%=id_medico%>'>
                <div>
                    <h3><%=especialidad%>: <%=datos_usuario[0]%></h3>
                </div>
                <div>
                    <p><%=(mensaje != null)? mensaje.getFecha()+" ": ""%> <%=(mensaje != null)? mensaje.getHora(): ""%></p>
                </div>
                <div>
                    <%
                        if(mensaje != null){
                            int tipo_emisor = mensaje.getTipo_emisor();
                            String nombre_emisor;
                            if(tipo_emisor == msg.MEDICO){
                                nombre_emisor = datos_usuario[0];
                            } else{
                                nombre_emisor = "Yo";
                            }
                    %>
                        <p><%=nombre_emisor%>: <%=mensaje.getCont()%></p>
                    <%
                        }else{
                    %>
                        <p>Sin conversación.</p>
                    <%}%>
                </div>
                </a>
            </article>
         <%}%>
     </section>
     
 </main>

 </body>
</html>
<% }; %>