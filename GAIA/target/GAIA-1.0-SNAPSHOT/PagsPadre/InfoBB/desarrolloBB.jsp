

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
	<title>Desarrollo Bebé</title>
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
				<h1>Desarrollo</h1>
			</header>

			<div id="menu">
				<ul>
					<li><a class="links" href="#Intro">Desarrollo cognoscitivo</a></li>
					<li><a class="links" href="#AF">Inicio</a></li>
					<li><a class="links" href="#AR">Resumen</a></li>
				</ul>
			</div>
      <br>
			<div align="center"><img src="../../IMG/1Inicio2.png" /></div>

			<div class="content">
				<br>
			<h2 id="Intro"> Desarrollo cognoscitivo </h2>
				<p> La inteligencia como la capacidad de adaptación al medio que nos rodea. Esta adaptación
					consiste en un equilibrio entre dos mecanismos indisociables: la acomodación y la asimilación. </p>
					<br>
				<p> El desarrollo cognoscitivo comienza cuando el niño inicia a realizar un equilibrio interno
					entre la acomodación y el medio que lo rodea y la asimilación de esta misma realidad a sus
					estructuras. </p>
        <p> Este desarrollo prosigue un orden	determinado, que incluye cuatro etapas, senso-motor (0-3 años),
					precncreto o preoperatorio (3-7 años), concreto (7-13 años) y formal (13-19 años). Cada uno de estos
					periodos o etapas está constituido por estructuras originales, las cuales se irán reforzando a partir
					de la etapa anterior. </p>
					<br>
				<p> El ser humano estaría siempre en constante desarrollo cognoscitivo, por lo tanto con cada
					experiencia nueva de deberá reestablecer un equilibrio.  </p>
					<br>
				<p> El niño, al irse relacionando con su medio ambiente, irá incorporando las experiencias a su propia
					actividad, y es aquí donde interviene el mecanismo de la asimilación puesto que el niño asimilaría el
					medio externo a sus estructuras cognoscitivas ya construidas, sin embargo las tendrá que reajustar con
					las experiencias ya obtenidas, lo que provoca una transformación de estructuras, es decir, se dará el
					mecanismo de la acomodación. </p>
					<br>
        <p> Sin embargo, para que el pensamiento pase a otros niveles de desarrollo se deberá presentar un
					tercer mecanismo. El equilibrio es el encargado del balance que surge entre el medio externo y
					las estructuras internas del pensamiento. </p>
				<p> La asimilación de los objetos externos es progresiva y se realiza por medio de todas las funciones
					del pensamiento: </p>
					<ul>
						<li> La percepción sensitiva </li>
						<li> La memoria </li>
						<li> La inteligencia práctica </li>
						<li> El pensamiento intuitivo </li>
						<li> La inteligencia lógica </li>
			<!--			<li>  </li> -->
				 </ul>
				<BR>
					<div align="center"><img src="../../IMG/InicioSesion.png" /></div>
				<BR>
			<h2 id="AF"> Inicio </h2>
			<h3> Nacimiento </h3>
				<p> Al nacer, el primer movimiento que presenta es el reflejo de succión, el cual presentará un avance
					progresivo, es decir, el presentará soluciones a pequeños problemas, sin embargo en algunos días irá
					asimilando dicha acción. </p>
					<br>
			<h3> 2 a 3 semanas </h3>
				<p> Al llegar a este periodo el niño comenzará a presentar "inteligencia práctica" que se
					construye exclusivamente con la manipulación de objetos. Esta manipulación le permitirá percibir
					movimientos, estos estarán organizados en "esquemas" de acción. </p>
				<p> Conforme el niño siga manejando objetos y experimentando diversas conductas se desarrollarán y
					multiplicarán los esquemas de acción. </p>
					<br>
			<h3> Al año </h3>
				<p> En el transcurso del primer año, el niño presentará un marcado egocentrismo, esto provoca que la
					causalidad vaya implícita en la propia actividad de niño, no hay relación entre un acontecimiento y
					otro, no obstante, en base a la propia experiencia, el bebé podría comprobar que existe una pausa para
					cada suceso. </p>
					<br>
        <p> Un suceso importante en el desarrollo cognoscitivo del niño es la aparición del lenguaje, el niño
					utilizará la expresión verbal para poder relatar sus acciones, lo cual conlleva otros acontecimientos
					también importantes. Uno de ellos es el inicio de la socialización. </p>
				<p> Este es el momento en que el niño se relacionará más cercanamente con el medio social. Ocacionando asi
					la primera etapa es la interiorización de la palabra, es decir, que	el niño tendrá en la mente su propia
					 interpretación de una palabra, hasta llegar a interiorizar acciones, lo cual hace que se genere el
					 pensamiento. </p>
					 <br>
					 <br>
				<h2 id="AR"> Resumen </h2>
					 <table id="tabla1">
 					  <tr>
 					    <th> Desarrollo </th>
							<th>  </th>
 					  </tr>
 					  <tr>
 					    <td> Físico	</td>
							<td>
								<p> Los movimientos de piernas, brazos y manos son todavía reflejos.</p>
								<p> Empuja hacia fuera brazos y piernas.Puede mantener la cabeza en línea con la espalda.</p>
								<p> Poco a poco los controles reflejos comienzan a desaparecer, mientras que las acciones se van
									volviendo mas voluntarias. </p>
								<p> Comienza a descubrir sus manos y su movimiento. </p>
							</td>
 					  </tr>
						<tr>
 					    <td> Sensor-motor	</td>
							<td>
								<p> Empezara a reaccionar a la voz humana. </p>
								<p> Relacionara poco a poco los objetos de su alrededor. </p>
								<p> También reaccionará a sus estados de ánimo y se intentará de comunicar a su manera.</p>
								<p> Sus movimeientos seran cada vez más eficientes. </p>
							</td>
 					  </tr>
						<tr>
 					    <td> Social	</td>
							<td>
								<p> La madre es la primera persona con la que establece una relación, se acomodará a la
								persona quien lo carga y empezara a hacer contacto visual.</p>
								<p> Al inicio los patrones de comida, sueño y actividades son muy desordenados, sin embargo,
								con el tiempo empezará a adoptar las rutinas inculacadas por su circulo social cercano.</p>
							</td>
 					  </tr>
 					   <tr>
 					    <td> Intelectual </td>
 					    <td>
								<p> Empezará a estudiar con mas detalle su entorno, haciendo asociaciones con cada objetos
								como su función, color, si es un riesgo o no, etc. </p>
								<p>  También empezará a memorizar y distinguir voces y sonidos externos nuevos. Todo esto
								hace que se interese cada vez más en la exploración de su entorno.</p>
							</td>
 					  </tr>
 					</table>

			</div>
		</article> <!-- /article -->
	</section> <!-- / #main-content -->

</body>
</html>
<% } %>