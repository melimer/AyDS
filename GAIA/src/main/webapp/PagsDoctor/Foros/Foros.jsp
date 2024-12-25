<%-- 
    Document   : Foros
    Created on : 7 dic. 2021, 18:56:20
    Author     : karlaviles
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.Modelo.Foro"%>
<%@page import="com.Modelo.ForosCRUD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- Asteria: Proyecto RHEA-->
 <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title> Foros </title>
    <link rel="stylesheet" href="../../CSS/FOROS.css">
 </head>
 <body>

   <header id="main-header">
 		<a id="logo-header" href="#">
 			<span class="site-name">RHEA</span>
 			<span class="site-desc">Por Asteria</span>
 		</a>
 		<nav>
 			<ul>
                            <li><a href="../PerfilMed.jsp">Usuario</a></li>
 			</ul>
 		</nav>
 	</header>
<% ForosCRUD fo=new ForosCRUD();
                    String idTema = (String) session.getAttribute("idTema");
String nombre=fo.ConsultaTema(idTema);
%>
  <section id="main-content">
  <h1> <%=nombre%> </h1>
  <div id="Panel Acciones">
      <a href="../MenuForoDoc.html">
    <button>Regresar</button>
    </a>
      <a href="CrearForo.html">
    <button>Crear Foro</button>
    </a>
      
  </div>
    <table id="tabla1">
      <tr>
          <td> Nombre del Foro </td>
          <td> Iniciado por: </td>
          <td> Réplicas </td>
      </tr>
      <%

    
                    
                    List<Foro> lista = fo.ConsultaForosComple(idTema);

                    Iterator<Foro> iter = lista.iterator();
                    
                    Foro f=null;
                    while (iter.hasNext()) {
                    f=iter.next();
                    
              
                    String idMsg=f.getId_msg();
                    List<Foro> contada = fo.ContarReplicas(idMsg);
                    Iterator<Foro> iterator = contada.iterator();
                    Foro replicNo=null;
                    while (iterator.hasNext()) {
                    replicNo=iterator.next();
                    int noRepli=replicNo.getNoReplicas();

    %>
      <tr>
          
          <td><a class="link-tabla" href="../../DirecForo2?accion=ver&idForo=<%=f.getIdForo()%>"><%=f.getNombreForo()%></a> </td>
          <td><%=f.getPersonaInici()%>  </td>
          <td><center><%=noRepli%></center></td>
      </tr>
      <%}}%>
    </table>
  
 </section>
  
 </body>
</html>
