/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.Controlador;

import com.Modelo.ActsUser;
import com.Modelo.CitasCRUD;
import com.Modelo.DispMedico;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author karlaviles
 */
@WebServlet(name = "Citas", urlPatterns = {"/Citas"})
public class Citas extends HttpServlet {

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
            out.println("<title>Servlet Citas</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Citas at " + request.getContextPath() + "</h1>");
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
        ActsUser acts = new ActsUser();
        if (action.equalsIgnoreCase("Finalizar")) {
            try {

                int i = 0;
                while (true) {

                    String day = request.getParameter("schedules[" + i + "][day]");
                    String horaInicio = request.getParameter("schedules[" + i + "][startTime]");
                    String horaFin = request.getParameter("schedules[" + i + "][endTime]");
                    //String lugar = request.getParameter("schedules[" + i + "][lugar]");
                    String estado = request.getParameter("schedules[" + i + "][estado]");
                    String municipio = request.getParameter("schedules[" + i + "][municipio]");
                    if (day == null) {
                        break; // No hay más horarios
                    }
                    String colonia = request.getParameter("schedules[" + i + "][col]");
                    String calle = request.getParameter("schedules[" + i + "][calle]");
                    int numeroExt = Integer.parseInt(request.getParameter("schedules[" + i + "][numExt]"));
                    Integer numeroInt = (request.getParameter("schedules[" + i + "][numInt]") == null
                            || request.getParameter("schedules[" + i + "][numInt]").isEmpty()) ? null : Integer.valueOf(request.getParameter("schedules[" + i + "][numInt]"));

                    String unidadMedica = request.getParameter("schedules[" + i + "][uniMed]");

                    
                    DispMedico dm = new DispMedico();
                    dm.setCalle(calle);
                    dm.setColonia(colonia);
                    dm.setDia(day);
                    dm.setEstado(estado);
                    dm.setHoraFin(horaFin);
                    dm.setHoraInicio(horaInicio);
                    dm.setIdMed(id);
                    dm.setMunicipio(municipio);
                    dm.setNumeroExt(numeroExt);
                    dm.setNumeroInt(numeroInt);
                    dm.setUnidadMedica(unidadMedica);
                    dm.setIdMed(id);
                    CitasCRUD ct = new CitasCRUD();
                    ct.CrearHorarios(dm);
                    i++;
                    
                }
                
                HttpSession objSesion = request.getSession();
        objSesion.setAttribute("idMed", id);
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
