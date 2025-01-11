package com.Modelo;

import com.Conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Mensaje extends Conexion{

    private String cont;
    private String fecha;
    private String hora;
    private String id_emisor;
    private int tipo_emisor;
    private Boolean leido;
    
    public static final int PERSONA = 0;
    public static final int MEDICO = 1;
    
    private Mensaje(String cont, String fecha, String hora, String id_emisor, int tipo_emisor_, Boolean leido){
        this.cont = cont;
        this.fecha = fecha;
        this.hora = hora;
        this.id_emisor = id_emisor;
        this.tipo_emisor = tipo_emisor_;
        this.leido = leido;
    }
    
    public Mensaje(){}
    

    public Mensaje obtenerUltimoMensaje(String id_persona, String id_medico) throws Exception{
        try {
            this.conectar();
            String sql = "select *, DATE_FORMAT(fecha_msg, '%d-%m-%Y') AS fecha, TIME_FORMAT(hora_msg, '%H:%i') AS hora from mensaje where id_persona=? and id_medico=? ORDER BY CONCAT(fecha_msg, ' ', hora_msg) DESC LIMIT 1;";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ps.setString(1, id_persona);
            ps.setString(2, id_medico);
            ResultSet res = ps.executeQuery();
            if (res.next()) {
                String cont = res.getString("cont_msg");
                String fecha = res.getString("fecha");
                String hora = res.getString("hora");
                String id_emisor = res.getString("hora_msg");
                int tipo_emisor = res.getInt("tipo_emisor");
                Boolean leido = res.getBoolean("leido");
                Mensaje mensaje = new Mensaje(cont, fecha, hora, id_emisor, tipo_emisor, leido);
                return mensaje;
            }
        } catch (Exception e) {
            throw e;
        }
        return null;
    }
    
    public ArrayList<Mensaje> obtenerMensajes(String id_persona, String id_medico) throws Exception{
        try {
            this.conectar();
            String sql = "select *,DATE_FORMAT(fecha_msg, '%d-%m-%Y') AS fecha, TIME_FORMAT(hora_msg, '%H:%i') AS hora from mensaje where id_persona=? and id_medico=? ORDER BY CONCAT(fecha_msg, ' ', hora_msg) desc;";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ps.setString(1, id_persona);
            ps.setString(2, id_medico);
            ResultSet res = ps.executeQuery();
            ArrayList<Mensaje> mensajes = new ArrayList<>();
            while (res.next()) {
                String cont = res.getString("cont_msg");
                String fecha = res.getString("fecha");
                String hora = res.getString("hora");
                String id_emisor = res.getString("id_emisor");
                int tipo_emisor = res.getInt("tipo_emisor");
                Boolean leido = res.getBoolean("leido");
                Mensaje mensaje = new Mensaje(cont, fecha, hora, id_emisor, tipo_emisor, leido);
                mensajes.add(mensaje);
            }
            return mensajes;
            
        } catch (Exception e) {
            throw e;
        }
    }
    
    public boolean nuevoMensaje(String cont, String id_emisor, String tipo_emisor, String id_persona, String id_medico) throws Exception {
        boolean mandado = false;
        PreparedStatement ps;
        ResultSet rs;
        int status = 0;
        try {
            this.conectar();
            String sql = "INSERT into mensaje (cont_msg, fecha_msg, id_emisor, tipo_emisor, leido, hora_msg, id_persona, id_medico) values(?, CURRENT_DATE, ?, ?, false, CURRENT_TIME, ?, ?);";
            ps = this.getCon().prepareStatement(sql);
            ps.setString(1, cont);
            ps.setString(2, id_emisor);
            ps.setString(3, tipo_emisor);
            ps.setString(4, id_persona);
            ps.setString(5, id_medico);
            status = ps.executeUpdate();
            if (status > 0) {
                mandado = true;
            }
        } catch (Exception e) {
            System.out.println("Error al agregar el mensaje: " + e.getMessage());

        }
        return mandado;
    }
    
    public boolean colocarMensajesLeidos(String id_persona, String id_medico, String id_emisor){
         boolean mandado = false;
        PreparedStatement ps;
        ResultSet rs;
        int status = 0;
        try {
            this.conectar();
            String sql = "UPDATE mensaje SET leido = '1' WHERE id_persona=? and id_medico=? and id_emisor!=?;";
            ps = this.getCon().prepareStatement(sql);
            ps.setString(1, id_persona);
            ps.setString(2, id_medico);
            ps.setString(3, id_emisor);
            status = ps.executeUpdate();
            if (status > 0) {
                mandado = true;
            }
        } catch (Exception e) {
            System.out.println("Error al agregar el mensaje: " + e.getMessage());

        }
        return mandado;
    }
    
    
    public String getCont() {
        return cont;
    }

    public String getFecha() {
        return fecha;
    }

    public String getHora() {
        return hora;
    }

    public String getId_emisor() {
        return id_emisor;
    }

    public int getTipo_emisor() {
        return tipo_emisor;
    }

    public Boolean getLeido() {
        return leido;
    }
    
    
}