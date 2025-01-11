/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Controlador;

import com.Modelo.Mensaje;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.Enumeration;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
@MultipartConfig
@WebServlet(name = "ProcesarMensajes", urlPatterns = {"/ProcesarMensajes"})
public class ProcesarMensajes extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
        Mensaje ms = new Mensaje();
        request.setCharacterEncoding("UTF-8");

        String id_medico = request.getParameter("id_medico");
        String id_persona = request.getParameter("id_persona");
        String tipo_emisor = request.getParameter("tipo_emisor");
        String id_emisor = request.getParameter("id_emisor");
        String cont = request.getParameter("cont");
        
        System.out.println(cont);
        
        boolean guardado = false;
        try {
            if(id_medico != null && id_persona != null && tipo_emisor != null && id_emisor != null && cont != null){
                guardado = ms.nuevoMensaje(cont, id_emisor, tipo_emisor, id_persona, id_medico);
            }
        } catch (Exception ex) {
            Logger.getLogger(ProcesarMensajes.class.getName()).log(Level.SEVERE, null, ex);
            guardado = false;
        }
        
        if(guardado){
            response.setStatus(HttpServletResponse.SC_OK);
        } else{
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
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
