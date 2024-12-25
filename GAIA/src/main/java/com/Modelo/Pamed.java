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
public class Pamed extends Conexion {

    public String id_persona;
    public String id_medico;

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

    public ArrayList<Pamed> getPacientes(String id_medico) {
        ArrayList<Pamed> lista = new ArrayList<>();
        PreparedStatement ps;
        ResultSet rs;
        try {
            this.conectar();
            String sql = "Select * from pa_med where id_medico = ?;";
            ps = this.getCon().prepareStatement(sql);
            ps.setString(1, id_medico);
            rs = ps.executeQuery();
            while (rs.next()) {
                Pamed pa = new Pamed();
                pa.setId_medico(id_medico);
                pa.setId_persona(String.valueOf(rs.getInt("id_persona")));
                lista.add(pa);
            }
            return lista;
        } catch (Exception e) {
            System.out.println("Error al buscar solicitud: " + e.getMessage());

        }
        return lista;
    }

    public boolean eliminarPaciente(String id_paciente, String id_medico) throws Exception {
        boolean modif = false;
        PreparedStatement ps;
        ResultSet rs;
        int status = 0;
        try {
            this.conectar();
            String sql = "delete from pa_med where id_persona = ? and id_medico = ?;";
            String sql2 = "delete from solicitudes_med_pa where id_persona = ? and id_medico = ?;";
            String sql3 = "delete from solicitudes_pa_med where id_persona = ? and id_medico = ?;";
            ps = this.getCon().prepareStatement(sql);
            ps.setString(1, id_paciente);
            ps.setString(2, id_medico);
            status = ps.executeUpdate();
            if (status > 0) {
                System.out.println("Accion anterior eliminar paciente ejecutada con exito");
                ps = this.getCon().prepareStatement(sql2);
                ps.setString(1, id_paciente);
                ps.setString(2, id_medico);
                status = ps.executeUpdate();
                if (status >= 0) {
                    System.out.println("Accion anterior eliminar soli_med_pa ejecutada con exito");
                    ps = this.getCon().prepareStatement(sql3);
                    ps.setString(1, id_paciente);
                    ps.setString(2, id_medico);
                    status = ps.executeUpdate();
                    if (status >= 0) {
                        System.out.println("Accion anterior eliminar soli_pa_med ejecutada con exito");
                        modif = true;
                    }
                }
            }

        } catch (Exception e) {
            System.out.println("Error al eliminar paciente : " + e.getMessage());

        }
        return modif;
    }
    
    public ArrayList<Pamed> getMedicos(String id_persona) {
        ArrayList<Pamed> lista = new ArrayList<>();
        PreparedStatement ps;
        ResultSet rs;
        try {
            this.conectar();
            String sql = "Select * from pa_med where id_persona = ?;";
            ps = this.getCon().prepareStatement(sql);
            ps.setString(1, id_persona);
            rs = ps.executeQuery();
            while (rs.next()) {
                Pamed pa = new Pamed();
                pa.setId_medico(String.valueOf(rs.getInt("id_medico")));
                pa.setId_persona(id_persona);
                lista.add(pa);
            }
            return lista;
        } catch (Exception e) {
            System.out.println("Error al buscar solicitud: " + e.getMessage());

        }
        return lista;
    }

    public boolean eliminarMedico(String id_paciente, String id_medico) throws Exception {
        boolean modif = false;
        PreparedStatement ps;
        ResultSet rs;
        int status = 0;
        try {
            this.conectar();
            String sql = "delete from pa_med where id_persona = ? and id_medico = ?;";
            String sql2 = "delete from solicitudes_med_pa where id_persona = ? and id_medico = ?;";
            String sql3 = "delete from solicitudes_pa_med where id_persona = ? and id_medico = ?;";
            ps = this.getCon().prepareStatement(sql);
            ps.setString(1, id_paciente);
            ps.setString(2, id_medico);
            status = ps.executeUpdate();
            if (status > 0) {
                System.out.println("Accion anterior eliminar paciente ejecutada con exito");
                ps = this.getCon().prepareStatement(sql2);
                ps.setString(1, id_paciente);
                ps.setString(2, id_medico);
                status = ps.executeUpdate();
                if (status >= 0) {
                    System.out.println("Accion anterior eliminar soli_med_pa ejecutada con exito");
                    ps = this.getCon().prepareStatement(sql3);
                    ps.setString(1, id_paciente);
                    ps.setString(2, id_medico);
                    status = ps.executeUpdate();
                    if (status >= 0) {
                        System.out.println("Accion anterior eliminar soli_pa_med ejecutada con exito");
                        modif = true;
                    }
                }
            }

        } catch (Exception e) {
            System.out.println("Error al eliminar medico : " + e.getMessage());

        }
        return modif;
    }
}
