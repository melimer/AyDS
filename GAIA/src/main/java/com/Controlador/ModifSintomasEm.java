/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Controlador;

import com.Modelo.ActsUser;
import com.Modelo.Sintomas;
import com.Modelo.SintomasCRUD;
import com.Modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 */
public class ModifSintomasEm extends HttpServlet {

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
            out.println("<title>Servlet ModifSintomasEm</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ModifSintomasEm at " + request.getContextPath() + "</h1>");
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
        Sintomas sin = new Sintomas();

        boolean nauseasF = true;
        boolean fatigaF = true;
        boolean senosF = true;
        boolean hinchazonF = true;
        boolean constiF = true;
        boolean dolorF = true;
        boolean vomitoF = true;
        boolean calambresF = true;
        boolean sangradoF = true;
        boolean felizF = true;
        boolean trisF = true;
        boolean sensibleF = true;
        boolean disgustoF = true;
        boolean iraF = true;
        boolean angusF = true;
        boolean confuF = true;
        boolean tranquiloF = true;

        String id = request.getParameter("id_padre");
        String id_sintomas = request.getParameter("id_sintomas");
        String fatiga = request.getParameter("fatiga");
        String vomito = request.getParameter("vomito");
        String dolor = request.getParameter("dolorCa");
        String notas = request.getParameter("notas");
        String senos = request.getParameter("senos");
        String nauseas = request.getParameter("nauseas");
        String hinch = request.getParameter("hinchazon");
        String calambre = request.getParameter("calambre");
        String constipa = request.getParameter("constipa");
        String sangre = request.getParameter("sangre");
        String feliz = request.getParameter("feliz");
        String triste = request.getParameter("triste");
        String disgus = request.getParameter("disgus");
        String sensi = request.getParameter("sensible");
        String ira = request.getParameter("enojo");
        String angus = request.getParameter("angus");
        String confu = request.getParameter("confu");
        String tranqui = request.getParameter("tranqui");
        if (nauseas == null) {
            nauseasF = false;
        }
        if (dolor == null) {
            dolorF = false;
        }
        if (vomito == null) {
            vomitoF = false;
        }
        if (senos == null) {
            senosF = false;
        }
        if (hinch == null) {
            hinchazonF = false;
        }
        if (calambre == null) {
            calambresF = false;
        }
        if (sangre == null) {
            sangradoF = false;
        }
        if (constipa == null) {
            constiF = false;
        }

        if (feliz == null) {
            felizF = false;
        }
        if (triste == null) {
            trisF = false;
        }
        if (disgus == null) {
            disgustoF = false;
        }
        if (sensi == null) {
            sensibleF = false;
        }
        if (ira == null) {
            iraF = false;
        }
        if (angus == null) {
            angusF = false;
        }
        if (confu == null) {
            confuF = false;
        }
        if (tranqui == null) {
            tranquiloF = false;
        }
        if (fatiga == null) {
            fatigaF = false;
        }
        sin.setId_padre(id);
        sin.setId(id_sintomas);
        sin.setAngustia(angusF);
        sin.setCalambres(calambresF);
        sin.setConfusion(confuF);
        sin.setConstipacion(constiF);
        sin.setDisgusto(disgustoF);
        sin.setFatiga(fatigaF);
        sin.setFeliz(felizF);
        sin.setHinchazon(hinchazonF);
        sin.setIra(iraF);
        sin.setSangrado(sangradoF);
        sin.setSe_sensible(senosF);
        sin.setSensible(sensibleF);
        sin.setDolor(dolorF);
        sin.setVomito(vomitoF);
        sin.setNotas(notas);
        sin.setNauseas(nauseasF);
        sin.setTriste(trisF);
        sin.setTranquilidad(tranquiloF);

        try {
            SintomasCRUD sintomascrud = new SintomasCRUD();
            int status = sintomascrud.Cambios(sin);
             if (status > 0) {
                    System.out.println("Cambio actualizado");
                    response.sendRedirect("PagsPadre/Registros/Sintomas.jsp");
                } else {
                    System.out.println("fallos al actualizar cambio");
                    response.sendRedirect("PagsPadre/Registros/Sintomas.jsp");

                }
        } catch (Exception ex) {
            Logger.getLogger(ModifSintomasEm.class.getName()).log(Level.SEVERE, null, ex);
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
