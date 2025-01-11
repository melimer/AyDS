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
import java.util.List;

/**
 *
 */
public class ActsUser extends Conexion{
    PreparedStatement ps;
ResultSet rs;
String idPadre = "";
    String idUser = "";
    String idDoctor="";
    private boolean existir;

    public boolean isExistir() {
        return existir;
    }

    public void setExistir(Usuario exist) {
        this.existir = exist.getExiste();
        System.out.println(exist.getExiste());
    }
    
    //ALTAS
    public boolean DarAltaUsrPadre(Usuario user, PEmbarazo padre){
        boolean creado=false;
        String sql = "INSERT INTO usuario (id_usuario, nombre, correo_electronico, contraseña, apodo, fecha_registro) VALUES(?, ?, ?, ?, ?, now());";
            String sql2 ="INSERT INTO p_embarazo(id_persona, sexo, sem_emba) VALUES(?, ?, ?) ";
            String sql3="INSERT INTO usuario_pemba(id_persona, id_usuario) VALUES(?,?)";
        try {
            this.conectar();

            
            ps = this.getCon().prepareStatement(sql);
            ps.setString(1, null);
            ps.setString(2, user.getNombre());
            ps.setString(3, user.getCorreo());
            ps.setString(4, user.getContra());
            
            ps.setString(5, user.getApodo());
            creado=ps.executeUpdate()>0;
            //obtencion id_user
            ps = this.getCon().prepareStatement("select last_insert_id()");
            rs = ps.executeQuery();
            
          
            while (rs.next()) {
                idUser = rs.getString(1);
            }
            
            //alta pa
            ps=this.getCon().prepareStatement(sql2);
            ps.setString(1, null);
            ps.setString(2, padre.getSexo());
            ps.setString(3, padre.getSemanas());
            creado=ps.executeUpdate()>0;
            
            //obtencion id_persona
            ps = this.getCon().prepareStatement("select last_insert_id()");
            rs = ps.executeQuery();
            
          
            while (rs.next()) {
                idPadre = rs.getString(1);
            }
            
            //alta pa_user
            ps=this.getCon().prepareStatement(sql3);
            ps.setString(1, idPadre);
            ps.setString(2, idUser);
            creado=ps.executeUpdate()>0;
             
            
            this.desconectar();

        } catch (Exception e) {
            System.out.println(e);
        }

        return creado;
    }

    

    public boolean AltaUsrMed(Usuario user, Medico med) throws Exception {
        
        boolean creado=false;
        String sql = "INSERT INTO usuario (id_usuario, nombre, correo_electronico, contraseña, apodo, fecha_registro) VALUES(?, ?, ?, ?, ?, now());";
            String sql2 ="INSERT INTO medico (id_medico, especialidad, cedula) VALUES(?,?,?)";
            String sql3="INSERT INTO usuario_medico(id_medico, id_usuario) VALUES(?,?)";
        try {
            this.conectar();

            
            ps = this.getCon().prepareStatement(sql);
            ps.setString(1, null);
            ps.setString(2, user.getNombre());
            ps.setString(3, user.getCorreo());
            ps.setString(4, user.getContra());
            
            ps.setString(5, user.getApodo());
            creado=ps.executeUpdate()>0;
            //obtencion id_user
            ps = this.getCon().prepareStatement("select last_insert_id()");
            rs = ps.executeQuery();
            
          
            while (rs.next()) {
                idUser = rs.getString(1);
            }
            
            //alta pa
            ps=this.getCon().prepareStatement(sql2);
            ps.setString(1, null);
            ps.setString(2, med.getEspecialidad());
            ps.setString(3, med.getCedula()); 
            creado=ps.executeUpdate()>0;
            
            //obtencion id_persona
            ps = this.getCon().prepareStatement("select last_insert_id()");
            rs = ps.executeQuery();
            
          
            while (rs.next()) {
                idDoctor = rs.getString(1);
            }
            
            //alta pa_user
            ps=this.getCon().prepareStatement(sql3);
            ps.setString(1, idDoctor);
            ps.setString(2, idUser);
            creado=ps.executeUpdate()>0;
             
            
            this.desconectar();
        } catch (Exception e) {
            System.out.println(e);
        }

        return creado;
    }
    
