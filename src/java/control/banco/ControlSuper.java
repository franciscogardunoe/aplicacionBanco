/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control.banco;

import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;
import java.util.List;
import model.ejecutivo.beanEjecutivo;
import model.ejecutivo.daoEjecutivo;
import model.usuario.beanUsuario;

/**
 *
 * @author franc
 */
public class ControlSuper {

    public beanEjecutivo unCliente;
    public List<beanEjecutivo> misResultados;
    public String buscar;
    public int idEjecutivo;

    public beanEjecutivo getUnCliente() {
        return unCliente;
    }

    public void setUnCliente(beanEjecutivo unCliente) {
        this.unCliente = unCliente;
    }

    public List<beanEjecutivo> getMisResultados() {
        return misResultados;
    }

    public void setMisResultados(List<beanEjecutivo> misResultados) {
        this.misResultados = misResultados;
    }

    public String getBuscar() {
        return buscar;
    }

    public void setBuscar(String buscar) {
        this.buscar = buscar;
    }

    public int getIdEjecutivo() {
        return idEjecutivo;
    }

    public void setIdEjecutivo(int idEjecutivo) {
        this.idEjecutivo = idEjecutivo;
    }

    public String registrarEjecutivo() {
        beanEjecutivo unEjecutivo = new beanEjecutivo();
        unEjecutivo.setNombre(getUnCliente().getNombre());
        unEjecutivo.setApellidos(getUnCliente().getApellidos());
        unEjecutivo.setFechaNacimiento(getUnCliente().getFechaNacimiento());
        unEjecutivo.setDireccion(getUnCliente().getDireccion());
        unEjecutivo.setTelefono(getUnCliente().getTelefono());
        unEjecutivo.setSueldo(getUnCliente().getSueldo());
        unEjecutivo.setNss(getUnCliente().getNss());
        unEjecutivo.setRfc(getUnCliente().getRfc());
        beanUsuario unUsuario = new beanUsuario();
        unUsuario.setCorreoElectronico(getUnCliente().getUsuario().getCorreoElectronico());
        unUsuario.setContrasena(getUnCliente().getUsuario().getContrasena());
        unEjecutivo.setUsuario(unUsuario);
        daoEjecutivo daoE = new daoEjecutivo();
        if (daoE.registrarEjecutivo(unEjecutivo)) {
            return SUCCESS;
        } else {
            return ERROR;
        }
    }

    public String buscarEjecutivo() {
        daoEjecutivo daoE = new daoEjecutivo();
        setMisResultados(daoE.buscarEjecutivo(getBuscar()));
        return SUCCESS;
    }

    public String consultarEjecutivoModificar() {
        daoEjecutivo daoE = new daoEjecutivo();
        setUnCliente(daoE.consultarEjecutivoModificar(getIdEjecutivo()));
        return SUCCESS;
    }
    
    public String modificarEjecutivo(){
        beanEjecutivo unEjecutivo = new beanEjecutivo();
        unEjecutivo.setIdEjecutivo(getUnCliente().getIdEjecutivo());
        unEjecutivo.setNombre(getUnCliente().getNombre());
        unEjecutivo.setApellidos(getUnCliente().getApellidos());
        unEjecutivo.setFechaNacimiento(getUnCliente().getFechaNacimiento());
        unEjecutivo.setDireccion(getUnCliente().getDireccion());
        unEjecutivo.setTelefono(getUnCliente().getTelefono());
        unEjecutivo.setSueldo(getUnCliente().getSueldo());
        unEjecutivo.setNss(getUnCliente().getNss());
        unEjecutivo.setRfc(getUnCliente().getRfc());
        beanUsuario unUsuario = new beanUsuario();
        unUsuario.setCorreoElectronico(getUnCliente().getUsuario().getCorreoElectronico());
        unEjecutivo.setUsuario(unUsuario);
        daoEjecutivo daoE = new daoEjecutivo();
        if (daoE.modificarEjecutivo(unEjecutivo)) {
            setUnCliente(daoE.consultarEjecutivoModificar(getUnCliente().getIdEjecutivo()));
            return SUCCESS;
        } else {
            return ERROR;
        }    
    }
    
    public String eliminarEjecutivo(){
        daoEjecutivo dao=new daoEjecutivo();
        if(dao.eliminarEjecutivo(getIdEjecutivo())){
            return SUCCESS;
        }else{
            return ERROR;
        }
    }
}
