/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Modelo;

import com.Conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author karlaviles
 */
public class CitasCRUD extends Conexion {

    public int CrearHorarios(DispMedico c) throws Exception {
        int status = 0;
        PreparedStatement ps;
        ResultSet rs;
        int id_disp = 0;

        try {
            this.conectar();

            
            String sql = "INSERT into disponibilidad (dia, hora_inicio, hora_fin, estado, municipio, colonia, calle, numero_ext, numero_int, unidad_medica) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            
            String sql2 = "SELECT last_insert_id()";
            
            String sql3 = "INSERT into medico_disponibilidad (id_medico, id_disp) values (?, ?)";
            String sql4 = "INSERT into horarios_oc (ocupado, id_disp) values (?, ?)";

            if (status == 0) {
                ps = this.getCon().prepareStatement(sql);

                
                ps.setString(1, c.getDia());
                ps.setString(2, c.getHoraInicio());
                ps.setString(3, c.getHoraFin());
                ps.setString(4, c.getEstado());
                ps.setString(5, c.getMunicipio());
                ps.setString(6, c.getColonia());
                ps.setString(7, c.getCalle());
                ps.setInt(8, c.getNumeroExt());

                if (c.getNumeroInt() == null) {
                    ps.setNull(9, java.sql.Types.INTEGER); // Si es null, usar setNull
                } else {
                    ps.setInt(9, c.getNumeroInt());
                }

                ps.setString(10, c.getUnidadMedica());

                status = ps.executeUpdate();
                if (status > 0) {
                    System.out.println("Acción anterior ejecutada con éxito");

                    
                    ps = this.getCon().prepareStatement(sql2);
                    rs = ps.executeQuery();
                    if (rs.next()) {
                        id_disp = rs.getInt(1);
                    }
                    System.out.println("ID disponibilidad obtenido: " + id_disp);

                    // Insertar en 'medico_disponibilidad'
                    ps = this.getCon().prepareStatement(sql3);
                    ps.setInt(1, c.getIdMed());
                    ps.setInt(2, id_disp);
                    status = ps.executeUpdate();
                    
              
                }
            }

            System.out.println("Registro exitoso");
        } catch (Exception e) {
            System.out.println("Error al agregar el horario: " + e.getMessage());
            status = 0; 
        } finally {
            this.desconectar(); 
        }

        return status;
    }

    public List<DispMedico> obtenerDisponibilidadesPorMedico(int idMedico) throws Exception {
        List<DispMedico> lista = new ArrayList<>();
        String sql = "SELECT d.* FROM disponibilidad d JOIN medico_disponibilidad md ON d.id_disp = md.id_disp  WHERE md.id_medico = ?";

        try {
            this.conectar();
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ps.setInt(1, idMedico);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                DispMedico disp = new DispMedico();
                disp.setIdDisp(rs.getInt("id_disp"));
                disp.setDia(rs.getString("dia"));
                disp.setHoraInicio(rs.getTime("hora_inicio").toString());
                disp.setHoraFin(rs.getTime("hora_fin").toString());
                disp.setEstado(rs.getString("estado"));
                disp.setMunicipio(rs.getString("municipio"));
                disp.setColonia(rs.getString("colonia"));
                disp.setUnidadMedica(rs.getString("unidad_medica"));
                lista.add(disp);
            }
        } catch (Exception e) {
            System.out.println("Error al obtener el horario: " + e.getMessage());

        } finally {
            this.desconectar(); 
        }

