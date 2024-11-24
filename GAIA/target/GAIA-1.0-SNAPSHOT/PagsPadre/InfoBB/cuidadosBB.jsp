
<%@page import="com.Modelo.ActsUser"%>
<%@page import="com.Modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession" %>
<%boolean LoggedIn;
    try {
        HttpSession objSesion = request.getSession();
        String logged = objSesion.getAttribute("loggedIn").toString();
        if ("false".equals(logged)) {
            response.sendRedirect("index.jsp");
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
	<title>Cuidados Bebé</title>
  <link rel="stylesheet" href="../../CSS/Nutricion.css">
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
				<h1>Cuidados</h1>
			</header>

			<div id="menu">
				<ul>
					<li><a class="links" href="#Intro">Introducción</a></li>
					<li><a class="links" href="#AF">Un Buen Comienzo</a></li>
					<li><a class="links" href="#AR">Disciplina</a></li>
				</ul>
			</div>
      <br>
			<div class="content">
				<br>
				<div align="center"><img src="../../IMG/InicioSesion.png" /></div>
				<br>
			<h2 id="Intro"> Introducción </h2>
				<p> Lo que sucede durante los primeros años es de crucial importancia en el desarrollo de todo niño y
					niña. Es un período de grandes oportunidades, pero también de vulnerabilidad frente a influencias
					negativas. </p>
				<p> Toma en cuanta que un niño es como una esponja que absorbe todo a su alrededor, es una pequeña
				masa que se moldea de acuerdo a su entorno, por lo que debes de considerar el espacio donde se
				desarrolla.</p>
				<br>
				<br>

		<h2 id="AF"> Un buen Comienzo </h2>
        <p> Una buena nutrición y salud, una atención afectuosa constante, estímulos para aprender y crecer en
					un ambiente de crianza seguro, sensible y receptivo a las necesidades del niño o niña durante los
					primeros años de vida, contribuyen a que la niñez se desarrolle de manera óptima y se prepare para
					la escuela, aprenda mejor, sea más saludable, tenga mejores ingresos a futuro y participe plenamente
					en la sociedad. </p>
					<br>
				<p> Un buen fundamento en los primeros años hace la diferencia para el aprendizaje posterior en la etapa
					adulta e incluso ofrece un mejor comienzo para la siguiente generación. </p>
				<p> Las personas educadas y sanas participan y contribuyen a la prosperidad económica y social de sus
					sociedades. </p>
				<br>
				<div align="center"><img src="../../IMG/Disciplina.png" /></div>
				<br>

		 <h2 id="AR"> Disciplina </h2>
			<h3> Violencia Familiar </h3>
			 <p>  En el Estudio sobre la violencia contra los niños del Secretario General de las Naciones Unidas,
				 puso en evidencia que niñas y niños pequeños sufren la peor parte de la violencia familiar. El estudio
				 definió la importancia de una mejor atención y cuidado a niñas y niños pequeños para lograr la
				 disminución general de la violencia.  </p>
				 <br>
			 <p> El castigo corporal a los niños es una práctica legalmente sancionada y lamentablemente culturalmente
           aceptada en la gran mayoría de los países. </p>
					<br>

			<h3> Disciplina Sana </h3>
				<p> Es necesario encontrar el equilibrio exacto que nos permita establecer límites y lograr que los niños
					 respeten, sin tener que llegar a extremos donde haya culpabilidad y sin dañar la relación con ellos. </p>
				<br>
				<h4> Bebés </h4>
				<ul>
					<li> Los bebés aprenden lo que ven, por lo que el ejemplo es clave. Manten un tono de voz suave,
						evita perder el control de las situaciones y procura ser un permanente modelo positivo. </li>
					<li> Cuando este a punto de hacer un berrinche o alguna practiva peligrosa desvia su atención
					hacia algún objeto o situación. </li>
					<li> Trata de reservar el 'no' para situaciones muy peligrosas o indeseadas. </li>
					<li> Trata de estimular de manera positiva las acciones que realiza. </li>
				</ul>
				<h4> 1 a 3 años </h4>
				<ul>
					<li> Los niños empiezan a probar lo que está permitido y lo que no.</li>
					<li> Mantente firme en comportamientos no deseados, evita a toda costa sucumbir a sus rabietas. </li>
					<li> Trata de prevenir situaciones que desencadenen una rabieta. </li>
					<li> Ignorar comportamientos no permitidos suele ayudar a que ya no se realicen más. </li>
				</ul>
				<h4> 3 a 5 años </h4>
				<ul>
					<li> El sentido de pertenecia es importante en esta etapa, procura darle más responsabilidades,
						esto ayudará a sentirse necesario. </li>
					<li> En situaciones apropiadas, deja que elija entre varias opciones. </li>
					<li> El cuestionamiento de acciones es algo común en esta edad y será algo rutinario, evita
						esquivar esto en temas apropiados y da explicaciones concisas</li>
					<li> Ahórra repetir una y otra vez las mismas frases, cámbialas por 'ya te lo he explicado y no
						lo vamos a discutir más'. Esto ayudará a que entienda que hay cosas discutibles y otras que no.</li>
					<li> Los cuentos y películas pueden ser herramientas para moldear el buen comportamiento. </li>
				</ul>

				<table id="tabla1">
					<tr>
						<th> Consejos y Recomendaciones: </th>
					</tr>
					<tr>
						<td>
							<p> Las responsabilidades que le asignes tiene que ser proporcionales a su madurez. </p>
							<p> Cuando quiera algo, define una meta para que lo consiga. </p>
							<p> Dejalo ser independiente poco a poco. </p>
							<p> Ensañale a dialogar sus problemas y resolverlos con calma. </p>
						</td>
					</tr>
				</table>

			</div>
		</article> <!-- /article -->
	</section> <!-- / #main-content -->

</body>
</html>
<% } %>