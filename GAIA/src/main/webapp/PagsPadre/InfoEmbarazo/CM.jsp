
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
	<title>Cuidados</title>
  <link rel="stylesheet" href="../../CSS/CM.css">
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
					<li><a href="#higiene">Higiene</a>
						<ul>
							<li> <a class="links" href="#estrias"> Estrias </a> </li>
							<li> <a class="links" href="#cel"> Celulitis </a> </li>
							<li> <a class="links" href="#RP"> Ronchas y Picazón </a> </li>
							<li> <a class="links" href="#HRL"> Hinchazón y retención de liquido </a></li>
						</ul>
					</li>
					<li><a href="#Sport">Deportes</a></li>
				</ul>
			</div>
      <br>

			<img src="../../IMG/CM1.png" alt="CM1" />

			<div class="content">
				<br>
			<h2 id="higiene"> Higiene </h2>
			 <h3 id="estrias"> Estrias </h3>
				<p> Las estrías son líneas o surcos que aparecen en lo profundo de la piel cuando esta es sometida a
					cambios bruscos de volumen, generalmente aparecen más frecuentemente en vientre, senos, muslos, cara
					interna de los brazos, abdomen y caderas, son irreversibles, de manera que es muy importante
					prevenirlas. Para ello te aconsejamos: </p>
					<br>
					<ul>
	  				<li> Hidrata tu piel, hacerla mas elástica evita que se rompa demasiado, aplica
							regularmente crema u aceites especiales para las estrías. </li>
	  				<li> Bebe al menos dos litros de agua al día. Esto mantendrá tu piel hidratada
							desde el interior. </li>
	  			</ul>
					<br>
					<h3 id="cel"> Celulitis </h3>
	 				<p> Esta es una alteración del tejido de la piel. Su manifestación más inmediata es la acumulación
						de grasa parecidos a unos pequeños hoyos que pueden aparecer en la dermis de los glúteos, el abdomen
						o los muslos y las piernas. Para evitar la aparición de este padecimiento se recomienda mantenerse
						hidratada junto a una dieta sana enfatizando las vegetales de hoja verde y establecer una rutina de
						ejercicio. </p>
				<BR>
				<BR>
			  <h3 id="RP"> Ronchas y Picazón  </h3>
				<p> Los cambios hormonales y los repentinos estiramientos de la piel en el embarazo suelen causar
					molestias como picazón y aparecimiento de ronchas.  </p>
				<p> Sin embargo un fuerte picor puede ser síntoma de un problema hepático, esta es una enfermedad
					que puede llegar a afectar al feto si no se atiende de manera oportuna, por lo que a la mínima
					sospecha de padecerla es muy importante acudir al médico para que diagnostique el estado de la
					madre y del bebé. </p>
				<p> El calor puede ser un problema a la hora de cuidar la piel, pues el sudor y las temperaturas
					altas suelen aumentar la picazón e intensificar las erupciones en la piel, para evitar esto procura
					usar ropa ligera en especial en la zona de la entrepierna. </p>
				<p>  </p>
				<BR>
				<BR>
			  <h3 id="HRL"> Hinchazón y retención de liquido  </h3>
				<p> En esta etapa es normal que la retención de liquido, también conocida como edema, esto se genera
					por los cambios hormonales y fisiológicos que conlleva el embarazo, como el aumento de la progesterona
					y el aumento del volumen sanguíneo, por otro lado también se puede atribuir a algunos hábitos como lo
					es estar de pie por tiempos prolongados, esta posición dificulta la circulación de la sangre desde las
					piernas al corazón, ademas de que en el embarazo se carga con el peso extra del bebe por lo que el dolor
					 y la hinchazón aumentaran conforme avanza el embarazo.  </p>
				<p> Si bien esto es algo común no se debe tomar a la ligera en especial para las madres primerizas
					pues en caso de presentarse en zonas como la cara y las manos puede  tener patologías asociadas
					como hipertensión o diabetes.</p>
				<p> Para atenuar la hinchazón tienes que:  </p>
				<br>
				<ul>
					<li> Controlar el peso y ten una dieta equilibrada, recuerda que pese al aumento de peso no debes de
						subir mas de 10 u 12 kilos. </li>
					<li> Consume agua de manera frecuente. </li>
					<li> Evita el consumo de sodio estos suelen aumentar la retención de líquido en embarazadas. </li>
					<li> Da masajes en los pues con alguna esencia calmante  </li>
					<li> No permanezcas mucho tiempo de pie </li>
					<li> Duerme del lado izquierdo </li>
				</ul>
				<br>

     <h2 id="Sport"> Deportes </h2>
		 <img src="../../IMG/CM2.png" alt="CM2" />
				<p> La actividad física es importante en cualquier etapa, sin embargo considerando el estado de
					delicadeza de la madre no siempre se lleva a cabo de la manera tradicional. Es recomendable hacer
					ejercicio al mínimo 3 veces por semana, aunque de preferencia hacer ejercicio 30 minutos diarios
					ayuda mejor, sin embargo si hace tiempo que no ejercitas o no es un habito que lo hagas es mejor
					empezar con 15 min e ir subiendo de tiempo. Algunos ejercicios recomendados son: </p>
					<ul>
						<li> Natación </li>
						<li> Aeróbicos de baja intensidad </li>
						<li> Ciclismo estático </li>
						<li> Yoga  </li>
						<li> Caminatas moderadas durante los primeros trimestres </li>
					</ul>
				<p> Sin embargo recuerde evitar todo ejercicio que requiera un sobre esfuerzo en el abdomen, vientre
					y espalda. Ademas recuerde parar cuando se sienta mareada o fatigada, no es bueno abusar del cuerpo
					durante el embarazo, si tu medico te indica que no es recomendable que realices ejercicios entonces
					no los hagas,consulta alternativas y recuerda siempre procurar tu salud. </p>
			</div>
		</article> <!-- /article -->
	</section> <!-- / #main-content -->

</body>
</html>
<% } %>