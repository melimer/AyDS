/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Controlador;

import com.Modelo.ActsUser;
import com.Modelo.Sintomas;
import com.Modelo.SintomasCRUD;
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
 */
@WebServlet(name = "SintomasEm", urlPatterns = {"/SintomasEm"})
public class SintomasEm extends HttpServlet {
Sintomas sin = new Sintomas();
    SintomasCRUD sinDAO;
    public SintomasEm() throws ClassNotFoundException {
        this.sinDAO = new SintomasCRUD();
    }
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
            out.println("<title>Servlet SintomasEm</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SintomasEm at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String acceso = "";
        String action = request.getParameter("accion");
         if (action.equalsIgnoreCase("elimina")) {
            String id = request.getParameter("id");
                sinDAO.Eliminar(id);
            acceso="PagsPadre/Registros/Sintomas.jsp";
            
        }
        
        response.sendRedirect("PagsPadre/Registros/Sintomas.jsp");
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
        String acceso = "PagsPadre/Registros/Sintomas.jsp";
        String action = request.getParameter("accion");
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
        if (action.equalsIgnoreCase("Registrar")) {
            try {
                ActsUser act = new ActsUser();
                String id = request.getParameter("id_padre");
                String fatiga=request.getParameter("fatiga");
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
                if(fatiga==null){
                    fatigaF=false;
                }
                sin.setId_padre(id);
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
                sinDAO.Altas(sin);
                System.out.println("idpader " + id);
                
            } catch (Exception e) {
                System.out.println(e.toString() + "eeep");
            }
            
            
        }
        
        response.sendRedirect("PagsPadre/Registros/Sintomas.jsp");
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
