/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Controlador;

import com.Modelo.ActsUser;
import com.Modelo.SolicitudMedico;
import com.Modelo.SolicitudPadre;
import java.io.IOException;
import java.io.PrintWriter;
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
 * @author melisamercado
 */
@WebServlet(name = "SolicitudMed", urlPatterns = {"/SolicitudMed"})

public class SolicitudMed extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SolicitudMed</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SolicitudMed at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String correoPem = request.getParameter("user_mail");
        SolicitudMedico soli = new SolicitudMedico();
        ActsUser act = new ActsUser();
        String id_usuario = "";
        try {
            id_usuario = act.Buscar(correoPem);
        } catch (Exception ex) {
            System.out.println("Error al buscar usuario con el correo pem");
            Logger.getLogger(SolicitudPem.class.getName()).log(Level.SEVERE, null, ex);
        }
        String id_persona = "";
        try {
            id_persona = act.BuscarPadreusuario(id_usuario);
        } catch (Exception ex) {
            System.out.println("Error al buscar persona con su id de usuario");
            Logger.getLogger(SolicitudPem.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (id_persona == null) {
            PrintWriter out = response.getWriter();
            response.setContentType("text/html");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('No existe esa persona embarazada.')");
            out.println("window.location.assign('PagsDoctor/Lista/Pacientes.jsp')");
            out.println("</script>");
        } else {
            HttpSession objSesion = request.getSession();
            String correoOrig = objSesion.getAttribute("loggedUser").toString();
            String id_usr_med = "";
            try {
                id_usr_med = act.BuscarSesion(correoOrig);
            } catch (Exception ex) {
                Logger.getLogger(SolicitudPem.class.getName()).log(Level.SEVERE, null, ex);
            }

            String id_medico = "";
            try {
                id_medico = act.BuscarDRUsuario(id_usr_med);
            } catch (Exception ex) {
                Logger.getLogger(SolicitudPem.class.getName()).log(Level.SEVERE, null, ex);
            }

            boolean mandado = false;
            boolean existe = false;
            try {
                existe = soli.ExisteSolicitud(id_persona, id_medico);
            } catch (Exception ex) {
                System.out.println("Error al buscar existencia de solicitud");
                Logger.getLogger(SolicitudPem.class.getName()).log(Level.SEVERE, null, ex);
            }

            if (existe) {
                System.out.println("entro 1");
                PrintWriter out = response.getWriter();
                response.setContentType("text/html");
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Ya enviaste solicitud a este usuario.')");
                out.println("window.location.assign('PagsPadre/Lista/Medicos.jsp')");
                out.println("</script>");

            }
            if (!existe) {
                try {
                    mandado = soli.mandarSoliMed(id_persona, id_medico);
                } catch (Exception ex) {
                    System.out.println("Error al mandar soli med");
                    Logger.getLogger(SolicitudPem.class.getName()).log(Level.SEVERE, null, ex);
                }
                if (mandado) {
                    System.out.println("entro 2");

                    PrintWriter out = response.getWriter();
                    /* TODO output your page here. You may use following sample code. */

                    response.setContentType("text/html");
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Solicitud enviada.')");
                    out.println("window.location.assign('PagsDoctor/Lista/Pacientes.jsp')");
                    out.println("</script>");

                } else {
                    System.out.println("entro 3");
                    PrintWriter out = response.getWriter();
                    /* TODO output your page here. You may use following sample code. */

                    response.setContentType("text/html");
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Ocurrió un error al mandar la solicitud.')");
                    out.println("window.location.assign('PagsDoctor/Lista/Pacientes.jsp')");
                    out.println("</script>");

                }
            }
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
