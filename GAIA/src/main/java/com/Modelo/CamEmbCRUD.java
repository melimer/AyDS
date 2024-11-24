/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Modelo;


import com.Conexion.Conexion;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CamEmbCRUD extends Conexion{
    public int nuevoCambioEm(CamEmb c) throws Exception{
        int status = 0;
        PreparedStatement ps;
        ResultSet rs;
        int id_cam_emba = 0, id_reg = 0 ;
        try {
            this.conectar();
            String sql = "INSERT into cam_emba (id_cam_emba, antojos, cambios_piel, frecuencia_u, cambios_pdes, diametro_p, notas_ce) values(default, ?, ?, ?, ?, ?, ?)";
            String sql2 = "SELECT last_insert_id()";
            String sql3 = "INSERT into registros (id_registro, fecha_regis) values (default, now())";
            String sql4 = "INSERT into regis_ca_emba (id_cam_emba, id_registro) values (?, ?)";
            String sql5 = "INSERT into pe_registro (id_persona, id_registro) values (?, ?)";

            if (status == 0) {
                ps = this.getCon().prepareStatement(sql);
                ps.setString(1, c.getAntojos());
                ps.setBoolean(2, c.getCambios_piel());
                ps.setString(3, c.getFrecuencia_u());
                ps.setString(4, c.getCambios_pdes());
                ps.setInt(5, c.getDiametro_p());
                ps.setString(6, c.getNotas_ce());
                status = ps.executeUpdate();
                if (status > 0) {
                    System.out.println("Accion anterior ejecutada con exito");
                    status = 0;
                    ps = this.getCon().prepareStatement(sql2);
                    rs = ps.executeQuery();
                    while (rs.next()) {
                        id_cam_emba = rs.getInt(1);
                    }
                    System.out.println("ID cambioEm obtenido: " + Integer.toString(id_cam_emba));
                    status = 1;
                    if (status > 0) {
                        System.out.println("Accion anterior ejecutada con exito 2");
                        status = 0;
                        ps = this.getCon().prepareStatement(sql3);
                        /*aqui es donde va la hora y todo eso, no olvidarrrrr*/
                        status = ps.executeUpdate();
                    }
                    if (status > 0) {
                        System.out.println("Accion anterior ejecutada con exito 3");
                        status = 0;
                        ps = this.getCon().prepareStatement(sql2);
                        rs = ps.executeQuery();
                        while (rs.next()) {
                            id_reg = rs.getInt(1);
                        }
                        System.out.println("ID reg obtenido: " + Integer.toString(id_reg));
                        status = 1;
                    }
                    if(status > 0){
                        System.out.println("Accion anterior ejecutada con exito 4");
                        status = 0;
                        ps = this.getCon().prepareStatement(sql4);
                        ps.setInt(1, id_cam_emba);
                        ps.setInt(2, id_reg);
                        status = ps.executeUpdate();
                    }
                    if(status > 0){
                        System.out.println("Accion anterior ejecutada con exito 5");
                        status = 0;
                        ps = this.getCon().prepareStatement(sql5);
                        ps.setInt(1, c.getId_padre());
                        ps.setInt(2, id_reg);
                        status = ps.executeUpdate();
                    }
                }
            }
            
            System.out.println("Resgistro exitoso del cambio embarazo");
            System.out.println("Diametro panza: " + c.getDiametro_p());
            this.desconectar();
            
        } catch (Exception e) {
            System.out.println("Error al agregar el cambioEm: " + e.getMessage());
        }
        return status;
    }
    
    public int modifCambioEm (CamEmb c) throws Exception{
        int status = 0;
        try {
            this.conectar();
            String sql = "UPDATE cam_emba set antojos = ?, cambios_piel = ?, frecuencia_u = ?, cambios_pdes = ?, diametro_p = ?, notas_ce = ?"
                       + "WHERE id_cam_emba = ?";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ps.setString(1, c.getAntojos());
            ps.setBoolean(2, c.getCambios_piel());
            ps.setString(3, c.getFrecuencia_u());
            ps.setString(4, c.getCambios_pdes());
            ps.setInt(5, c.getDiametro_p());
            ps.setString(6, c.getNotas_ce());
            ps.setInt(7, c.getId_cam_emba());
            status = ps.executeUpdate();
            System.out.println("Modfiicación exitosa");
            System.out.println("ID: " + c.getId_cam_emba());
            this.desconectar();
            
        } catch (Exception e) {
            System.out.println("Error al modificar el cambio embarazo: " + e.getMessage());
        }
        return status;
    }
    
    public int borrarCambioEm(int id) throws Exception {
        int status = 0;
        PreparedStatement ps;
        ResultSet rs;
        int id_reg = 0;
        try {
            this.conectar();
            String sql = "SELECT registros.id_registro from registros INNER JOIN regis_ca_emba ON registros.id_registro = regis_ca_emba.id_registro "
                    + "INNER JOIN cam_emba ON cam_emba.id_cam_emba = regis_ca_emba.id_cam_emba WHERE cam_emba.id_cam_emba = ?";
            String sql2 = "DELETE from cam_emba WHERE id_cam_emba = ?";
            String sql3 = "DELETE from registros WHERE id_registro = ?";
            if (status == 0) {
                ps = this.getCon().prepareStatement(sql);
                ps.setInt(1, id);
                rs = ps.executeQuery();
                while (rs.next()) {                    
                    id_reg = rs.getInt(1);
                }
                System.out.println("ID regis obtenido : " + Integer.toString(id_reg));
                System.out.println("ID pag : " + Integer.toString(id));
                if (id_reg != 0) {
                    status = 1;
                } else {
                    System.out.println("ID no obtenido");
                }

                if (status > 0) {
                    System.out.println("Accion anterior ejecutada con exito 2");
                    status = 0;
                    ps = this.getCon().prepareStatement(sql2);
                    ps.setInt(1, id);
                    status = ps.executeUpdate();
                    System.out.println("Registro borrado de cam_emba");

                    if (status > 0) {
                        System.out.println("Accion anterior ejecutada con exito 3");
                        status = 0;
                        ps = this.getCon().prepareStatement(sql3);
                        ps.setInt(1, id_reg);
                        status = ps.executeUpdate();
                        System.out.println("Registro borrado de registros");
                    }
                }
                System.out.println("Eliminación exitosa");
            }

            this.desconectar();

        } catch (Exception e) {
            System.out.println("Error al borrar la cita: " + e.getMessage());
        }
        return status;
    }

    public CamEmb buscarCambioEm (int id) throws Exception{
        CamEmb c = new CamEmb();
        try {
            this.conectar();
            String sql = "SELECT * from cam_emba WHERE id_cam_emba = ?";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ps.setInt(1, id);
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                c.setId_cam_emba(rs.getInt(1));
                c.setAntojos(rs.getString(2));
                c.setCambios_piel(rs.getBoolean(3));
                c.setFrecuencia_u(rs.getString(4));
                c.setCambios_pdes(rs.getString(5));
                c.setDiametro_p(rs.getInt(6));
                c.setNotas_ce(rs.getString(7));
            }
            
            System.out.println("Información encontrada");
            System.out.println("Diametro panza: " + c.getDiametro_p());
            this.desconectar();
            
        } catch (Exception e) {
            System.out.println("Error al buscar cambioEm: " + e.getMessage());
        }
        return c;
    }
    
    public ArrayList<CamEmb> todosCambiosEm(int id_persona) {
        ArrayList<CamEmb> lista = new ArrayList<CamEmb>();
        PreparedStatement ps, ps2;
        ResultSet rs, rs2;
        int id_cam_emba = 0;
        Date d;
        try {
            this.conectar();
            String sql = "SELECT * from cam_emba INNER JOIN regis_ca_emba ON cam_emba.id_cam_emba = regis_ca_emba.id_cam_emba "
                    + "INNER JOIN registros ON registros.id_registro = regis_ca_emba.id_registro INNER JOIN pe_registro "
                    + "ON registros.id_registro = pe_registro.id_registro WHERE pe_registro.id_persona = ?";
            String sql2 = "SELECT registros.fecha_regis from registros INNER JOIN regis_ca_emba ON registros.id_registro = regis_ca_emba.id_registro "
                    + "INNER JOIN cam_emba ON cam_emba.id_cam_emba = regis_ca_emba.id_cam_emba WHERE cam_emba.id_cam_emba = ?";
            ps = this.getCon().prepareStatement(sql);
            ps2 = this.getCon().prepareStatement(sql2);
            ps.setInt(1, id_persona);
            rs = ps.executeQuery();

            while (rs.next()) {
                CamEmb c = new CamEmb();
                c.setId_cam_emba(rs.getInt("id_cam_emba"));
                c.setAntojos(rs.getString("antojos"));
                c.setCambios_piel(rs.getBoolean("cambios_piel"));
                c.setFrecuencia_u(rs.getString("frecuencia_u"));
                c.setCambios_pdes(rs.getString("cambios_pdes"));
                c.setDiametro_p(rs.getInt("diametro_p"));
                c.setNotas_ce(rs.getString("notas_ce"));
                id_cam_emba = c.getId_cam_emba();
                System.out.println("ID del cambio: " + id_cam_emba);
                ps2.setInt(1, id_cam_emba);
                rs2 = ps2.executeQuery();
                if (rs2.next()) {
                    d = rs2.getDate("fecha_regis");
                    c.setFecha_cam_em(d);
                    System.out.println("Fecha obtenida: " + d);
                    lista.add(c);
                }
            }

            System.out.println("Registros encontrados");
            this.desconectar();

        } catch (Exception e) {
            System.out.println("Error al buscar los registros " + e.getMessage());
        }
        return lista;
    }
}
