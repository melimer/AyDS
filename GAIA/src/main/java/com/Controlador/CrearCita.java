/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.Controlador;

import com.Modelo.Cita;
import com.Modelo.CitasCRUD;
import com.Modelo.DispMedico;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalTime;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author karlaviles
 */
@WebServlet(name = "CrearCita", urlPatterns = {"/CrearCita"})
public class CrearCita extends HttpServlet {

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
            out.println("<title>Servlet CrearCita</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CrearCita at " + request.getContextPath() + "</h1>");
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
        int id = Integer.parseInt(request.getParameter("id_med"));
        String action = request.getParameter("accion");
        if (action.equalsIgnoreCase("Registrar")) {
            try {
                int idDisponibilidad = Integer.parseInt(request.getParameter("idDisponibilidad"));
                int idPersona = Integer.parseInt(request.getParameter("idPersona"));
                int duracionConsulta = Integer.parseInt(request.getParameter("duracionConsulta"));
                String fecha = request.getParameter("fecha");
                CitasCRUD cita = new CitasCRUD();
                DispMedico disp=new DispMedico();
                disp.setIdDisp(idDisponibilidad);
                disp.setIdMed(id);
                Cita cit= new Cita();
                cit.setIdPersona(idPersona);
                cita.CrearCita(disp, duracionConsulta, cit, fecha);
                response.sendRedirect("PagsDoctor/Citas/CitasDoc.jsp");

            } catch (Exception e) {
                System.out.println(e);

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
