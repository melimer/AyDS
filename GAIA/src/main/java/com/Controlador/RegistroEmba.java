/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Controlador;

import com.Modelo.ActsUser;
import com.Modelo.PEmbarazo;
import com.Modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 */
@WebServlet(name = "RegistroEmba", urlPatterns = {"/RegistroEmba"})
public class RegistroEmba extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegistroEmba</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegistroEmba at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String nombre = request.getParameter("nombre");
        String apodo = request.getParameter("apodo");
        String correo = request.getParameter("user_mail");
        String contra = request.getParameter("pass");
        String semanas = request.getParameter("semanas");
        String sexo = request.getParameter("sexo");
        
        MessageDigest digest = null;
         boolean error = false;
        
        /*try {
            digest = MessageDigest.getInstance("SHA-1");
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(RegistroEmba.class.getName()).log(Level.SEVERE, null, ex);
        }
        
	digest.reset();
	 digest.update(contra.getBytes("utf8"));
	 String pass = String.format("%040x", new BigInteger(1, digest.digest()));*/
        
        ActsUser act=new ActsUser();
        Usuario user=new Usuario();
        PEmbarazo pa=new PEmbarazo();
        String error_s;
        try {
            if(error == false){
            if (act.Existe(correo, apodo) == true) {
                PrintWriter out = response.getWriter();
                response.setContentType("text/html");
                out.println("<script type=\"text/javascript\">");
                out.println("alert('El nombre de usuario o correo electrónico ya existe');");
                out.println("window.location = 'Sesion/RPM.jsp';");
                out.println("</script>");
                
            }else{
                if (semanas.equals("")) {
                    PrintWriter out = response.getWriter();
                    response.setContentType("text/html");
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Llene todos los campos');");
                    out.println("window.location = 'Sesion/RPM.jsp';");
                    out.println("</script>");
                }else{
                    Usuario usu = new Usuario(nombre, correo, contra, apodo);
                    PEmbarazo padre = new PEmbarazo(semanas, sexo);
                    act.DarAltaUsrPadre(usu,padre);
            
                    HttpSession objSesion = request.getSession();
                    objSesion.setAttribute("loggedIn", "true");
                    objSesion.setAttribute("loggedUser", correo);
                    response.sendRedirect("PagsPadre/InicioPadre.jsp");
                }
            }
         }else if(error == true){
         }
        } catch (Exception ex) {
            Logger.getLogger(RegistroEmba.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
