
<%@page import="com.Modelo.Usuario"%>
<%@page import="com.Modelo.ActsUser"%>
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
	<title>Nutrición Bebé</title>
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
				<h1>Nutrición Infantil</h1>
			</header>

			<div id="menu">
				<ul>
					<li><a class="links" href="#Intro">Recien nacidos</a></li>
					<li><a class="links" href="#AF">6-12 meses</a></li>
					<li><a class="links" href="#AR">Toma en cuenta...</a></li>
				</ul>
			</div>
      <br>
			<img src="../../IMG/Nutricionbb.png" alt="N1" />

			<div class="content">
				<br>
			<h2 id="Intro"> Recién nacidos </h2>
				<p> Durante los primeros meses, la leche materna es su mejor alimentación. Las necesidades calóricas
					de los recién nacidos son muy altas. Tomar el pecho favorece la relación madre e hijo.
					Además protege al bebé de infecciones y enfermedades y, a largo plazo parece que reduce el riesgo de
					alergias y obesidad. Además la lactancia te ayuda a recuperar tu silueta y el peso previo al embarazo,
					ya que en esta etapa se gastan muchas calorías. </p>
					<br>
				<p>La leche materna tiene sabores diferentes que dependen de la alimentación de la madre y cubre las
					necesidades del bebé ya que se adapta periódicamente a ellas a medida que van cambiando.</p>
        <p> En caso de que no sea posible amamantar al bebé, se puede optar por una lactancia a base de leches
					de fórmula. Existen dos tipos: las de inicio (desde el nacimiento hasta los los 4-6 meses) y las
					fórmulas de continuación (desde los 4-6 meses de edad en adelante). </p>
				<BR>
					<img src="../../IMG/Nutricionbb2.png" alt="N2"/>
				<BR>
			<h2 id="AF"> 6-12 meses </h2>
				<p> Cuando el bebé cumple medio año es necesario el aporte de otros alimentos, se despierta la
					curiosidad por nuevos sabores. </p>
				<p> Al medio año del nacimiento, los requerimientos nutricionales de tu bebé ya no pueden
					satisfacerse por completo con la lactancia, es el momento de introducir por primera vez
					nuevos sabores y texturas. Verdura, fruta, cereales, carne y pescado en papillas y purés
					son fundamentales para satisfacer sus nuevas necesidades. </p>
				<p> El bebé mostrará cuándo ha llegado el momento de empezar con alimentos sólidos, notarás un
					interes por la comida y la probará. </p>
					<br>
				<p> Durante los primeros seis meses de vida, la lactancia materna es exclusiva, natural o con fórmula
					(en los casos donde la primera no sea posible), satisface totalmente los requerimientos nutricionales
					del bebé. Ofrecerle otros alimentos u otros líquidos a esta edad, puede tener muchos riesgos que
					afecten su crecimiento y su salud. </p>
				<p> La introducción de alimentos inicia cuando el niño recibe el primer alimento diferente a la leche
					materna, esto debe suceder a partir de los seis meses de edad y debe terminar cuando el niño se
					incorpora completamente a la dieta familiar, cerca de los dos años de edad. </p>
					<br>
				<p> Esta alimentación complementaria debe ser oportuna, es decir, no introducir alimentos diferentes
					a la leche materna, antes de los seis meses de edad, ni muy tarde a esa edad. Debe ser gradual, por
					lo que hay que introducir poco a poco cantidades, sabores y texturas de alimentos de acuerdo al
					crecimiento del niño. </p>
				<p> Los alimentos deben introducirse de forma gradual, siguiendo las indicaciones de tu pediatra: </p>
				<ul>
					<li> Hasta los 4-6 meses se recomienda exclusivamente lactancia </li>
					<li> A partir de los 4-6 meses se introduce de manera gradual, fruta,
						   cereales sin gluten, verduras y hortalizas </li>
					<li> Cereales con gluten a partir del sexto mes </li>
					<li> A partir del 6-7 séptimo mes ya podemos meter carnes magras,
						   quitando la grasa visible y la piel de las aves </li>
					<li> A partir del 8-9 mes introducimos pescado y huevos </li>
					<li> Al año incorporamos las legumbres </li>
					<li> A partir de los dos años se incorporan las frutas tropicales y
						   de manera individual para detectar posibles alergias </li>
			 </ul>

					<table id="tabla1">
					  <tr>
					    <th> Consejos y Recomendaciones: </th>
					  </tr>
					  <tr>
					    <td>
								<ul>
									<li> Da los mismos alimentos que come el resto de la familia al mismo tiempo. </li>
									<li> Dar a conocer al niño poco a poco los diferentes sabores primero solos y después mezclados </li>
									<li> Establece un horario de comida diario, evita saltar el horario o cambiarlo
										constantemente </li>
									<li>  Las cantidades deben ser muy pequeñas (una o dos cucharaditas). Se aumentan a medida
										que pasa el tiempo y que el niño acepte mayores cantidades.  </li>
						<!--	<li>  </li>
									<li>  </li> -->
							 </ul>
						  </td>
					  </tr>
					<!--   <tr>
					    <td>  </td>
					    <td>  </td>
					  </tr> -->
					</table>

				<BR>
					<img src="../../IMG/Nutricion1.png" alt="N2"/>
				<BR>

			<h2 id="AR"> Toma en cuenta... </h2>
				<p> Los momentos de la comida deben ser placenteros. Procura dar el	tiempo prudencial y necesario
					para comer, y permitir que abandone la mesa cuando muestre que ya comió suficiente
					(no hacerlo comer cuando no tiene hambre) </p>
				<p> Toma en cuenta que muchos niños, al igual que a los adultos, son neofóbicos, lo nuevo produce
					rechazo	y es probado con cautela pero también son neofílicos, es decir, lo nuevo también lo atrae. </p>
				<p> En el caso del rechazo de algún alimento importante se recomienda dos ofrecimientos por semana,
					lo que puede llegar a necesitar 8-10 exposiciones hasta definir si realmente el alimento no es de
					su preferencia. En caso de no dar resultado es recomendable buscar algún sustituto en otro alimento
				con el mismo o una cantidad similar del aporte nutrimental</p>
<!--				<p>  </p>
				<p>  </p> -->
				<table id="tabla1">
					<tr>
						<th> Consejos y Recomendaciones: </th>
					</tr>
					<tr>
						<td>
							<ul>
								<li> Los alimentos sólidos se deben cortar en trozos pequeños para evitar situaciones de ahogo </li>
								<li> Programa las diferentes comidas de manera regular, tres comidas principales y
									dos más ligeras, una a media mañana y la merienda </li>
								<li> Recuerda que la responsabilidad del niño es comer, obedeciendo únicamente a las sensaciones
									internas de hambre y saciedad. </li>
								<li> Procura que las recetas sean atractivas visualmente  </li>
					<!--	<li>  </li>
								<li>  </li>
								<li>  </li>
								<li>  </li> -->
						 </ul>
						</td>
					</tr>
				</table>

			</div>

		</article> <!-- /article -->
	</section> <!-- / #main-content -->

</body>
</html>
<% } %>