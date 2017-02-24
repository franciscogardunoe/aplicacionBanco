/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control.sesion;

import com.opensymphony.xwork2.ActionSupport;

/**
 *
 * @author redes1
 */
public class ControlRestringido extends ActionSupport {
    
    public String accionRestringida(){
        System.out.println("Estamos ejecutando una acción para varios logueados");
        return SUCCESS;
    }
}
