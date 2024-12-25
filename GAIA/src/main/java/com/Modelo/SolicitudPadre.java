/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Modelo;

import com.Conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author melisamercado
 */
public class SolicitudPadre extends Conexion{

    
    String id_soli_pa, id_persona, id_medico;
    int estado;
    
    public String getId_soli_pa() {
        return id_soli_pa;
    }

    public void setId_soli_pa(String id_soli_pa) {
        this.id_soli_pa = id_soli_pa;
    }

    public String getId_persona() {
        return id_persona;
    }

    public void setId_persona(String id_persona) {
        this.id_persona = id_persona;
    }

    public String getId_medico() {
        return id_medico;
    }

    public void setId_medico(String id_medico) {
        this.id_medico = id_medico;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }
    
    
        
 public boolean mandarSoliPadre(String id_persona, String id_medico) throws Exception {
        boolean mandado = false;
        PreparedStatement ps;
        ResultSet rs;
        int status = 0;
        try {
            this.conectar();
            String sql = "INSERT into solicitudes_pa_med (id_soli_pa, id_persona, id_medico, estado) values(default, ?, ?, 0);";
            ps = this.getCon().prepareStatement(sql);
            ps.setString(1, id_persona);
            ps.setString(2, id_medico);
            status = ps.executeUpdate();
            if (status > 0) {
                System.out.println("Accion anterior mandar soli padre ejecutada con exito");
                mandado = true;
            }
        } catch (Exception e) {
            System.out.println("Error al agregar la solicitud padre: " + e.getMessage());

        }
        return mandado;
    }
 
    public boolean ExisteSolicitud(String id_persona, String id_medico) throws Exception {
        boolean existe = false;
        PreparedStatement ps;
        ResultSet rs;
        int status = 0;
        try {
            this.conectar();
            String sql = "Select * from solicitudes_pa_med where id_persona = ? and id_medico = ?;";
            ps = this.getCon().prepareStatement(sql);
            ps.setString(1, id_persona);
            ps.setString(2, id_medico);
             rs = ps.executeQuery();
            if (rs.next()) {
                System.out.println("existe solicitud");
                existe = true;
            }
        } catch (Exception e) {
            System.out.println("Error al buscar solicitud: " + e.getMessage());

        }
        return existe;
    }
    
    
    public ArrayList<SolicitudMedico> SolicitudesRecibidas(String id_persona){
       ArrayList<SolicitudMedico> lista= new ArrayList<>();
        PreparedStatement ps;
        ResultSet rs;
        try {
            this.conectar();
            String sql = "Select * from solicitudes_med_pa where id_persona = ? and estado = 0;";
            ps = this.getCon().prepareStatement(sql);
            ps.setString(1, id_persona);
             rs = ps.executeQuery();
            while (rs.next()) {
                SolicitudMedico sol = new SolicitudMedico();
                sol.setId_soli_med(String.valueOf(rs.getInt("id_soli_med")));
                sol.setId_medico(String.valueOf(rs.getInt("id_medico")));
                sol.setId_persona(String.valueOf(rs.getInt("id_persona")));
                sol.setEstado(rs.getInt("estado"));
                lista.add(sol);
            }
            return lista;
        } catch (Exception e) {
            System.out.println("Error al buscar solicitud: " + e.getMessage());

        }
       return lista;
    }
    
    
            
 public boolean solicitudAceptada(String id_solicitud) throws Exception {
        boolean modif = false;
        PreparedStatement ps;
        ResultSet rs;
        int status = 0;
        try {
            this.conectar();
            String sql = "update solicitudes_pa_med set estado = 3 where id_soli_pa = ?;";
            String sql2 = "select * from solicitudes_pa_med where id_soli_pa = ?;";
            String sql3 = "insert into pa_med (id_persona, id_medico) values (?, ?)";
            ps = this.getCon().prepareStatement(sql);
            ps.setString(1, id_solicitud);
            status = ps.executeUpdate();
            if (status > 0) {
                System.out.println("Accion anterior aceptar soli pa_,ed ejecutada con exito");
                ps = this.getCon().prepareStatement(sql2);
                ps.setString(1, id_solicitud);
                rs = ps.executeQuery();
                while(rs.next()){
                    String id_persona = rs.getString("id_persona");
                    String id_medico = rs.getString("id_medico");
                     ps = this.getCon().prepareStatement(sql3);            
                     ps.setString(1, id_persona);      
                     ps.setString(2, id_medico);
                     status = ps.executeUpdate();
                     if(status > 0){
                        modif = true;
                     }
                }
            }
            
        } catch (Exception e) {
            System.out.println("Error al aceptar soli pa_,ed: " + e.getMessage());

        }
        return modif;
    }
 
  public boolean solicitudRechazada(String id_solicitud) throws Exception {
        boolean modif = false;
        PreparedStatement ps;
        ResultSet rs;
        int status = 0;
        try {
            this.conectar();
            String sql = "delete from solicitudes_pa_med where id_soli_pa = ?;";
            ps = this.getCon().prepareStatement(sql);
            ps.setString(1, id_solicitud);
            status = ps.executeUpdate();
            if (status > 0) {
                System.out.println("Accion anterior rechazar soli pa_med ejecutada con exito");
                modif = true;
            }
            
        } catch (Exception e) {
            System.out.println("Error al rechazar soli pa_med: " + e.getMessage());

        }
        return modif;
    }
}