     public int ModifUsuario(String username, String correo, String apodo, String correoOrig) throws Exception {
        int status = 0;
        String id = "";
        try {
            this.conectar();
            String sql = "Select * from usuario where correo_electronico=?;";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ps.setString(1, correoOrig);
            ResultSet res = ps.executeQuery();
            if (res.next()) {
                id = res.getString(1);
            }
            //revisa si ya existe el apodo
            String sql3 = "Select * from usuario where apodo=?;";
            PreparedStatement ps3 = this.getCon().prepareStatement(sql3);
            ps3.setString(1, apodo);
            ResultSet res2 = ps3.executeQuery();
            if (res2.next() && !id.equals(res2.getString(1))) {
                //ya existe con ese apodo o correo
                System.out.println("ya existe el apodo  " + apodo  + "en id = " + res2.getString(1));
                return -1;
            }
            
             //revisa si ya existe el apodo
            sql3 = "Select * from usuario where correo_electronico=?;";
            ps3 = this.getCon().prepareStatement(sql3);
            ps3.setString(1, correo);
             res2 = ps3.executeQuery();
            if (res2.next() && !id.equals(res2.getString(1))) {
                //ya existe con ese apodo o correo
                System.out.println("ya existe el correo  " + apodo  + "en id = " + res2.getString(1));
                return -1;
            }
            String sql2 = "update usuario set nombre=?, apodo=?,  correo_electronico=? where id_usuario = ?;";
            PreparedStatement ps2 = this.getCon().prepareStatement(sql2);
            ps2.setString(1, username);
            ps2.setString(2, apodo);
            ps2.setString(3, correo);
            ps2.setString(4, id);
            status = ps2.executeUpdate();
            return status;
            
        } catch (Exception e) {
            throw e;
        }
    }

    //Consultas
    public String Buscar(String correo) throws Exception {
        String id;
        try {
            this.conectar();
            String sql = "Select * from usuario where correo_electronico=?;";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ps.setString(1, correo);
            ResultSet res = ps.executeQuery();
            if (res.next()) {
                id = res.getString("id_usuario");
                return id;
            }
        } catch (Exception e) {
            throw e;
        }
        return null;
    }
    
    public String[] BuscarPorId(String id_usuario) throws Exception {
        String datos[] = new String[2];
        try {
            this.conectar();
            String sql = "Select * from usuario where id_usuario=?;";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ps.setString(1, id_usuario);
            ResultSet res = ps.executeQuery();
            if (res.next()) {
                datos[0] = res.getString("nombre");
                datos[1] = res.getString("correo_electronico");
                return datos;
            }
        } catch (Exception e) {
            throw e;
        }
        return null;
    }

    public String BuscarSesion(String correo) throws Exception {
        String id;
        try {
            this.conectar();
            String sql = "Select * from usuario where correo_electronico=? or apodo=?;";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ps.setString(1, correo);
            ps.setString(2, correo);
            ResultSet res = ps.executeQuery();
            if (res.next()) {
                id = res.getString("id_usuario");
                return id;
            }
        } catch (Exception e) {
            throw e;
        }
        return null;
    }
    
    public boolean Existe(String correo, String nombre) throws Exception {
        boolean existe;
        try {
            this.conectar();
            String sql = "Select * from usuario where correo_electronico=? or apodo=?;";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ps.setString(1, correo);
            ps.setString(2, nombre);
            ResultSet res = ps.executeQuery();
            if (res.next()) {
                existe = true;
                return existe;
            } else {
                existe = false;
                return existe;
            }
        } catch (Exception e) {
            throw e;
        }
    }
    

    public String BuscarDRUsuario(String id_usr) throws Exception {
        String id;
        try {
            this.conectar();
            String sql = "Select * from usuario_medico where id_usuario=?;";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ps.setString(1, id_usr);
            ResultSet res = ps.executeQuery();
            if (res.next()) {
                id = res.getString("id_medico");
                return id;
            }
        } catch (Exception e) {
            throw e;
        }
        return null;
    }

