
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.Modelo.Foro"%>
<%@page import="com.Modelo.ForosCRUD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <!-- Asteria: Proyecto GAIA-->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title> Foro </title>
        <link rel="stylesheet" href="../../CSS/ForoVer.css">
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
                </ul>
            </nav>
        </header>

        <section id="main-content">
            <%
                String idTema = (String) session.getAttribute("idTema");
                
                String idForo = (String) session.getAttribute("idForo");
                ForosCRUD fo = new ForosCRUD();
                List<Foro> lista = fo.ConsultaForoMsg(idForo);
                String nombre = fo.ConsultaTema(idTema);
                Iterator<Foro> iter = lista.iterator();

                Foro f = null;
                while (iter.hasNext()) {
                    f = iter.next();


            %>
            <div id="tema"><h1> Tema: <%=nombre%> </h1></div>
            <h2> Nombre del Foro: <%=f.getNombreForo()%>  </h2>
            <center><div id="PanelAcciones">
                    <a href="Foros.jsp">
                        <button>Regresar</button>
                    </a>
                </div></center>
            <center><div id="mensajePrin">

                    <div id="arriba">
                        <div id="user">
                            <h3><%=f.getPersonaInici()%></h3>
                        </div>
                        <div id="fecha">
                            <h4><%=f.getFecha()%></h4>
                        </div>
                    </div>
                    <div id="Texto1">
                        <p><%=f.getMsgPrincip()%><p>
                        <div id="res_div">
                            <a  href="../../DirecForo2?accion=responder&idMens=<%=f.getId_msg()%>"> <button id="botonR">Añadir una respuesta</button></a>
                        </div>
                    </div>
                    <%}%>
                </div>
                <div id="fiel">    
                    <fieldset>

                        <legend> Respuestas </legend>
                        <div id="resp">
                        <%
                            String idMsg=fo.ConsultaIdMsg(idForo);
                          List<Foro> listita = fo.ConsultaReplica(idMsg);
                            Iterator<Foro> iterator = listita.iterator();
System.out.println(idMsg);
                            Foro fori = null;
                           while (iterator.hasNext()) {
                                fori = iterator.next();
                                System.out.println(fori.getPersonRep());
                        %>
                        <div class="respuestas">


                            <div class="arriba">
                                <div id="userRep">
                                    <h3><%=fori.getPersonRep()%></h3>
                                </div>
                                <div id="fecha">
                                    <h4><%=fori.getFechaRep()%></h4>
                                </div>
                            </div>
                            <div class="Texto1">
                                <p><%=fori.getReplica()%><p>

                            </div>
                            

                        </div>
                                <%}%>
                                <br>
                        </div>
                    </fieldset>
                </div>     
            </center>
        </section>

    </body>
</html>
