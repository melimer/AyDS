/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Modelo;

/**
 *
 * @author karlaviles
 */
public class Foro {
    private String idTema;
    private String nombreForo;
    private String nombreTema;
    private String idForo;
    private String personaInici;
private String id_msg;
private String fecha;
private int noReplicas;
private String replica;
private String personRep;
private String fechaRep;

    public String getFechaRep() {
        return fechaRep;
    }

    public void setFechaRep(String fechaRep) {
        this.fechaRep = fechaRep;
    }

    public String getPersonRep() {
        return personRep;
    }

    public void setPersonRep(String personRep) {
        this.personRep = personRep;
    }

    public String getReplica() {
        return replica;
    }

    public void setReplica(String replica) {
        this.replica = replica;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }


    public int getNoReplicas() {
        return noReplicas;
    }

    public void setNoReplicas(int noReplicas) {
        this.noReplicas = noReplicas;
    }

    public String getId_msg() {
        return id_msg;
    }

    public void setId_msg(String id_msg) {
        this.id_msg = id_msg;
    }
    
    public String getIdForo() {
        return idForo;
    }

    public void setIdForo(String idForo) {
        this.idForo = idForo;
    }

    public String getPersonaInici() {
        return personaInici;
    }

    public void setPersonaInici(String personaInici) {
        this.personaInici = personaInici;
    }
    

    public String getNombreTema() {
        return nombreTema;
    }

    public void setNombreTema(String nombreTema) {
        this.nombreTema = nombreTema;
    }
    private String msgPrincip;

    public String getIdTema() {
        return idTema;
    }

    public void setIdTema(String idTema) {
        this.idTema = idTema;
    }

    

    public String getNombreForo() {
        return nombreForo;
    }

    public void setNombreForo(String nombreForo) {
        this.nombreForo = nombreForo;
    }

    public String getMsgPrincip() {
        return msgPrincip;
    }

    public void setMsgPrincip(String msgPrincip) {
        this.msgPrincip = msgPrincip;
    }
    
}
