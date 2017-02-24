/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.cliente;

import model.cuenta.beanCuenta;
import model.tipoCuenta.beanTipoCuenta;
import model.usuario.beanUsuario;

/**
 *
 * @author franc
 */
public class beanCliente {
    private int idCliente;
    private String nombre;
    private String apellidos;
    private String fechaNacimiento;
    private String direccion;
    private String telefono;
    private int acceso;
    private beanUsuario usuario;
    
    private beanCuenta cuenta;
    private beanTipoCuenta tipo;
    
    private int numeroCuentas;
    private double saldoTotal;

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public int getAcceso() {
        return acceso;
    }

    public void setAcceso(int acceso) {
        this.acceso = acceso;
    }

    public beanUsuario getUsuario() {
        return usuario;
    }

    public void setUsuario(beanUsuario usuario) {
        this.usuario = usuario;
    }

    public beanCliente() {
    }

    public int getNumeroCuentas() {
        return numeroCuentas;
    }

    public void setNumeroCuentas(int numeroCuentas) {
        this.numeroCuentas = numeroCuentas;
    }

    public double getSaldoTotal() {
        return saldoTotal;
    }

    public void setSaldoTotal(double saldoTotal) {
        this.saldoTotal = saldoTotal;
    }

    public beanCuenta getCuenta() {
        return cuenta;
    }

    public void setCuenta(beanCuenta cuenta) {
        this.cuenta = cuenta;
    }

    public beanTipoCuenta getTipo() {
        return tipo;
    }

    public void setTipo(beanTipoCuenta tipo) {
        this.tipo = tipo;
    }
        
}
