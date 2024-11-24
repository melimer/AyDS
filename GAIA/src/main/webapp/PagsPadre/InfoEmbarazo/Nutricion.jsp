

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
	<title>Nutrición</title>
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
				<h1>Nutrición</h1>
			</header>

			<div id="menu">
				<ul>
					<li><a class="links" href="#Intro">Introducción</a></li>
					<li><a class="links" href="#AF">El acido fólico</a></li>
					<li><a class="links" href="#AR">Alimentos recomendados</a></li>
				</ul>
			</div>
      <br>
			<img src="../../IMG/Nutricion1.png" alt="N1" />

			<div class="content">
				<br>
			<h2 id="Intro"> Introducción </h2>
				<p> Antes y durante el transcurso del embarazo se producen varios cambios fisiológicos, algunos de estos
					tienden a influir en la manera en que la mujer se alimenta. Tomando en consideración la salud de la
					mujer es vital para el desarrollo de embarazo, se es importante poner especial atención a los alimentos
					que se consumen durante este periodo ya que si bien el feto es capaz de adaptarse a la falta de
					nutrientes o a la abundancia de alimentos, esto  aumenta su propensión al padecimiento de enfermedades
					cardiovasculares y metabólicas en la vida adulta. </p>
					<br>
				<p> El estado de salud de la madre antes de la concepción puede condicionar la embriogénesis y
					salud del descendiente así como  la deficiencia de folato tanto en etapas previas a la concepción
					como durante las diez primeras semanas del embarazo está relacionada con malformaciones cardiacas
					y defectos del tubo neural.</p>
        <p> Hay que recordar que el riesgo del desarrollo de malformaciones sucede durante los primeros 28 días
					de gestación, periodo en la cual la mujer puede que no este consiente de su embarazo. Para evitar
					problemas al futuro bebe se tiene que planificar una dieta donde incluya los alimentos que aportan
					nutrientes necesarios y no dañinos al organismo. </p>
				<BR>
				<BR>
			<h2 id="AF"> El acido fólico </h2>
				<p> El acido fólico es un nutrimento esencial , este ayuda en la formación el tubo neural el cual
					una vez desarrollado se convertirá en el cerebro y médula espinal del recién nacido así como en
					las estructuras que los recubren y protegen. Se es necesario consumir el acido fólico para prevenir
					algunos defectos de nacimiento graves del cerebro y de la columna vertebral. </p>
				<p> La CDC recomienda el consumo de 400 miligramos de acido fólico diario en mujeres en edad reproductiva,
					se puede consumir en pastillas. Cabe destacar que el ácido fólico es la forma sintética de la vitamina
					B9 o folato y, junto con la vitamina B12, por lo que también se es recomendable consumir alimentos ricos
					en folato, esto se encuentra principalmente en cítricos, frutos secos, granos y legumbres </p>
				<p> Entre los alimentos mas recomendados para el aporte de este nutrinte tenemos: </p>

					<table id="tabla1">
					  <tr>
					    <th>Alimentos</th>
					    <th>Cantidad</th>
					  </tr>
					  <tr>
					    <td> Lentejas </td>
					    <td> 0,234 mg por cada taza </td>
					  </tr>
					  <tr>
					    <td> Cacahuetes</td>
					    <td> 0,22 mg por cada taza </td>
					  </tr>
					  <tr>
					    <td> Garbanzos </td>
					    <td> 0,37 mg por cada taza </td>
					  </tr>
					  <tr>
					    <td> Espinacas  </td>
					    <td> 0,286 mg por cada taza cocinada </td>
					  </tr>
					  <tr>
					    <td> Brócoli </td>
					    <td>  0,22 mg por cada taza </td>
					  </tr>
					  <tr>
					    <td> Hígado de ternera </td>
					    <td> 0,266 mg por cada 100 gramos </td>
					  </tr>
					  <tr>
					    <td> Espárragos verdes </td>
					    <td> 0,226 mg por cada taza </td>
					  </tr>
					  <tr>
					    <td> Semillas de girasol </td>
					    <td> 0,476 mg por cada taza </td>
					  </tr>
					  <tr>
					    <td> Lechuga </td>
					    <td> 0,16 mg por cada 10 hojas </td>
					  </tr>
					<!--   <tr>
					    <td>  </td>
					    <td>  </td>
					  </tr> -->
					</table>

				<BR>
				<BR>
			<h2 id="AR"> Alimentos recomendados </h2>
				<p> En el primer trimestre de gestación no es preciso consumir calorías adicionales. No es si no hasta
					el segundo trimestre cuando se aconseja un incremento de entre 300 y 500 kcal, que deberá proceder
					principalmente de hidratos de carbono de absorción lenta como legumbres, pasta, arroz o patata. Para
					el tercer trimestre se mantiene este aumento de calorias, sin embargo se agregan las proteínas
					necesarias para el desarrollo fetal </p>
					<ul>
						<li>Vitamina D: Lácteos (no desnatados) · Pescados azules · Yema de huevo (3 a 4 entre semana)</li>
						<li>Vitamina B12: Alimentos de origen animal</li>
						<li>Hierro: Mariscos (berberechos, almejas) o carnes rojas: ternera, buey, conejo, etc.</li>
         </ul>
				<p> El consumo de estos alimentos debe ser moderado y con una frecuencia adecuada, para eso es
					recomendable agendar una cita con el nutricionista para la consulta de una dieta mas personalizada.</p>
					<br>
					<table id="tabla1">
						<TR>
							<TD> VERDURAS Y HORTALIZAS </TD>
							<TD> Su aporte energético es muy bajo pero contienen mucha fibra que mejora el estreñimiento.
								Las verduras contienen potasio para mejorar la retención de líquidos, vitamina C y ácido fólico.</TD>
						</TR>
						<TR>
							<TD> FRUTAS </TD>
							<TD> Es recomendable consumir al menos 3 piezas diarias debido a su contenido alto en carbohidratos,
								 fibra soluble, potasio, vitamina C (en especial los cítricos) y agua que nos ayudan a prevenir la
								 preeclampsia.</TD>
						</TR>
						<TR>
							<TD> PROTEÍNAS </TD>
							<TD>Los requerimientos de proteínas aumentan en el segundo y tercer trimestre porque éstas son
								 necesarias para crear tejidos nuevos. Es mejor medir la cantidad de proteína total en gramos
								 por kilos de peso, por eso la cantidad recomendada es diferente para cada persona. Se pueden
								 encontrar en distintos alimentos tales como pescados, frutos secos, huevo y carnes. </TD>
						</TR>
					</table>
				<p>  </p>
				<p>  </p>
			</div>

		</article> <!-- /article -->
	</section> <!-- / #main-content -->

</body>
</html>
<% } %>