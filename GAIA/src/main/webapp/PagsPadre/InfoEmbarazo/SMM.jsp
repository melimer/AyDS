
<%@page import="com.Modelo.ActsUser"%>
<%@page import="com.Modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession" %>
<%boolean LoggedIn;
    try {
        HttpSession objSesion = request.getSession();
        String logged = objSesion.getAttribute("loggedIn").toString();
        if ("false".equals(logged)) {
            response.sendRedirect("index.html");
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
        Usuario usr = act.Usuario(user);
        String nombre = usr.getNombre();
%>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Salud Mental</title>
  <link rel="stylesheet" href="../../CSS/SMM.css">
</head>

<body>

	<header id="main-header">
		<a id="logo-header" href="#">
			<span class="site-name">GAIA</span>
			<span class="site-desc">Por Asteria</span>
		</a>
		<nav>
			<ul>
				<li><a href="../InicioPadre.jsp">Inicio</a></li>
				<li><a href="../MenuEbz.html">Embarazo</a></li>
				<li><a href="../MenuBB.html">Bebé</a></li>
				<li><a href="../MiPerfil.jsp">Usuario</a></li>
			</ul>
		</nav>
	</header>

	<section id="main-content">

	<article>
			<header>
				<h1>Salud Mental</h1>
			</header>

      <br>
			<img src="../../IMG/SMM.png" alt="SMM" />

			<div class="content">
				<br>
			<h2 id="Intro"> Salud Mental </h2>
				<p> La salud mental suele ser subestimada en diferentes ámbitos de la vida, el embarazo es uno de
					ellos, sin embargo es importante tener en cuenta el estado de la madre en este periodo. En estos
					últimos anos se presta especial atención al estado mental de la madre, esto debido a que la mujer
					es mas propensa a sufrir ciertos trastornos con mayor frecuencia que los hombres, como la depresión
					y la ansiedad.</p>
					<br>
				<p> Las razones por las que se pueden alentar al desarrollo de ansiedad son las dudas que generalmente
					se tiene en este periodo, las mas comunes son: </p>
					<ul>
						<li> los cambios sobre convertirse en madre </li>
						<li> los cambios en las relaciones con las personas </li>
						<li> el temor que pudiera haber problemas con el embarazo o con el bebé </li>
						<li> el temor de dar a luz y los peligros que conllevan  </li>
						<li> la falta de apoyo o el miedo a encontrarse sola </li>
					</ul>
				<br>
        <p> Las madres con alguna medicación debido a una enfermedad mental padecen el riesgo de recaer en caso
					de interrumpir su medicación, por eso en estos casos se tiene que consultar con el medico sobre la
					condición de la madre ya que es importante obtener la opinión de un especialista. El tratamiento que
					se le indique dependerá enteramente de el tipo de enfermedad mental y su tratamiento previo. </p>
				<p> </p>
				<br>
					<body>
					<table id="tabla1">
					  <tr>
					    <th>País</th>
					    <th>Linea de ayuda</th>
					  </tr>
					  <tr>
					    <td> México </td>
					    <td>
								<ul>
									<li>Línea de Seguridad 55 5533 5533</li>
									<li>Chat de confianza por whatsapp 55 5533 5533</li>
								</ul>
							</td>
					  </tr>

					  <tr>
					    <td>  </td>
					    <td>  </td>
					  </tr>
					<!--   <tr>
					    <td>  </td>
					    <td>  </td>
					  </tr> -->
					</table>
			</div>
		</article> <!-- /article -->
	</section> <!-- / #main-content -->

</body>
</html>
<% } %>