/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.usuario;

import model.rol.beanRol;

/**
 *
 * @author franc
 */
public class beanUsuario {
    private int idUsuario;
    private String correoElectronico;
    private String contrasena;
    private beanRol rol;

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getCorreoElectronico() {
        return correoElectronico;
    }

    public void setCorreoElectronico(String correoElectronico) {
        this.correoElectronico = correoElectronico;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public beanRol getRol() {
        return rol;
    }

    public void setRol(beanRol rol) {
        this.rol = rol;
    }

    public beanUsuario() {
    }
    
}
