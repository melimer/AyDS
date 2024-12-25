/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Controlador;

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

/**
 *
 * @author melisamercado
 */
@WebServlet(name = "ProcesarSolicitudes", urlPatterns = {"/ProcesarSolicitudes"})

public class ProcesarSolicitudes extends HttpServlet {

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
            out.println("<title>Servlet ProcesarSolicitudes</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProcesarSolicitudes at " + request.getContextPath() + "</h1>");
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
        String id_soli = request.getParameter("id_soli");
        //1 solicitud de pemba a medico, 2 solicitud de medico a pemba
        String tipo = request.getParameter("tipo_soli");
        String accion = request.getParameter("accion");

        if ("aceptar".equals(accion)) {
               //cambiar estado a 1 y agregar medico y paciente a tabla pa_med
               if(tipo.equals("1")){
                   //solicitud de pemba a medico, modif solicitudes_pa_med
                   SolicitudPadre solpa = new SolicitudPadre();
                   boolean aceptada = false;
                   try {
                       aceptada = solpa.solicitudAceptada(id_soli);
                   } catch (Exception ex) {
                       Logger.getLogger(ProcesarSolicitudes.class.getName()).log(Level.SEVERE, null, ex);
                   }
                   if(aceptada){
                        response.sendRedirect("PagsDoctor/Lista/Solicitudes.jsp");
                   }else{
                            PrintWriter out = response.getWriter();
                            response.setContentType("text/html");
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('Ocurrió un error al aceptar la solicitud.')");
                            out.println("window.location.assign('PagsDoctor/Lista/Solicitudes.jsp')");
                            out.println("</script>");
                   }
               }else{
                   //solicitud de medico a pemba, modif solicitudes_med_pa
                   SolicitudMedico solmed = new SolicitudMedico();
                   boolean aceptada = false;
                   try {
                       aceptada = solmed.solicitudAceptada(id_soli);
                   } catch (Exception ex) {
                       Logger.getLogger(ProcesarSolicitudes.class.getName()).log(Level.SEVERE, null, ex);
                   }
                   if(aceptada){
                        response.sendRedirect("PagsPadre/Lista/Solicitudes.jsp");
                   }else{
                            PrintWriter out = response.getWriter();
                            response.setContentType("text/html");
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('Ocurrió un error al aceptar la solicitud.')");
                            out.println("window.location.assign('PagsPadre/Lista/Solicitudes.jsp')");
                            out.println("</script>");
                   }
               }
        } else if ("rechazar".equals(accion)) {
                //borrar solicitud
                if(tipo.equals("1")){
                   SolicitudPadre solpa = new SolicitudPadre();
                   boolean rechazada = false;
                   try {
                       rechazada = solpa.solicitudRechazada(id_soli);
                   } catch (Exception ex) {
                       Logger.getLogger(ProcesarSolicitudes.class.getName()).log(Level.SEVERE, null, ex);
                   }
                   if(rechazada){
                        response.sendRedirect("PagsDoctor/Lista/Solicitudes.jsp");
                   }else{
                            PrintWriter out = response.getWriter();
                            response.setContentType("text/html");
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('Ocurrió un error al rechazar la solicitud.')");
                            out.println("window.location.assign('PagsDoctor/Lista/Solicitudes.jsp')");
                            out.println("</script>");
                   }
               }else{
                    SolicitudMedico solmed = new SolicitudMedico();
                   boolean rechazada = false;
                   try {
                       rechazada = solmed.solicitudRechazada(id_soli);
                   } catch (Exception ex) {
                       Logger.getLogger(ProcesarSolicitudes.class.getName()).log(Level.SEVERE, null, ex);
                   }
                   if(rechazada){
                        response.sendRedirect("PagsPadre/Lista/Solicitudes.jsp");
                   }else{
                            PrintWriter out = response.getWriter();
                            response.setContentType("text/html");
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('Ocurrió un error al rechazar la solicitud.')");
                            out.println("window.location.assign('PagsPadre/Lista/Solicitudes.jsp')");
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
