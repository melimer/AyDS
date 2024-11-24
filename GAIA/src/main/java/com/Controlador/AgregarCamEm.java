/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Controlador;

import com.Modelo.CamEmb;
import com.Modelo.CamEmbCRUD;
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
 */
@WebServlet(name = "AgregarCamEm", urlPatterns = {"/AgregarCamEm"})
public class AgregarCamEm extends HttpServlet {

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
            int id_padre = Integer.parseInt(request.getParameter("id_padre"));
            int diametro_p;

            String antojos, frecuencia_u, cambios_pdes, notas_ce, cambiosP;

            Boolean cambios_piel = false;

            antojos = request.getParameter("antojos");

            cambiosP = request.getParameter("cambios_piel");
            

            frecuencia_u = request.getParameter("frecuencia_u");

            cambios_pdes = request.getParameter("cambios_pdes");
            
            
            diametro_p = Integer.parseInt(request.getParameter("diametro_p"));

            notas_ce = request.getParameter("notas_ce");
            
            
            if(cambiosP == null){
                cambios_piel = false;
            }else if(cambiosP.equals("false")){
                cambios_piel = false;
            }else if(cambiosP.equals("true")){
                cambios_piel = true;
            }
            
            if(cambios_piel == true && cambios_pdes == null){
                cambios_pdes = "Hubieron cambios en la piel";
            }
            CamEmb c = new CamEmb();

            c.setId_padre(id_padre);

            c.setAntojos(antojos);

            c.setCambios_piel(cambios_piel);

            c.setFrecuencia_u(frecuencia_u);

            c.setCambios_pdes(cambios_pdes);

            c.setDiametro_p(diametro_p);

            c.setNotas_ce(notas_ce);

            CamEmbCRUD s = new CamEmbCRUD();

            try {

                int status = s.nuevoCambioEm(c);

                if (status > 0) {

                    response.sendRedirect("PagsPadre/Registros/Camb_emba.jsp");
                } else {
                    response.sendRedirect("PagsPadre/Registros/Camb_emba.jsp");

                }
            } catch (Exception ex) {

                Logger.getLogger(AgregarCamEm.class.getName()).log(Level.SEVERE, null, ex);
            }
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
        processRequest(request, response);
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