    public Medico BuscarDR(String id_doc) throws Exception {
        
     String cedula;
     String especialidad;
        try {
            this.conectar();
            String sql = "Select * from medico where id_medico=?;";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ps.setString(1, id_doc);
            ResultSet res = ps.executeQuery();
            if (res.next()) {
                especialidad = res.getString("especialidad");
                cedula = res.getString("cedula");
                Medico med = new Medico(cedula, especialidad);
                return med;
            }
        } catch (Exception e) {
            throw e;
        }
        return null;
    }

    public String BuscarPadreusuario(String id_usr) throws Exception {
        String id;
        try {
            this.conectar();
            String sql = "Select * from usuario_pemba where id_usuario=?";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ps.setString(1, id_usr);
            ResultSet res = ps.executeQuery();
            if (res.next()) {
                id = res.getString("id_persona");
                return id;
            }
        } catch (Exception e) {
            throw e;
        }
        return null;
    }
    
    public String BuscarUsuarioPersona(String id_persona) throws Exception {
        String id;
        try {
            this.conectar();
            String sql = "Select * from usuario_pemba where id_persona=?";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ps.setString(1, id_persona);
            ResultSet res = ps.executeQuery();
            if (res.next()) {
                id = res.getString("id_usuario");
                return id;
            }
        } catch (Exception e) {
            throw e;
        }
        return null;
    }
    
        public String BuscarUsuarioMedico(String id_medico) throws Exception {
        String id;
        try {
            this.conectar();
            String sql = "Select * from usuario_medico where id_medico=?";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ps.setString(1, id_medico);
            ResultSet res = ps.executeQuery();
            if (res.next()) {
                id = res.getString("id_usuario");
                return id;
            }
        } catch (Exception e) {
            throw e;
        }
        return null;
    }
    
    public PEmbarazo BuscarPadre(String id_persona) throws Exception {
        boolean nacido;
        String sexo;
        String meses;
        String semanas;
        String namebb;
        try {
            this.conectar();
            String sql = "Select * from p_embarazo where id_persona=?;";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ps.setString(1, id_persona);
            ResultSet res = ps.executeQuery();
            if (res.next()) {
                sexo = res.getString("sexo");
                semanas = res.getString("sem_emba");
                PEmbarazo pemb = new PEmbarazo(semanas, sexo);
                return pemb;
            }
        } catch (Exception e) {
            throw e;
        }
        return null;
    }
    
    
    
        public String BuscarPadre2(String id_usuario) throws Exception {
        String id_persona;
        try {
            this.conectar();
            String sql = "Select * from p_embarazo inner join usuario_pemba on usuario_pemba.id_persona=p_embarazo.id_persona where id_usuario=?";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ps.setString(1, id_usuario);
            ResultSet res = ps.executeQuery();
            if (res.next()) {
                id_persona = res.getString("id_persona");
                return id_persona;
            }
        } catch (Exception e) {
            throw e;
        }
        return null;
    }
        public String BuscarMedico(String id_usuario) throws Exception {
        String id_persona;
        try {
            this.conectar();
            String sql = "select*from medico inner join usuario_medico on usuario_medico.id_medico=medico.id_medico where id_usuario=?";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ps.setString(1, id_usuario);
            ResultSet res = ps.executeQuery();
            if (res.next()) {
                id_persona = res.getString("id_medico");
                return id_persona;
            }
        } catch (Exception e) {
            throw e;
        }
        return null;
    }
    