        return lista;
    }

    public List<Map<String, Object>> obtenerPacientesPorMedico(int idMedico) throws Exception {
        List<Map<String, Object>> lista = new ArrayList<>();
        String sql = "SELECT u.nombre, u.correo_electronico, p.sexo, p.sem_emba, p.id_persona FROM usuario u inner JOIN usuario_pemba upa on u.id_usuario=upa.id_usuario inner join p_embarazo p ON upa.id_persona = p.id_persona inner JOIN pa_med pm ON p.id_persona = pm.id_persona WHERE pm.id_medico = ?";

        try {
            this.conectar();
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ps.setInt(1, idMedico);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Map<String, Object> paciente = new HashMap<>();
                paciente.put("nombre", rs.getString("nombre"));
                paciente.put("correo_electronico", rs.getString("correo_electronico"));
                paciente.put("sexo", rs.getString("sexo"));
                paciente.put("sem_emba", rs.getInt("sem_emba"));
                paciente.put("id_persona", rs.getInt("id_persona"));
                lista.add(paciente);
            }
        } finally {
            this.desconectar();
        }

        return lista;
    }

    public boolean MedtieneHorarios(int idMedico) throws Exception {
        String sql = "SELECT COUNT(*) AS total "
                + "FROM medico_disponibilidad "
                + "WHERE id_medico = ?";
        try {
            this.conectar();
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ps.setInt(1, idMedico);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    int total = rs.getInt("total");
                    return total > 0; 
                }
            }
        } catch (Exception e) {
            throw new Exception("Error al verificar horarios del médico: " + e.getMessage(), e);
        }
        return false;
    }

    public int CrearCita(DispMedico disponible, int duracion, Cita cit, String fecha) throws Exception {
        int status = 0;
        ResultSet rs;
        PreparedStatement ps;
        DispMedico disp = new DispMedico();
        LocalTime horaInicio = null;
        String lugar;
        boolean existe = false;
        boolean ocupado = false;

        try {
            this.conectar();

            
            String sql2 = "SELECT ult_time FROM horarios_oc WHERE fecha = ?";
            ps = this.getCon().prepareStatement(sql2);
            ps.setDate(1, java.sql.Date.valueOf(fecha));
            rs = ps.executeQuery();

            if (rs.next()) {
                existe = true;
                horaInicio = rs.getTime("ult_time").toLocalTime(); 
            }

            
            String sql = "SELECT * FROM disponibilidad WHERE id_disp = ?";
            ps = this.getCon().prepareStatement(sql);
            ps.setInt(1, disponible.getIdDisp());
            rs = ps.executeQuery();

            if (rs.next()) {
                disp.setHoraInicio(rs.getString("hora_inicio"));
                disp.setHoraFin(rs.getString("hora_fin"));
                disp.setDia(rs.getString("dia"));
                disp.setEstado(rs.getString("estado"));
                disp.setMunicipio(rs.getString("municipio"));
                disp.setColonia(rs.getString("colonia"));
                disp.setCalle(rs.getString("calle"));
                disp.setNumeroExt(rs.getInt("numero_ext"));
                disp.setNumeroInt(rs.getObject("numero_int") != null ? rs.getInt("numero_int") : null);
                disp.setUnidadMedica(rs.getString("unidad_medica"));
                
            }

            
            if (horaInicio == null) {
                horaInicio = LocalTime.parse(disp.getHoraInicio());
            }

            
            LocalTime horaFin = horaInicio.plusMinutes(duracion);
            LocalTime horaMax = LocalTime.parse(disp.getHoraFin());

            // Verificar si el horario es válido
            if (!horaFin.isAfter(horaMax)) { 
                if (horaFin.equals(horaMax)) {
                    ocupado = true;
                }

                // Generar el lugar del evento
                if (disp.getNumeroInt() == null) {
                    lugar = disp.getCalle() +  disp.getNumeroExt() + ", " + disp.getColonia() + ", "
                            + disp.getMunicipio() + ", " + disp.getEstado() + ", " + disp.getUnidadMedica();
                } else {
                    lugar = disp.getCalle() + ", " + disp.getNumeroExt() + ", Int. " + disp.getNumeroInt() + ", "
                            + disp.getColonia() + ", " + disp.getMunicipio() + ", " + disp.getEstado() + ", " + disp.getUnidadMedica();
                }

                
                String sql3 = "INSERT INTO cita (fecha, hora_in, hora_fin, lugar, id_persona, id_medico) VALUES (?, ?, ?, ?, ?, ?)";
                ps = this.getCon().prepareStatement(sql3);
                ps.setDate(1, java.sql.Date.valueOf(fecha));
                ps.setTime(2, java.sql.Time.valueOf(horaInicio));
                ps.setTime(3, java.sql.Time.valueOf(horaFin));
                ps.setString(4, lugar);
                ps.setInt(5, cit.getIdPersona());
                ps.setInt(6, disponible.getIdMed());
                status = ps.executeUpdate();

                if (status > 0) {
                    
                    String sql4;
                    if (existe) {
                        sql4 = "UPDATE horarios_oc SET ult_time = ?, ocupado = ?, WHERE fecha = ? AND id_disp = ?";
                        ps = this.getCon().prepareStatement(sql4);
                        ps.setTime(1, java.sql.Time.valueOf(horaFin));
                        ps.setBoolean(2, ocupado);
                        ps.setDate(3, java.sql.Date.valueOf(fecha));
                        ps.setInt(4, disponible.getIdDisp());
                    } else {
                        sql4 = "INSERT INTO horarios_oc (fecha, ult_time, ocupado, id_disp) VALUES (?, ?, ?,?)";
                        ps = this.getCon().prepareStatement(sql4);
                        ps.setDate(1, java.sql.Date.valueOf(fecha));
                        ps.setTime(2, java.sql.Time.valueOf(horaFin));
                        ps.setBoolean(3, ocupado);
                        ps.setInt(4, disponible.getIdDisp());
                    }
                    ps.executeUpdate();
                }
            }
        } catch (Exception e) {
            throw new Exception("Error al crear la cita: " + e.getMessage(), e);
        } finally {
            this.desconectar();
        }

        return status;
    }

    public List<Cita> buscarCitasPorPersona(int idPersona) throws Exception {
        List<Cita> citas = new ArrayList<>();
        ResultSet rs;
        PreparedStatement ps;

        String sql = "SELECT * FROM cita WHERE id_persona = ?";
        try {
            this.conectar();
            ps = this.getCon().prepareStatement(sql);
            ps.setInt(1, idPersona);
            rs = ps.executeQuery();

            while (rs.next()) {
                Cita cita = new Cita();
                cita.setIdCita(rs.getInt("id_cita"));
                cita.setFecha(rs.getDate("fecha").toLocalDate());
                cita.setHoraInicio(rs.getTime("hora_in").toLocalTime());
                cita.setHoraFin(rs.getTime("hora_fin").toLocalTime());
                cita.setLugar(rs.getString("lugar"));
                cita.setIdPersona(rs.getInt("id_persona"));
                cita.setIdMedico(rs.getInt("id_medico"));
                citas.add(cita);
            }
        } catch (Exception e) {
            throw new Exception("Error al buscar citas por idPersona: " + e.getMessage(), e);
        } finally {
            this.desconectar();
        }

        return citas;
    }

    public List<Cita> buscarCitasPorMedico(int idMedico) throws Exception {
        List<Cita> citas = new ArrayList<>();
        ResultSet rs;
        PreparedStatement ps;

        String sql = "SELECT * FROM cita WHERE id_medico = ?";
        try {
            this.conectar();
            ps = this.getCon().prepareStatement(sql);
            ps.setInt(1, idMedico);
            rs = ps.executeQuery();

            while (rs.next()) {
                Cita cita = new Cita();
                cita.setIdCita(rs.getInt("id_cita"));
                cita.setFecha(rs.getDate("fecha").toLocalDate());
                cita.setHoraInicio(rs.getTime("hora_in").toLocalTime());
                cita.setHoraFin(rs.getTime("hora_fin").toLocalTime());
                cita.setLugar(rs.getString("lugar"));
                cita.setIdPersona(rs.getInt("id_persona"));
                cita.setIdMedico(rs.getInt("id_medico"));
                citas.add(cita);
            }
        } catch (Exception e) {
            throw new Exception("Error al buscar citas por idMedico: " + e.getMessage(), e);
        } finally {
            this.desconectar();
        }

        return citas;
    }

}
