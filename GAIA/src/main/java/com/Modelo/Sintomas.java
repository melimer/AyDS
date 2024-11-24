/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Modelo;

import java.util.ArrayList;

public class Sintomas {

    private String id, id_padre;

    public String getId_padre() {
        return id_padre;
    }

    public void setId_padre(String id_padre) {
        this.id_padre = id_padre;
    }
    private boolean vomito;
    private boolean dolor;
    private boolean nauseas;
    private boolean fatiga;
    private boolean se_sensible;
    private boolean hinchazon;
    private boolean constipacion;
    private boolean calambres;
    private boolean sangrado;
    private boolean feliz;
    private boolean triste;
    private boolean sensible;
    private boolean ira;
    private boolean angustia;
    private boolean confusion;
    private boolean tranquilidad;
    private boolean disgusto;

    ArrayList<Sintomas> list = new ArrayList();
    String fecha;

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public ArrayList<Sintomas> getList() {
        return list;
    }

    public void setList(ArrayList<Sintomas> list) {
        this.list = list;
    }
    
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Boolean getNauseas() {
        return nauseas;
    }

    public void setNauseas(Boolean nauseas) {
        this.nauseas = nauseas;
    }

    public Boolean getFatiga() {
        return fatiga;
    }

    public void setFatiga(Boolean fatiga) {
        this.fatiga = fatiga;
    }

    public Boolean getSe_sensible() {
        return se_sensible;
    }

    public void setSe_sensible(Boolean se_sensible) {
        this.se_sensible = se_sensible;
    }

    public Boolean getHinchazon() {
        return hinchazon;
    }

    public void setHinchazon(Boolean hinchazon) {
        this.hinchazon = hinchazon;
    }

    public Boolean getConstipacion() {
        return constipacion;
    }

    public void setConstipacion(Boolean constipacion) {
        this.constipacion = constipacion;
    }

    public Boolean getCalambres() {
        return calambres;
    }

    public void setCalambres(Boolean calambres) {
        this.calambres = calambres;
    }

    public Boolean getSangrado() {
        return sangrado;
    }

    public void setSangrado(Boolean sangrado) {
        this.sangrado = sangrado;
    }

    public Boolean getFeliz() {
        return feliz;
    }

    public void setFeliz(Boolean feliz) {
        this.feliz = feliz;
    }

    public Boolean getTriste() {
        return triste;
    }

    public void setTriste(Boolean triste) {
        this.triste = triste;
    }

    public Boolean getSensible() {
        return sensible;
    }

    public void setSensible(Boolean sensible) {
        this.sensible = sensible;
    }

    public Boolean getIra() {
        return ira;
    }

    public void setIra(Boolean ira) {
        this.ira = ira;
    }

    public Boolean getAngustia() {
        return angustia;
    }

    public void setAngustia(Boolean angustia) {
        this.angustia = angustia;
    }

    public Boolean getConfusion() {
        return confusion;
    }

    public void setConfusion(Boolean confusion) {
        this.confusion = confusion;
    }

    public Boolean getTranquilidad() {
        return tranquilidad;
    }

    public void setTranquilidad(Boolean tranquilidad) {
        this.tranquilidad = tranquilidad;
    }

    public Boolean getDisgusto() {
        return disgusto;
    }

    public void setDisgusto(Boolean disgusto) {
        this.disgusto = disgusto;
    }

    public String getNotas() {
        return notas;
    }

    public void setNotas(String notas) {
        this.notas = notas;
    }
    String notas;

    public Boolean getVomito() {
        return vomito;
    }

    public void setVomito(Boolean vomito) {
        this.vomito = vomito;
    }

    public Boolean getDolor() {
        return dolor;
    }

    public void setDolor(Boolean dolor) {
        this.dolor = dolor;
    }

}
