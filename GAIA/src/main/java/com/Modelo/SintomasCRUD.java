/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Modelo;

import com.Conexion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class SintomasCRUD extends Conexion{

    Conexion cn;
    Connection con;
    PreparedStatement st;
    ResultSet rs;
    Sintomas sin = new Sintomas();
    String idSin = "";
    String idRes = "";
    boolean exist;
    
    

    public SintomasCRUD() throws ClassNotFoundException {
        this.cn = new Conexion();
    }

    /*public boolean Altas(Sintomas sin, String idPadre) {
        String sql3 = "insert into regis_sintoma(id_sintomas, id_registro) values(?,?)";
        String sql4 = "select registros.id_registro from registros inner join pe_registro on registros.id_registro=pe_registro.id_registro where pe_registro.id_persona=? "
                + "and registros.fecha_regis=curdate()";
        String sql2 = "insert into sintomas(id_sintomas, dolor_ca, vomito, fatiga, nauseas, se_sensible, "
                + "hinchazon, constipacion, calambres, sangrado, feliz, triste, sensible, ira, angustia, "
                + "confusion, tranquilidad, disgusto, notas_s) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        String sql = "insert into registros(id_registro, fecha_regis) values(?,now())";
        String sql5 = "insert into pe_registro values (?,?)";
        boolean rowInserted = false;

        try {

            this.conectar();

            st = this.getCon().prepareStatement(sql2);
            st.setString(1, null);
            st.setBoolean(2, sin.getDolor());
            st.setBoolean(3, sin.getVomito());
            st.setBoolean(4, sin.getFatiga());
            st.setBoolean(5, sin.getNauseas());
            st.setBoolean(6, sin.getSe_sensible());
            st.setBoolean(7, sin.getHinchazon());
            st.setBoolean(8, sin.getConstipacion());
            st.setBoolean(9, sin.getCalambres());
            st.setBoolean(10, sin.getSangrado());
            st.setBoolean(11, sin.getFeliz());
            st.setBoolean(12, sin.getTriste());
            st.setBoolean(13, sin.getSensible());
            st.setBoolean(14, sin.getIra());
            st.setBoolean(15, sin.getAngustia());
            st.setBoolean(16, sin.getConfusion());
            st.setBoolean(17, sin.getTranquilidad());
            st.setBoolean(18, sin.getDisgusto());
            st.setString(19, sin.getNotas());
            rowInserted = st.executeUpdate() > 0;

            st = this.getCon().prepareStatement("select last_insert_id()");
            rs = st.executeQuery();

            while (rs.next()) {
                idSin = rs.getString(1);
            }
            

            st =this.getCon().prepareStatement(sql4);
            st.setString(1, idPadre);
            rs = st.executeQuery();
            exist = rs.next();
            

            if (exist == true) {

                st =this.getCon().prepareStatement(sql4);
                st.setString(1, idPadre);
                rs = st.executeQuery();
                while (rs.next()) {
                    idRes = rs.getString(1);
                    

                }
                st =this.getCon().prepareStatement(sql3);
                st.setString(1, idSin);
                st.setString(2, idRes);
                rowInserted = st.executeUpdate() > 0;

            } else {
                st =this.getCon().prepareStatement(sql);
                st.setString(1, null);
                rowInserted = st.executeUpdate() > 0;
                
                st = this.getCon().prepareStatement("select last_insert_id()");
                rs = st.executeQuery();
                while (rs.next()) {
                    idRes = rs.getString(1);
                }
                System.out.println(idRes);
                st =this.getCon().prepareStatement(sql3);
                st.setString(1, idSin);
                st.setString(2, idRes);
                rowInserted = st.executeUpdate() > 0;

                System.out.println(idPadre);
                st =this.getCon().prepareStatement(sql5);
                st.setString(1, idPadre);
                st.setString(2, idRes);
                rowInserted = st.executeUpdate() > 0;
            }
            this.desconectar();
            
        } catch (Exception e) {
            System.out.println(e.toString() + " hello");

        }
        return rowInserted;
    }*/
    
    public int Altas(Sintomas sin) throws Exception{
        int status = 0;
        PreparedStatement ps;
        ResultSet rs;
        int id_sin = 0, id_reg = 0 ;
        try {
            this.conectar();
            String sql = "insert into sintomas(id_sintomas, dolor_ca, vomito, fatiga, nauseas, se_sensible, "
                + "hinchazon, constipacion, calambres, sangrado, feliz, triste, sensible, ira, angustia, "
                + "confusion, tranquilidad, disgusto, notas_s) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            String sql2 = "SELECT last_insert_id()";
            String sql3 = "INSERT into registros (id_registro, fecha_regis) values (default, now())";
            String sql4 = "insert into regis_sintoma(id_sintomas, id_registro) values(?,?)";
                String sql5 = "INSERT into pe_registro (id_persona, id_registro) values (?, ?)";

            if (status == 0) {
                st = this.getCon().prepareStatement(sql);
                st.setString(1, null);
                st.setBoolean(2, sin.getDolor());
                st.setBoolean(3, sin.getVomito());
                st.setBoolean(4, sin.getFatiga());
                st.setBoolean(5, sin.getNauseas());
                st.setBoolean(6, sin.getSe_sensible());
                st.setBoolean(7, sin.getHinchazon());
                st.setBoolean(8, sin.getConstipacion());
                st.setBoolean(9, sin.getCalambres());
                st.setBoolean(10, sin.getSangrado());
                st.setBoolean(11, sin.getFeliz());
                st.setBoolean(12, sin.getTriste());
                st.setBoolean(13, sin.getSensible());
                st.setBoolean(14, sin.getIra());
                st.setBoolean(15, sin.getAngustia());
                st.setBoolean(16, sin.getConfusion());
                st.setBoolean(17, sin.getTranquilidad());
                st.setBoolean(18, sin.getDisgusto());
                st.setString(19, sin.getNotas());
                status = st.executeUpdate();
                
                if (status > 0) {
                    System.out.println("Accion anterior ejecutada con exito");
                    status = 0;
                    ps = this.getCon().prepareStatement(sql2);
                    rs = ps.executeQuery();
                    while (rs.next()) {
                        id_sin = rs.getInt(1);
                    }
                    System.out.println("ID sintoma obtenido: " + Integer.toString(id_sin));
                    status = 1;
                    if (status > 0) {
                        System.out.println("Accion anterior ejecutada con exito 2");
                        status = 0;
                        ps = this.getCon().prepareStatement(sql3);
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
                        ps.setInt(1, id_sin);
                        ps.setInt(2, id_reg);
                        status = ps.executeUpdate();
                    }
                    if(status > 0){
                        System.out.println("Accion anterior ejecutada con exito 5");
                        status = 0;
                        ps = this.getCon().prepareStatement(sql5);
                        ps.setString(1, sin.getId_padre());
                        ps.setInt(2, id_reg);
                        status = ps.executeUpdate();
                    }
                }
            }
            
            System.out.println("Resgistro exitoso del sintoma");
            this.desconectar();
            
        } catch (Exception e) {
            System.out.println("Error al agregar el sintoma: " + e.getMessage() + e.toString());
        }
        return status;
    }

    public ArrayList ConsultaTotal(String idPadre) {
        ArrayList<Sintomas> list = new ArrayList();
        String sql = "select * from sintomas inner join regis_sintoma on sintomas.id_sintomas=regis_sintoma.id_sintomas inner join "
                + "registros on registros.id_registro=regis_sintoma.id_registro inner join pe_registro on registros.id_registro=pe_registro.id_registro "
                + "where pe_registro.id_persona=?";

        try {
            
            this.conectar();
            st = this.getCon().prepareStatement(sql);
            st.setString(1, idPadre);
            rs = st.executeQuery();
            
                while (rs.next()) {
                    Sintomas sinto=new Sintomas();
                    sinto.setId(rs.getString("id_sintomas"));
                    sinto.setFecha(rs.getString("fecha_regis"));
                    sinto.setNauseas(rs.getBoolean("nauseas"));
                    sinto.setFatiga(rs.getBoolean("fatiga"));
                    sinto.setDolor(rs.getBoolean("dolor_ca"));
                    sinto.setSe_sensible(rs.getBoolean("se_sensible"));
                    sinto.setHinchazon(rs.getBoolean("hinchazon"));
                    sinto.setConstipacion(rs.getBoolean("constipacion"));
                    sinto.setCalambres(rs.getBoolean("calambres"));
                    sinto.setVomito(rs.getBoolean("vomito"));
                    sinto.setSangrado(rs.getBoolean("sangrado"));
                    sinto.setFeliz(rs.getBoolean("feliz"));
                    sinto.setTriste(rs.getBoolean("triste"));
                    sinto.setSensible(rs.getBoolean("sensible"));
                    sinto.setIra(rs.getBoolean("ira"));
                    sinto.setAngustia(rs.getBoolean("angustia"));
                    sinto.setConfusion(rs.getBoolean("confusion"));
                    sinto.setTranquilidad(rs.getBoolean("tranquilidad"));
                    sinto.setDisgusto(rs.getBoolean("disgusto"));
                    sinto.setNotas(rs.getString("notas_s"));
                    list.add(sinto);
                    
                    
                }

            this.desconectar();

        } catch (Exception e) {
            System.out.println(e.toString() + "emi");
        }

        return list;
    }
    
    
    public Sintomas Consulta(String id_sintomas) {
        ArrayList<Sintomas> list = new ArrayList();
        String sql = "select * from sintomas where id_sintomas=?;";
        Sintomas sinto=new Sintomas();

        try {
            
            this.conectar();
            st = this.getCon().prepareStatement(sql);
            st.setString(1, id_sintomas);
            rs = st.executeQuery();
            
                if (rs.next()) {
                    sinto.setId(rs.getString("id_sintomas"));
                    sinto.setNauseas(rs.getBoolean("nauseas"));
                    sinto.setFatiga(rs.getBoolean("fatiga"));
                    sinto.setDolor(rs.getBoolean("dolor_ca"));
                    sinto.setSe_sensible(rs.getBoolean("se_sensible"));
                    sinto.setHinchazon(rs.getBoolean("hinchazon"));
                    sinto.setConstipacion(rs.getBoolean("constipacion"));
                    sinto.setCalambres(rs.getBoolean("calambres"));
                    sinto.setVomito(rs.getBoolean("vomito"));
                    sinto.setSangrado(rs.getBoolean("sangrado"));
                    sinto.setFeliz(rs.getBoolean("feliz"));
                    sinto.setTriste(rs.getBoolean("triste"));
                    sinto.setSensible(rs.getBoolean("sensible"));
                    sinto.setIra(rs.getBoolean("ira"));
                    sinto.setAngustia(rs.getBoolean("angustia"));
                    sinto.setConfusion(rs.getBoolean("confusion"));
                    sinto.setTranquilidad(rs.getBoolean("tranquilidad"));
                    sinto.setDisgusto(rs.getBoolean("disgusto"));
                    sinto.setNotas(rs.getString("notas_s"));
                    
                    
                }

            this.desconectar();

        } catch (Exception e) {
            System.out.println(e.toString() + "sintomas error");
        }

        return sinto;
    }
    
    
    public int Cambios(Sintomas sin) throws Exception{
        int status = 0;
        PreparedStatement ps;
        ResultSet rs;
        int id_sin = 0, id_reg = 0 ;
        try {
            this.conectar();
            String sql = "update sintomas set dolor_ca = ?, vomito = ?, fatiga = ?, nauseas = ?, se_sensible = ?, "
                + "hinchazon = ?, constipacion = ?, calambres = ?, sangrado = ?, feliz = ?, triste = ?, sensible = ?, ira = ?, angustia = ?, "
                + "confusion = ?, tranquilidad = ?, disgusto = ?, notas_s = ? where id_sintomas = ?";
            
            if (status == 0) {
                st = this.getCon().prepareStatement(sql);
                st.setBoolean(1, sin.getDolor());
                st.setBoolean(2, sin.getVomito());
                st.setBoolean(3, sin.getFatiga());
                st.setBoolean(4, sin.getNauseas());
                st.setBoolean(5, sin.getSe_sensible());
                st.setBoolean(6, sin.getHinchazon());
                st.setBoolean(7, sin.getConstipacion());
                st.setBoolean(8, sin.getCalambres());
                st.setBoolean(9, sin.getSangrado());
                st.setBoolean(10, sin.getFeliz());
                st.setBoolean(11, sin.getTriste());
                st.setBoolean(12, sin.getSensible());
                st.setBoolean(13, sin.getIra());
                st.setBoolean(14, sin.getAngustia());
                st.setBoolean(15, sin.getConfusion());
                st.setBoolean(16, sin.getTranquilidad());
                st.setBoolean(17, sin.getDisgusto());
                st.setString(18, sin.getNotas());
                st.setString(19, sin.getId());
                status = st.executeUpdate();
                
            }
            
            System.out.println("cambio exitoso del sintoma");
            this.desconectar();
            
        } catch (Exception e) {
            System.out.println("Error al cambiar el sintoma: " + e.getMessage() + e.toString());
        }
        return status;
    }
    

    public void Eliminar(String id){
        boolean eliminado = false;
        String sql="delete from sintomas where sintomas.id_sintomas=?";
        String sql2="delete from regis_sintoma where regis_sintoma.id_sintomas=?";
        try {
            this.conectar();
            st = this.getCon().prepareStatement(sql);
            st.setString(1, id);
            eliminado = st.executeUpdate()>0;
            st = this.getCon().prepareStatement(sql2);
            st.setString(1, id);
            eliminado = st.executeUpdate()>0;
            this.desconectar();
            
        } catch (Exception e) {
            System.out.println(e.toString() + "emi");
        }
    }
}
