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

/**
 *
 * @author karlaviles
 */
public class ForosCRUD  extends Conexion{
    Conexion cn;
    Connection con;
    PreparedStatement st;
    ResultSet rs;
    String idForo;
    String idMsg;
    String idReplica;
    
    public boolean AltaForo(Foro fo) {
        boolean insertado=false;
        String sql="insert into foro(id_foro, nom_foro, iniciado_por) values(?,?,?)";
        String sql2="insert into mensajes(id_mensaje, comentario, fecha_mensaje) values(?,?,now())";
        String sql3 = "insert into foro_msg(id_foro, id_mensaje) values(?,?)";
        String sql4 = "insert into foro_tema(id_foro, id_tema) values(?,?)";
        try {

            this.conectar();
    
    //alta foro
            st = this.getCon().prepareStatement(sql);
            st.setString(1, null);
            st.setString(2, fo.getNombreForo());
            st.setString(3, fo.getPersonaInici());
            insertado = st.executeUpdate() > 0;

            st = this.getCon().prepareStatement("select last_insert_id()");
            rs = st.executeQuery();
            
            while (rs.next()) {
                idForo = rs.getString(1);
            }
            //alta msg
            st = this.getCon().prepareStatement(sql2);
            st.setString(1, null);
            st.setString(2, fo.getMsgPrincip());
           
            insertado = st.executeUpdate() > 0;

            st = this.getCon().prepareStatement("select last_insert_id()");
            rs = st.executeQuery();
            
            while (rs.next()) {
                idMsg = rs.getString(1);
            }
            
            //alta msg_foro
            st = this.getCon().prepareStatement(sql3);
            st.setString(1, idForo);
            st.setString(2, idMsg);
            insertado = st.executeUpdate() > 0;

            
            // alta relacion tema_foro
            st = this.getCon().prepareStatement(sql4);
            st.setString(1, idForo);
            st.setString(2, fo.getIdTema());
            insertado = st.executeUpdate() > 0;
            

            } catch (Exception e) {
            System.out.println(e.toString() + " hello");

        }
        
        return insertado;
    }
    public String ConsultaTema(String idTema){
        String nomTema="";
        String sql="select * from temas where id_tema=?";
        try {
            
            this.conectar();
            st = this.getCon().prepareStatement(sql);
            st.setString(1, idTema);
            rs = st.executeQuery();
            
                while (rs.next()) {
                    nomTema=rs.getString("nombre_t");
                }

            this.desconectar();

        } catch (Exception e) {
            System.out.println(e.toString() + "emi");
        }
        return nomTema;
    }
    public List ConsultaForosComple(String idTema) {
        ArrayList<Foro> list = new ArrayList();
        String sql="select foro.id_foro, mensajes.id_mensaje, nom_foro, iniciado_por from mensajes "
                + "inner join foro_msg on mensajes.id_mensaje=foro_msg.id_mensaje inner join foro on foro_msg.id_foro=foro.id_foro "
                + " inner join foro_tema on foro.id_foro=foro_tema.id_foro inner join temas on temas.id_tema=foro_tema.id_tema where"
                + " temas.id_tema=?";
        
        
        
        try {
            
            this.conectar();
            st = this.getCon().prepareStatement(sql);
            st.setString(1, idTema);
            rs = st.executeQuery();
            
                while (rs.next()) {
                    Foro fo=new Foro();
                    
                    fo.setNombreForo(rs.getString("nom_foro"));
                    fo.setIdForo(rs.getString("id_foro"));
                    fo.setPersonaInici(rs.getString("iniciado_por"));
                    fo.setId_msg(rs.getString("id_mensaje"));
                    list.add(fo);
                    
                    
                }

            this.desconectar();

        } catch (Exception e) {
            System.out.println(e.toString() + "emi");
        }

        return list;
    }
    public List ContarReplicas(String idMsg) {
        ArrayList<Foro> list = new ArrayList();
        String sql="select count(*) from replica inner join msg_replica on "
                + "msg_replica.id_replica=replica.id_replica inner join mensajes "
                + "on msg_replica.id_mensaje=mensajes.id_mensaje where mensajes.id_mensaje=?";
        
        try {
            
            this.conectar();
            st = this.getCon().prepareStatement(sql);
            st.setString(1, idMsg);
            rs = st.executeQuery();
            
                while (rs.next()) {
                    Foro fo=new Foro();
                    fo.setNoReplicas(rs.getInt(1));
                    System.out.println(fo.getNoReplicas());
                    list.add(fo);
                    
                    
                }
                } catch (Exception e) {
            System.out.println(e.toString() + "emi");
        }
        
        return list;
    }
    public List ConsultaForoMsg(String idForo) {
        ArrayList<Foro> list = new ArrayList();
        String sql="select * from mensajes inner join foro_msg on "
                + "mensajes.id_mensaje=foro_msg.id_mensaje inner join foro on foro_msg.id_foro=foro.id_foro where "
                + "foro.id_foro=?";
        try {
            
            this.conectar();
            st = this.getCon().prepareStatement(sql);
            st.setString(1, idForo);
            rs = st.executeQuery();
            
                while (rs.next()) {
                    Foro fo=new Foro();
                    
                    fo.setNombreForo(rs.getString("nom_foro"));
                    fo.setIdForo(rs.getString("id_foro"));
                    fo.setPersonaInici(rs.getString("iniciado_por"));
                    fo.setId_msg(rs.getString("id_mensaje"));
                    fo.setMsgPrincip(rs.getString("comentario"));
                    fo.setFecha(rs.getString("fecha_mensaje"));
                    list.add(fo);
                    
                    
                }

            this.desconectar();

        } catch (Exception e) {
            System.out.println(e.toString() + "emi");
        }
        return list;
        
    }
    public boolean AltaReplica(Foro fo) {
        boolean insertado=false;
        String sql="insert into replica(id_replica,contenido,hecha_por,fecha_replica) values(?,?,?,now())";
        String sql2="insert into msg_replica(id_replica,id_mensaje) values(?,?)";
        try {

            this.conectar();
    
    //alta replica
            st = this.getCon().prepareStatement(sql);
            st.setString(1, null);
            st.setString(2, fo.getReplica());
            st.setString(3, fo.getPersonRep());
            insertado = st.executeUpdate() > 0;

            st = this.getCon().prepareStatement("select last_insert_id()");
            rs = st.executeQuery();
            
            while (rs.next()) {
                idReplica = rs.getString(1);
            }
            //alta msg_rep
            System.out.println(fo.getId_msg());
            System.out.println(idReplica);
            st = this.getCon().prepareStatement(sql2);
            st.setString(1, idReplica);
            st.setString(2, fo.getId_msg());
            
            insertado = st.executeUpdate() > 0; 
            this.desconectar();

        } catch (Exception e) {
            System.out.println(e.toString() + "emi");
        }
            
        
        return insertado;
    }
    //falta
    public List ConsultaReplica(String idMsg) {
        ArrayList<Foro> list = new ArrayList();
        String sql="select * from replica inner join msg_replica on msg_replica.id_replica=replica.id_replica"
                + " inner join mensajes on msg_replica.id_mensaje=mensajes.id_mensaje "
                + "where mensajes.id_mensaje=? order by fecha_replica";
        
        try {
            
            this.conectar();
            st = this.getCon().prepareStatement(sql);
            st.setString(1, idMsg);
            rs = st.executeQuery();
            
                while (rs.next()) {
                    Foro fo=new Foro();
                    
                    fo.setReplica(rs.getString("contenido"));
                    fo.setPersonRep(rs.getString("hecha_por"));
                    fo.setFechaRep(rs.getString("fecha_replica"));
                    list.add(fo);
                    
                    
                }

            this.desconectar();

        } catch (Exception e) {
            System.out.println(e.toString() + "emi");
        }
        
        return list;
    }
    
    
    public String ConsultaIdMsg(String idForo) {
        String idMsg="";
        String sql="select mensajes.id_mensaje from mensajes inner join foro_msg on "
                + "mensajes.id_mensaje=foro_msg.id_mensaje inner join foro on foro_msg.id_foro=foro.id_foro where "
                + "foro.id_foro=?";
        try {
            
            this.conectar();
            st = this.getCon().prepareStatement(sql);
            st.setString(1, idForo);
            rs = st.executeQuery();
            
                while (rs.next()) {
                    idMsg=rs.getString("id_mensaje");    
                }

            this.desconectar();

        } catch (Exception e) {
            System.out.println(e.toString() + "emi");
        }
        return idMsg;
        
    }
    
}
