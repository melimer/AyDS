

<%@page import="com.Modelo.Usuario"%>
<%@page import="com.Modelo.Sintomas"%>
<%@page import="com.Modelo.SintomasCRUD"%>
<%@page import="com.Modelo.ActsUser"%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>


        <title> Sintomas del Embarazo </title>
        <link rel="stylesheet" href="../../CSS/Sintomas.css">
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="sweetalert.js"></script>
        <link rel="stylesheet" href="sweetalert2.css">
    </head>
    <body>
        <header id="main-header">
            <a id="logo-header" href="#">
                <span class="site-name">GAIA</span>
                <span class="site-desc">Por Asteria</span>
            </a>
            <nav>
                <ul>
                    <li><a href="../MenuRegistro.html">Registro</a></li>
                    <li><a href="../InicioPadre.jsp">Inicio</a></li>
                    <li><a href="../MiPerfil.jsp">Usuario</a></li>
                </ul>
            </nav>
        </header>


        <div id="PanelAcciones">
            <button onclick="window.location.assign('Sintomas.jsp');" class="btns" id="btnNoAgrega">Ver síntomas</button>
            <br><br>
        </div>
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
        Usuario usr = act.Usuario(user);
        String nombre = usr.getNombre();
        String correo = usr.getCorreo();
        String id_usuario = act.BuscarSesion(correo);
        String id_padre = act.BuscarPadre2(id_usuario);
        if(request.getParameter("id") == null){
%>
        <div id="formulario">

            <form id="formu" action="../../SintomasEm?id_padre=<%=id_padre%>" method="post" >
                <h2 class="instruccion"> Síntomas en el Embarazo. </h2>
                <p class="instruccion">Selecciona los sintomas que has presentado durante el día.</p>
                <label for="sexo">&nbsp&nbsp Físicos </label>
                <br> 
                <div class="divs">
                    <label class="checkeable" >
                        <input type="checkbox" name="dolorCa" value="true"/>
                        <img class="images" src="../../IMG/dolor-de-cabeza.png"/><br>
                    </label>
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspDolor de cabeza
                </div>
                <div class="divs">
                    <label class="checkeables">
                        <input type="checkbox" name="vomito" value="true"/>
                        <img src="../../IMG/vomitos.png"/><br>             
                    </label>
                    Vómito 
                </div>
                <div class="divs">
                    <label class="checkeable-s">
                        <input type="checkbox" name="senos" value="true"/>
                        <img src="../../IMG/senos.png"/><br>
                    </label>
                    Senos sensibles
                </div>
                <br><br><br><br><br><br>
                <div class="divs">
                    <label class="checkeable-m">
                        <input type="checkbox" name="nauseas" value="true"/>
                        <img src="../../IMG/mareado.png"/><br>
                    </label>
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspNauseas
                </div>
                <div class="divs">
                    <label class="checkeable-h">
                        <input type="checkbox" name="hinchazon" value="true"/>
                        <img src="../../IMG/hinchazon.png"/><br>
                    </label>
                    Hinchazón
                </div>
                <div class="divs">
                    <label class="checkeable-f">
                        <input type="checkbox" name="fatiga" value="true"/>
                        <img src="../../IMG/fatiga.png"/><br>
                    </label>
                    Fatiga
                </div>

                <div class="divs">
                    <label class="checkeable-c">
                        <input type="checkbox" name="calambre" value="true"/>
                        <img src="../../IMG/calambre.png"/><br>
                    </label>
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspCalambres
                </div>
                <div class="divs">
                    <label class="checkeable-e">
                        <input type="checkbox" name="constipa" value="true"/>
                        <img src="../../IMG/constipation.png"/><br>
                    </label>
                    Estreñimiento
                </div>
                <div class="divs">
                    <label class="checkeable-v">
                        <input type="checkbox" name="sangre" value="true"/>
                        <img src="../../IMG/sangrado.png"/><br>
                    </label>
                    Sangrado Vaginal
                </div>
                <br> <br> <br>


                <label for="sexo">&nbsp&nbspEmocionales</label>
                <br>
                <div class="divs">
                    <label class="checkeable-ef">
                        <input type="checkbox" name="feliz" value="true"/>
                        <img src="../../IMG/smiley.png"/><br>
                    </label>
                    Feliz
                </div>
                <div class="divs">
                    <label class="checkeable-et">
                        <input type="checkbox" name="triste" value="true"/>
                        <img src="../../IMG/triste.png"/><br>
                    </label>
                    Triste
                </div>
                <div class="divs">
                    <label class="checkeable-ed">
                        <input type="checkbox" name="disgus" value="true"/>
                        <img src="../../IMG/disgusto.png"/><br>
                    </label>
                    Disgusto
                </div>
                <div class="divs">
                    <label class="checkeable-es">
                        <input type="checkbox" name="sensible" value="true"/>
                        <img src="../../IMG/sensible.png"/><br>
                    </label>
                    Sensibilidad
                </div>
                <div class="divs">
                    <label class="checkeable-ei">
                        <input type="checkbox" name="enojo" value="true"/>
                        <img src="../../IMG/enojado.png"/><br>
                    </label>
                    Ira
                </div>
                <div class="divs">
                    <label class="checkeable-ea">
                        <input type="checkbox" name="angus" value="true"/>
                        <img src="../../IMG/angustiado.png"/><br>
                    </label>
                    Angustia
                </div>
                <div class="divs">
                    <label class="checkeable-ec">
                        <input type="checkbox" name="confu" value="true"/>
                        <img src="../../IMG/confusion.png"/><br>
                    </label>
                    Confusión
                </div>
                <div class="divs">
                    <label class="checkeable-etd">
                        <input type="checkbox" name="tranqui" value="true"/>
                        <img src="../../IMG/tranquilidad.png"/><br>
                    </label>
                    Tranquilidad
                </div>
                <br> <br> <br> <br> <br><br>
                <p class="instruccion">¿Hay algo más que quieras agregar?&nbsp&nbsp&nbsp&nbsp Colocalo aquí. </p>
                <ul>
                    <li> <input id="notas" name="notas" type="text" maxlength="140" />  </li>
                </ul>

                <hr>
                <input class="submi" type="submit"  name="accion" value="Registrar" onclick="seRegistro()"/>
                <input class="resit" type="Reset" value="Borrar todo">
            </form>
        </div>
                
                <%
                    }else{
                    SintomasCRUD sintomascrud = new SintomasCRUD();
                    Sintomas sintoma = sintomascrud.Consulta(request.getParameter("id"));
                %>
                
                
                
        <div id="formulario">

            <form id="formu" action="../../ModifSintomasEm" method="post" >
                <h2 class="instruccion"> Síntomas en el Embarazo. </h2>
                <input hidden name="id_sintomas" value="<%=request.getParameter("id")%>">
                <p class="instruccion">Selecciona los sintomas que has presentado durante el día.</p>
                <label for="sexo">&nbsp&nbsp Físicos </label>
                <br> 
                <div class="divs">
                    <label class="checkeable" >
                        <input type="checkbox" name="dolorCa" value="true" <% if(sintoma.getDolor()){%> checked <% } %>/>
                        <img class="images" src="../../IMG/dolor-de-cabeza.png"/><br>
                    </label>
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspDolor de cabeza
                </div>
                <div class="divs">
                    <label class="checkeables">
                        <input type="checkbox" name="vomito" value="true" <% if(sintoma.getVomito()){%> checked <% } %>/>
                        <img src="../../IMG/vomitos.png"/><br>             
                    </label>
                    Vómito 
                </div>
                <div class="divs">
                    <label class="checkeable-s">
                        <input type="checkbox" name="senos" value="true" <% if(sintoma.getSe_sensible()){%> checked <% } %>/>
                        <img src="../../IMG/senos.png"/><br>
                    </label>
                    Senos sensibles
                </div>
                <br><br><br><br><br><br>
                <div class="divs">
                    <label class="checkeable-m">
                        <input type="checkbox" name="nauseas" value="true" <% if(sintoma.getNauseas()){%> checked <% } %>/>
                        <img src="../../IMG/mareado.png"/><br>
                    </label>
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspNauseas
                </div>
                <div class="divs">
                    <label class="checkeable-h">
                        <input type="checkbox" name="hinchazon" value="true" <% if(sintoma.getHinchazon()){%> checked <% } %>/>
                        <img src="../../IMG/hinchazon.png"/><br>
                    </label>
                    Hinchazón
                </div>
                <div class="divs">
                    <label class="checkeable-f">
                        <input type="checkbox" name="fatiga" value="true" <% if(sintoma.getFatiga()){%> checked <% } %>/>
                        <img src="../../IMG/fatiga.png"/><br>
                    </label>
                    Fatiga
                </div>

                <div class="divs">
                    <label class="checkeable-c">
                        <input type="checkbox" name="calambre" value="true" <% if(sintoma.getCalambres()){%> checked <% } %>/>
                        <img src="../../IMG/calambre.png"/><br>
                    </label>
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspCalambres
                </div>
                <div class="divs">
                    <label class="checkeable-e">
                        <input type="checkbox" name="constipa" value="true" <% if(sintoma.getConstipacion()){%> checked <% } %>/>
                        <img src="../../IMG/constipation.png"/><br>
                    </label>
                    Estreñimiento
                </div>
                <div class="divs">
                    <label class="checkeable-v">
                        <input type="checkbox" name="sangre" value="true" <% if(sintoma.getSangrado()){%> checked <% } %>/>
                        <img src="../../IMG/sangrado.png"/><br>
                    </label>
                    Sangrado Vaginal
                </div>
                <br> <br> <br>


                <label for="sexo">&nbsp&nbspEmocionales</label>
                <br>
                <div class="divs">
                    <label class="checkeable-ef">
                        <input type="checkbox" name="feliz" value="true" <% if(sintoma.getFeliz()){%> checked <% } %>/>
                        <img src="../../IMG/smiley.png"/><br>
                    </label>
                    Feliz
                </div>
                <div class="divs">
                    <label class="checkeable-et">
                        <input type="checkbox" name="triste" value="true" <% if(sintoma.getTriste()){%> checked <% } %>/>
                        <img src="../../IMG/triste.png"/><br>
                    </label>
                    Triste
                </div>
                <div class="divs">
                    <label class="checkeable-ed">
                        <input type="checkbox" name="disgus" value="true" <% if(sintoma.getDisgusto()){%> checked <% } %>/>
                        <img src="../../IMG/disgusto.png"/><br>
                    </label>
                    Disgusto
                </div>
                <div class="divs">
                    <label class="checkeable-es">
                        <input type="checkbox" name="sensible" value="true" <% if(sintoma.getSensible()){%> checked <% } %>/>
                        <img src="../../IMG/sensible.png"/><br>
                    </label>
                    Sensibilidad
                </div>
                <div class="divs">
                    <label class="checkeable-ei">
                        <input type="checkbox" name="enojo" value="true" <% if(sintoma.getIra()){%> checked <% } %>/>
                        <img src="../../IMG/enojado.png"/><br>
                    </label>
                    Ira
                </div>
                <div class="divs">
                    <label class="checkeable-ea">
                        <input type="checkbox" name="angus" value="true" <% if(sintoma.getAngustia()){%> checked <% } %>/>
                        <img src="../../IMG/angustiado.png"/><br>
                    </label>
                    Angustia
                </div>
                <div class="divs">
                    <label class="checkeable-ec">
                        <input type="checkbox" name="confu" value="true" <% if(sintoma.getConfusion()){%> checked <% } %>/>
                        <img src="../../IMG/confusion.png"/><br>
                    </label>
                    Confusión
                </div>
                <div class="divs">
                    <label class="checkeable-etd">
                        <input type="checkbox" name="tranqui" value="true" <% if(sintoma.getTranquilidad()){%> checked <% } %>/>
                        <img src="../../IMG/tranquilidad.png"/><br>
                    </label>
                    Tranquilidad
                </div>
                <br> <br> <br> <br> <br><br>
                <p class="instruccion">¿Hay algo más que quieras agregar?&nbsp&nbsp&nbsp&nbsp Colocalo aquí. </p>
                <ul>
                    <li> <input id="notas" name="notas" type="text" maxlength="140" value="<% out.println(sintoma.getNotas()); %>" />  </li>
                </ul>

                <hr>
                <input class="submi" type="submit"  name="accion" value="Guardar"/>
                <input class="resit" type="Reset" value="Borrar todo">
            </form>
        </div>

                <%
                    }
}
                %>

        <script src="../../JS/AccSintomas.js"></script>
    </body>
</html>
