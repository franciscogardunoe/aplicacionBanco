/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control.banco;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import java.util.List;
import java.util.Map;
import model.cliente.beanCliente;
import model.cliente.daoCliente;
import model.cuenta.beanCuenta;
import model.cuenta.daoCuenta;

/**
 *
 * @author franc
 */
public class ControlUsuario {

    private beanCliente unCliente;
    private Map session;
    private List<beanCuenta> misCuentas;

    public beanCliente getUnCliente() {
        return unCliente;
    }

    public void setUnCliente(beanCliente unCliente) {
        this.unCliente = unCliente;
    }

    public Map getSession() {
        return session;
    }

    public void setSession(Map session) {
        this.session = session;
    }

    public List<beanCuenta> getMisCuentas() {
        return misCuentas;
    }

    public void setMisCuentas(List<beanCuenta> misCuentas) {
        this.misCuentas = misCuentas;
    }

    public String cargarDatosCliente() {
        daoCliente daoC = new daoCliente();
        session = ActionContext.getContext().getSession();
        int idUsuario = Integer.parseInt(session.get("idUsuario").toString());
        setUnCliente(daoC.consultaCliente(idUsuario));
        return SUCCESS;
    }

    public String mostrarCuentasCliente() {
        daoCuenta daoCu = new daoCuenta();
        daoCliente daoC = new daoCliente();
        session = ActionContext.getContext().getSession();
        int idUsuario = Integer.parseInt(session.get("idUsuario").toString());
        setMisCuentas(daoCu.consultaCategoria(idUsuario));
        setUnCliente(daoC.consultaCliente(idUsuario));
        return SUCCESS;
    }
}