    public Usuario Usuario(String nombre) throws Exception {
        String username;
        String contra;
        String correo;
        String apodo;
        try {
            this.conectar();
            String sql = "Select * from usuario where correo_electronico=? or apodo=?";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ps.setString(1, nombre);
            ps.setString(2, nombre);
            ResultSet res = ps.executeQuery();
            if (res.next()) {
                username = res.getString("nombre");
                contra = res.getString("contraseña");
                correo = res.getString("correo_electronico");
                apodo = res.getString("apodo");
                Usuario usr = new Usuario(username, correo, contra, apodo);
                return usr;
            }
        } catch (Exception e) {
            throw e;
        }
        return null;
    }
    
    
    public String fecha(String nom) throws Exception{
        String fecha;
        try {
            this.conectar();
            String sql = "Select * from usuario where correo_electronico=? or apodo=?;";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ps.setString(1, nom);
            ps.setString(2, nom);
            ResultSet res = ps.executeQuery();
            if (res.next()) {
                fecha = res.getString("fecha_registro");
                return fecha;
            }
        } catch (Exception e) {
            throw e;
        }
        return null;
    }

//Login
    public boolean LogIn(String user, String contra) {
        boolean correcto=false;
        try {
            this.conectar();
            String nom;
            String correo;
            String pass;
            String sql = "SELECT * FROM usuario WHERE apodo=? or correo_electronico=?";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, user);
            ResultSet res = ps.executeQuery();
            if (res.next()) {
                nom = res.getString("apodo");
                correo = res.getString("correo_electronico");
                pass = res.getString("contraseña");
                if (user.equals(nom) || user.equals(correo)) {
                    if (contra.equals(pass)) {
                        correcto = true;
                        System.out.println("todo correcto");
        return correcto;
                    } else {
                        correcto = false;
                        System.out.println("contra incorrecta");
        return correcto;
                    }
                } else {
                    correcto = false;
                    System.out.println("el nombre no correcto");
        return correcto;
                }
            } else {
                correcto = false;
                System.out.println("la consulta no corrio");
        return correcto;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return correcto;
    }
    
    
    //borrar cuentas
    
    public boolean borrarUsuario(String id_usuario) throws Exception{
        try{
            this.conectar();
            String sql = "DELETE FROM usuario WHERE id_usuario=?;";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ps.setString(1, id_usuario);
            ps.execute();
            return true;
        }catch(Exception e){
            throw e;
        }
    }
    
    
    public boolean borrarDoctor(String id_doc) throws Exception{
        try{
            this.conectar();
            String sql = "DELETE FROM medico WHERE id_medico=?;";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ps.setString(1, id_doc);
            ps.execute();
            return true;
        }catch(Exception e){
            throw e;
        }
    }
    
    public boolean borrarPadre(String id_persona) throws Exception{
        try{
            this.conectar();
            String sql = "DELETE FROM p_embarazo WHERE id_persona=?;";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ps.setString(1, id_persona);
            ps.execute();
            return true;
        }catch(Exception e){
            throw e;
        }
    }
    
    public boolean borrarPadreUsuario(String id_usuario) throws Exception{
        try{
            this.conectar();
            String sql = "DELETE FROM usuario_pemba WHERE id_usuario=?;";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ps.setString(1, id_usuario);
            ps.execute();
            return true;
        }catch(Exception e){
            throw e;
        }
    }
    
    public boolean borrarDoctorUsuario(String id_usuario) throws Exception{
        try{
            this.conectar();
            String sql = "DELETE FROM usuario_medico WHERE id_usuario=?;";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ps.setString(1, id_usuario);
            ps.execute();
            return true;
        }catch(Exception e){
            throw e;
        }
    }
    
     public List buscarTodos() throws Exception{
        ArrayList<Usuario> lista = new ArrayList<Usuario>();
        try{
            this.conectar();
            String sql = "SELECT  * from usuario";
            PreparedStatement ps = this.getCon().prepareStatement(sql); 
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                Usuario u = new Usuario();
                u.setNombre(rs.getString("nombre"));
                u.setContra(rs.getString("contraseña"));
                u.setCorreo(rs.getString("correo_electronico"));
                lista.add(u);
            }
            System.out.println("Usuario encontrado");

        } catch (Exception e) {
            throw e;
        }
        return lista;
    }
     
    public String BuscarApodoUser(String id_usr) throws Exception {
        String apodo;
        try {
            this.conectar();
            String sql = "Select * from usuario where id_usuario=?;";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ps.setString(1, id_usr);
            ResultSet res = ps.executeQuery();
            if (res.next()) {
                apodo = res.getString("apodo");
                return apodo;
            }
        } catch (Exception e) {
            throw e;
        }
        return null;
    }
    

}
