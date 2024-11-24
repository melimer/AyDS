/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Modelo;

import java.util.Date;

public class CamEmb {
    private int id_cam_emba, id_padre, diametro_p;
    private String antojos, frecuencia_u, cambios_pdes, notas_ce;
    private Boolean cambios_piel;
    private Date fecha_cam_em;

    public Date getFecha_cam_em() {
        return fecha_cam_em;
    }

    public void setFecha_cam_em(Date fecha_cam_em) {
        this.fecha_cam_em = fecha_cam_em;
    }


    public int getId_cam_emba() {
        return id_cam_emba;
    }

    public void setId_cam_emba(int id_cam_emba) {
        this.id_cam_emba = id_cam_emba;
    }

    public int getId_padre() {
        return id_padre;
    }

    public void setId_padre(int id_padre) {
        this.id_padre = id_padre;
    }

    public int getDiametro_p() {
        return diametro_p;
    }

    public void setDiametro_p(int diametro_p) {
        this.diametro_p = diametro_p;
    }

    public String getAntojos() {
        return antojos;
    }

    public void setAntojos(String antojos) {
        this.antojos = antojos;
    }

    public String getFrecuencia_u() {
        return frecuencia_u;
    }

    public void setFrecuencia_u(String frecuencia_u) {
        this.frecuencia_u = frecuencia_u;
    }

    public String getCambios_pdes() {
        return cambios_pdes;
    }

    public void setCambios_pdes(String cambios_pdes) {
        this.cambios_pdes = cambios_pdes;
    }

    public String getNotas_ce() {
        return notas_ce;
    }

    public void setNotas_ce(String notas_ce) {
        this.notas_ce = notas_ce;
    }

    public Boolean getCambios_piel() {
        return cambios_piel;
    }

    public void setCambios_piel(Boolean cambios_piel) {
        this.cambios_piel = cambios_piel;
    }
    
}
