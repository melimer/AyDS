/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Controlador;

import com.Modelo.ActsUser;
import com.Modelo.CamEmb;
import com.Modelo.CamEmbCRUD;
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
 *¡
 */
public class ModifCamEm extends HttpServlet {

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
            out.println("<title>Servlet ModifCamEm</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ModifCamEm at " + request.getContextPath() + "</h1>");
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
              HttpSession objSesion = request.getSession();
              
        String correoOrig = objSesion.getAttribute("loggedUser").toString();
        String nombre = request.getParameter("nombre");
        String apodo = request.getParameter("apodo");
        String correo = request.getParameter("user_mail");
        ActsUser act=new ActsUser();
        Usuario user=new Usuario();
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

            c.setId_padre(Integer.parseInt(request.getParameter("id_padre"))); 
            c.setId_cam_emba(Integer.parseInt(request.getParameter("id_cam_emba")));
            c.setAntojos(antojos);
            c.setCambios_piel(cambios_piel);
            c.setFrecuencia_u(frecuencia_u);
            c.setCambios_pdes(cambios_pdes);
            c.setDiametro_p(diametro_p);
            c.setNotas_ce(notas_ce);
            CamEmbCRUD s = new CamEmbCRUD();
        try {
            
             int status = s.modifCambioEm(c);

                if (status > 0) {
                    System.out.println("Cambio actualizado");
                    response.sendRedirect("PagsPadre/Registros/Camb_emba.jsp");
                } else {
                    System.out.println("fallos al actualizar cambio");
                    response.sendRedirect("PagsPadre/Registros/Camb_emba.jsp");

                }
        } catch (Exception ex) {
            Logger.getLogger(ModifCamEm.class.getName()).log(Level.SEVERE, null, ex);
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
