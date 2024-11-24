/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Modelo;

/**
 *
 */
public class Usuario {
    private String nombre;
    private String contra;
    private String correo;
    private String apodo;
    private boolean existe;

    public boolean getExiste() {
        return existe;
    }

    public void setExiste(boolean existe) {
        this.existe = existe;
    }

    
    
    public Usuario(String nombre, String correo, String contra, String apodo) {
        this.nombre = nombre;
        this.contra = contra;
        this.correo = correo;
        this.apodo = apodo;
    }

    public Usuario() {
        
    }

    

    public String getApodo() {
        return apodo;
    }

    public void setApodo(String apodo) {
        this.apodo = apodo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getContra() {
        return contra;
    }

    public void setContra(String contra) {
        this.contra = contra;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }
}
