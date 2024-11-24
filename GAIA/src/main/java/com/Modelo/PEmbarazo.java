/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Modelo;

/**
 *
 */
public class PEmbarazo {
    private String sexo;
    private String semanas;

    public PEmbarazo(String semanas,String sexo) {
        this.semanas = semanas;
        this.sexo = sexo;
    }

    public PEmbarazo() {
        
    }
    
    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }
    

    public String getSemanas() {
        return semanas;
    }

    public void setSemanas(String semanas) {
        this.semanas = semanas;
    }

}
