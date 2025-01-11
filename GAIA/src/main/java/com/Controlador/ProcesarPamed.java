/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Controlador;

import com.Modelo.Pamed;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author melisamercado
 */
public class ProcesarPamed extends HttpServlet {

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
            out.println("<title>Servlet ProcesarPamed</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProcesarPamed at " + request.getContextPath() + "</h1>");
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
        String id_medico = request.getParameter("id_medico");
        String id_persona = request.getParameter("id_persona");
        String accion = request.getParameter("accion");
        //1-medico 2-persona emba
        String tipo_usr = request.getParameter("tipo_usr");

        if (tipo_usr.equals("1")) {
            //es medico
            if ("ver".equals(accion)) {
                response.sendRedirect("PagsDoctor/Pacientes/MenuPacientes.jsp?id="+id_persona);
            } else if ("eliminar".equals(accion)) {
                Pamed pa = new Pamed();
                boolean eliminado = false;
                try {
                    eliminado = pa.eliminarPaciente(id_persona, id_medico);
                } catch (Exception ex) {
                    Logger.getLogger(ProcesarPamed.class.getName()).log(Level.SEVERE, null, ex);
                }
                if (eliminado) {
                    response.sendRedirect("PagsDoctor/Lista/Pacientes.jsp");
                } else {
                    PrintWriter out = response.getWriter();
                    response.setContentType("text/html");
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Ocurrió un error al eliminar el paciente.')");
                    out.println("window.location.assign('PagsDoctor/Lista/Pacientes.jsp')");
                    out.println("</script>");
                }
            }
        } else {
            //es persona emb, solo puede eliminar
            if ("eliminar".equals(accion)) {
                Pamed pa = new Pamed();
                boolean eliminado = false;
                try {
                    eliminado = pa.eliminarPaciente(id_persona, id_medico);
                } catch (Exception ex) {
                    Logger.getLogger(ProcesarPamed.class.getName()).log(Level.SEVERE, null, ex);
                }
                if (eliminado) {
                    response.sendRedirect("PagsPadre/Lista/Medicos.jsp");
                } else {
                    PrintWriter out = response.getWriter();
                    response.setContentType("text/html");
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Ocurrió un error al eliminar el médico.')");
                    out.println("window.location.assign('PagsPadre/Lista/Medicos.jsp')");
                    out.println("</script>");
                }
            }else{
                PrintWriter out = response.getWriter();
                    response.setContentType("text/html");
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Ocurrió un error al realizar la acción.')");
                    out.println("window.location.assign('PagsPadre/Lista/Medicos.jsp')");
                    out.println("</script>");
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
