/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Controlador;

import com.Modelo.ActsUser;
import com.Modelo.Medico;
import com.Modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 */
@WebServlet(name = "RegistroMedico", urlPatterns = {"/RegistroMedico"})
public class RegistroMedico extends HttpServlet {

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
            out.println("<title>Servlet RegistroMedico</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegistroMedico at " + request.getContextPath() + "</h1>");
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
        String cedula = request.getParameter("cedula");
        String especialidad = request.getParameter("especialidad");
        ActsUser act = new ActsUser();
        /*MessageDigest digest = null;
        try {
            digest = MessageDigest.getInstance("SHA-1");
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(RegistroMedico.class.getName()).log(Level.SEVERE, null, ex);
        }
	digest.reset();
	 digest.update(contra.getBytes("utf8"));
	 String pass = String.format("%040x", new BigInteger(1, digest.digest()));*/
        boolean error;
        String error_s;
        Usuario user = new Usuario();
        try {
            if (act.Existe(correo, apodo) == true) {
                PrintWriter out = response.getWriter();
                response.setContentType("text/html");
                out.println("<script type=\"text/javascript\">");
                out.println("alert('El nombre de usuario o correo electrónico ya existe');");
                out.println("window.location = 'Sesion/Rmed.jsp';");
                out.println("</script>");
                
            } else {
                Medico med = new Medico();
                med.setCedula(cedula);
                med.setEspecialidad(especialidad);
                
                user.setApodo(apodo);
                user.setContra(contra);
                user.setCorreo(correo);
                user.setNombre(nombre);
                
                
                if(act.AltaUsrMed(user, med) == true){
                HttpSession objSesion = request.getSession();
                objSesion.setAttribute("loggedIn", "true");
                objSesion.setAttribute("loggedUser", correo);
                response.sendRedirect("PagsDoctor/InicioMed.jsp");
                    
                }else{ 
                    PrintWriter out = response.getWriter();
                    response.setContentType("text/html");
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Ocurrió un error');");
                    out.println("window.location = 'Sesion/Rmed.jsp';");
                    out.println("</script>");
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(RegistroMedico.class.getName()).log(Level.SEVERE, null, ex);
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
