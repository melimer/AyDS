<!DOCTYPE html>

<% 
    String id_per = request.getParameter("id");
%>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
<!-- Asteria: Proyecto GAIA-->
 <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title> Registros </title>
    <link rel="stylesheet" href="../../CSS/1Inicio.css">
 </head>
 <body>
   <header id="main-header">
 		<a id="logo-header" href="#">
 			<span class="site-name">GAIA</span>
 			<span class="site-desc">Por Asteria</span>
 		</a>
 		<nav>
 			<ul>
                    <li><a href="../Lista/Pacientes.jsp">Pacientes</a></li>
                    <li><a href="../InicioMed.jsp">Inicio</a></li>
 			</ul>
 		</nav>
 	</header>

   <h1> Registros: </h1>
   <DIV id="contenedor">
   <div id="D1">
     <h3>Estudios médicos</h3>
     <a href="">
        <img id="img" src="../../IMG/1Inicio2.png" alt="I2" />
     </a>
     
   </div>
   <div id="D2">
     <h3>Sintomas</h3>
     <a href="Registros/Sintomas.jsp?id=<% out.print(id_per);%>">
        <img id="img" src="../../IMG/1Inicio1.png" alt="I1" />
     </a>
   </div>
   <div id="D3">
     <h3>Cambios en el embarazo</h3>
     <a href="Registros/Camb_emba.jsp?id=<% out.print(id_per);%>">
        <img id="img" src="../../IMG/embarazo1.png" alt="I3" />
     </a>
   </div>
   </DIV>
 </body>
</html>
