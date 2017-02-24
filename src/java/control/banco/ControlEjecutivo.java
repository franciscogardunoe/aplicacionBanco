/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control.banco;

import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import java.util.List;
import java.util.Map;
import model.cliente.beanCliente;
import model.cliente.daoCliente;
import model.cuenta.beanCuenta;
import model.ejecutivo.beanEjecutivo;
import model.ejecutivo.daoEjecutivo;
import model.tipoCuenta.beanTipoCuenta;
import model.tipoCuenta.daoTipoCuenta;
import model.usuario.beanUsuario;

/**
 *
 * @author franc
 */
public class ControlEjecutivo {

    private beanEjecutivo unEjecutivo;
    private Map session;
    private beanCliente unCliente;
    private List<beanTipoCuenta> misTipos;
    private List<beanCliente> misResultados;
    private String buscar;
    private int idCliente;

    public beanEjecutivo getUnEjecutivo() {
        return unEjecutivo;
    }

    public void setUnEjecutivo(beanEjecutivo unEjecutivo) {
        this.unEjecutivo = unEjecutivo;
    }

    public Map getSession() {
        return session;
    }

    public void setSession(Map session) {
        this.session = session;
    }

    public beanCliente getUnCliente() {
        return unCliente;
    }

    public void setUnCliente(beanCliente unCliente) {
        this.unCliente = unCliente;
    }

    public List<beanTipoCuenta> getMisTipos() {
        return misTipos;
    }

    public void setMisTipos(List<beanTipoCuenta> misTipos) {
        this.misTipos = misTipos;
    }

    public List<beanCliente> getMisResultados() {
        return misResultados;
    }

    public void setMisResultados(List<beanCliente> misResultados) {
        this.misResultados = misResultados;
    }

    public String getBuscar() {
        return buscar;
    }

    public void setBuscar(String buscar) {
        this.buscar = buscar;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public String cargarDatosEjecutivo() {
        session = ActionContext.getContext().getSession();
        int idUsuario = Integer.parseInt(session.get("idUsuario").toString());
        daoEjecutivo daoE = new daoEjecutivo();
        setUnEjecutivo(daoE.consultarEjecutivo(idUsuario));
        return SUCCESS;
    }

    public String cargarTipos() {
        daoTipoCuenta daoT = new daoTipoCuenta();
        setMisTipos(daoT.consultarTiposCuentas());
        session = ActionContext.getContext().getSession();
        int idUsuario = Integer.parseInt(session.get("idUsuario").toString());
        daoEjecutivo daoE = new daoEjecutivo();
        setUnEjecutivo(daoE.consultarEjecutivo(idUsuario));
        return SUCCESS;
    }

    public String registrarCliente() {
        beanCliente unCliente = new beanCliente();
        unCliente.setNombre(getUnCliente().getNombre());
        unCliente.setApellidos(getUnCliente().getApellidos());
        unCliente.setFechaNacimiento(getUnCliente().getFechaNacimiento());
        unCliente.setDireccion(getUnCliente().getDireccion());
        unCliente.setTelefono(getUnCliente().getTelefono());
        beanUsuario unUsuario = new beanUsuario();
        unUsuario.setCorreoElectronico(getUnCliente().getUsuario().getCorreoElectronico());
        unUsuario.setContrasena(getUnCliente().getUsuario().getContrasena());
        unCliente.setUsuario(unUsuario);
        beanCuenta unaCuenta = new beanCuenta();
        unaCuenta.setSaldo(getUnCliente().getCuenta().getSaldo());
        unCliente.setCuenta(unaCuenta);
        beanTipoCuenta unTipo = new beanTipoCuenta();
        unTipo.setIdTipoCuenta(getUnCliente().getTipo().getIdTipoCuenta());
        unCliente.setTipo(unTipo);
        daoCliente daoC = new daoCliente();
        if (daoC.registrarCliente(unCliente)) {
            return SUCCESS;
        } else {
            return ERROR;
        }
    }

    public String buscarCliente() {
        session = ActionContext.getContext().getSession();
        int idUsuario = Integer.parseInt(session.get("idUsuario").toString());
        daoEjecutivo daoE = new daoEjecutivo();
        setUnEjecutivo(daoE.consultarEjecutivo(idUsuario));
        daoCliente daoC = new daoCliente();
        setMisResultados(daoC.buscarCliente(getBuscar()));
        return SUCCESS;
    }

    public String cargarDatosCliente() {
        daoCliente daoCl = new daoCliente();
        setUnCliente(daoCl.consultarClienteModificar(getIdCliente()));
        return SUCCESS;
    }
    
    public String modificarCliente(){
        beanCliente unCliente = new beanCliente();
        unCliente.setNombre(getUnCliente().getNombre());
        unCliente.setApellidos(getUnCliente().getApellidos());
        unCliente.setFechaNacimiento(getUnCliente().getFechaNacimiento());
        unCliente.setDireccion(getUnCliente().getDireccion());
        unCliente.setTelefono(getUnCliente().getTelefono());
        beanUsuario unUsuario = new beanUsuario();
        unUsuario.setCorreoElectronico(getUnCliente().getUsuario().getCorreoElectronico());
        unCliente.setUsuario(unUsuario);  
        unCliente.setIdCliente(getIdCliente());
        daoCliente daoC = new daoCliente();
        if (daoC.modificarCliente(unCliente)) {
            return SUCCESS;
        } else {
            return ERROR;
        }
    }
}
