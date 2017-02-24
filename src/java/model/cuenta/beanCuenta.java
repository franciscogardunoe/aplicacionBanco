/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.cuenta;

import model.cliente.beanCliente;
import model.tipoCuenta.beanTipoCuenta;

/**
 *
 * @author franc
 */
public class beanCuenta {
    private int idCuenta;
    private String fechaCreacion;
    private double saldo;
    private beanCliente cliente;
    private beanTipoCuenta tipoCuenta;

    public int getIdCuenta() {
        return idCuenta;
    }

    public void setIdCuenta(int idCuenta) {
        this.idCuenta = idCuenta;
    }

    public String getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(String fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public double getSaldo() {
        return saldo;
    }

    public void setSaldo(double saldo) {
        this.saldo = saldo;
    }

    public beanCliente getCliente() {
        return cliente;
    }

    public void setCliente(beanCliente cliente) {
        this.cliente = cliente;
    }

    public beanTipoCuenta getTipoCuenta() {
        return tipoCuenta;
    }

    public void setTipoCuenta(beanTipoCuenta tipoCuenta) {
        this.tipoCuenta = tipoCuenta;
    }

    public beanCuenta() {
    }
    
}
