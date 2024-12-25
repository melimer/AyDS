/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Controlador;

import com.Modelo.ActsUser;
import com.Modelo.Foro;
import com.Modelo.ForosCRUD;
import com.Modelo.Usuario;
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
@WebServlet(name = "DirecForo", urlPatterns = {"/DirecForo"})
public class DirecForo extends HttpServlet {

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
            out.println("<title>Servlet DirecForo</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DirecForo at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("accion");
        if (action.equalsIgnoreCase("cambia")) {
            String id= request.getParameter("id");
            Foro f=new Foro();
            f.setIdTema(id);
            HttpSession objSesion = request.getSession();
                objSesion.setAttribute("idTema", id);
                response.sendRedirect("PagsPadre/Foros/Foros.jsp");
            
        }
        else if(action.equalsIgnoreCase("ver")){
            String idForo= request.getParameter("idForo");
            HttpSession objSesion = request.getSession();
                objSesion.setAttribute("idForo", idForo);
                response.sendRedirect("PagsPadre/Foros/VerForo.jsp");
        }
        else if(action.equalsIgnoreCase("responder")){
            String idMsg= request.getParameter("idMens");
            HttpSession objSesion = request.getSession();
                objSesion.setAttribute("idMsg", idMsg);
                response.sendRedirect("PagsPadre/Foros/Respuestas.html");
        }
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
        String action = request.getParameter("accion");
        ActsUser acts = new ActsUser();
        if (action.equalsIgnoreCase("Crear")) {
            try{
                String nomForo=request.getParameter("nomForo");
                String descrip=request.getParameter("descripcion");
                HttpSession objSesion = request.getSession();
                String user = objSesion.getAttribute("loggedUser").toString();
                Usuario usr = acts.Usuario(user);
                String apodo = usr.getApodo();
                String idTema=(String) objSesion.getAttribute("idTema");
                Foro fo=new Foro();
                fo.setNombreForo(nomForo);
                fo.setMsgPrincip(descrip);
                fo.setPersonaInici(apodo);
                fo.setIdTema(idTema);
            
                ForosCRUD crud=new ForosCRUD();
                crud.AltaForo(fo);
                response.sendRedirect("PagsPadre/Foros/Foros.jsp");
            }catch(Exception e){
                System.out.println(e);
            }
            
        }
        else if(action.equalsIgnoreCase("Responder")){
            try{
                HttpSession objSesion = request.getSession();
                String respuesta=request.getParameter("descrip");
                String idMsg=(String) objSesion.getAttribute("idMsg");
                String user = objSesion.getAttribute("loggedUser").toString();
                Usuario usr = acts.Usuario(user);
                String apodo = usr.getApodo();
                Foro fo=new Foro();
                fo.setId_msg(idMsg);
                fo.setReplica(respuesta);
                fo.setPersonRep(apodo);
                ForosCRUD crud=new ForosCRUD();
                crud.AltaReplica(fo);
                response.sendRedirect("PagsPadre/Foros/VerForo.jsp");
            }catch(Exception e){
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
