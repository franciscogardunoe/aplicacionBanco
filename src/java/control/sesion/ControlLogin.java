/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control.sesion;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;
import java.util.Map;
import javax.ejb.SessionBean;
import model.usuario.beanUsuario;
import model.usuario.daoUsuario;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author redes1
 */
public class ControlLogin extends ActionSupport implements SessionAware {

    private Map session;
    private String usuario;
    private String contrasexa;
    private String mensaje;
    private beanUsuario datosUsuario;

    public String iniciarSesion() {
        if (usuario != null && contrasexa != null) {
            daoUsuario daoU = new daoUsuario();
            try {
                setDatosUsuario(daoU.iniciarSesion(usuario, contrasexa));
                if (datosUsuario != null) {
                    if (datosUsuario.getRol().getIdRol() == 1) {
                        mensaje = "Bienvenido Superusuario";
                        session = ActionContext.getContext().getSession();
                        session.put("logueado", "si");
                        session.put("idRol", datosUsuario.getRol().getIdRol());
                        session.put("rol", datosUsuario.getRol().getNombre());
                        session.put("idUsuario", datosUsuario.getIdUsuario());
                        return "superusuario";
                    } else if (datosUsuario.getRol().getIdRol() == 2) {
                        mensaje = "Bienvenido Ejecutivo";
                        session = ActionContext.getContext().getSession();
                        session.put("logueado", "si");
                        session.put("idRol", datosUsuario.getRol().getIdRol());
                        session.put("rol", datosUsuario.getRol().getNombre());
                        session.put("idUsuario", datosUsuario.getIdUsuario());
                        return "ejecutivo";
                    } else if (datosUsuario.getRol().getIdRol() == 3) {
                        mensaje = "Bienvenido cliente";
                        session = ActionContext.getContext().getSession();
                        session.put("logueado", "si");
                        session.put("idRol", datosUsuario.getRol().getIdRol());
                        session.put("rol", datosUsuario.getRol().getNombre());
                        session.put("idUsuario", datosUsuario.getIdUsuario());
                        return "cliente";
                    } else {
                        return ERROR;
                    }
                } else {
                    mensaje = "Correo y/o contraseña incorrectos";
                    return ERROR;
                }
            } catch (Exception e) {
                mensaje = "Correo y/o contraseña incorrectos";
                return ERROR;
            }
        } else {
            mensaje = "Ingresa correo electrónico y contraseña";
            return ERROR;
        }
    }

    public String cerrarSesion() {
        session = ActionContext.getContext().getSession();
        session.clear();
        return SUCCESS;
    }

    public Map getSession() {
        return session;
    }

    public void setSession(Map session) {
        this.session = session;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getContrasexa() {
        return contrasexa;
    }

    public void setContrasexa(String contrasexa) {
        this.contrasexa = contrasexa;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public beanUsuario getDatosUsuario() {
        return datosUsuario;
    }

    public void setDatosUsuario(beanUsuario datosUsuario) {
        this.datosUsuario = datosUsuario;
    }

}
