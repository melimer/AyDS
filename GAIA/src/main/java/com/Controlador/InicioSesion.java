/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Controlador;

import com.Modelo.ActsUser;
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
@WebServlet(name = "InicioSesion", urlPatterns = {"/InicioSesion"})
public class InicioSesion extends HttpServlet {

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
            throws ServletException, IOException, Exception {
        
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(InicioSesion.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String nombre = request.getParameter("username");
        String pass = request.getParameter("password");
        ActsUser act = new ActsUser();

        boolean log = false;

        log = act.LogIn(nombre, pass);

        System.out.println(log);
        if (log == true) {
            String id = "";
            try {
                id = act.BuscarSesion(nombre);
            } catch (Exception ex) {
                Logger.getLogger(InicioSesion.class.getName()).log(Level.SEVERE, null, ex);
            }
            System.out.println(id); 
            try {
                if (Integer.parseInt(id) == 1) {
                    HttpSession objSesion = request.getSession();
                    objSesion.setAttribute("loggedIn", "true");
                    objSesion.setAttribute("loggedUser", nombre);
                    response.sendRedirect("Admin.jsp");
                } else {
                    try {
                        if (act.BuscarPadreusuario(id) != null) {
                            HttpSession objSesion = request.getSession();
                            objSesion.setAttribute("loggedIn", "true");
                            objSesion.setAttribute("loggedUser", nombre);
                            response.sendRedirect("PagsPadre/InicioPadre.jsp");
                        } else {
                            try {
                                if (act.BuscarDRUsuario(id) != null) {
                                    HttpSession objSesion = request.getSession();
                                    objSesion.setAttribute("loggedIn", "true");
                                    objSesion.setAttribute("loggedUser", nombre);
                                    response.sendRedirect("PagsDoctor/InicioMed.jsp");
                                }
                            } catch (Exception ex) {
                                Logger.getLogger(InicioSesion.class.getName()).log(Level.SEVERE, null, ex);
                            }
                        }
                    } catch (Exception ex) {
                        Logger.getLogger(InicioSesion.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            } catch (Exception ex) {
                Logger.getLogger(InicioSesion.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else if (log == false) {
            PrintWriter out = response.getWriter();
            response.setContentType("text/html");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Usuario o contraseña incorrectos');");
            out.println("window.location = 'Sesion/InicioSesion.jsp';");
            out.println("</script>");
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
