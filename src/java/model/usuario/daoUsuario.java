/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.usuario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.rol.beanRol;
import util.ConexionSQL;

/**
 *
 * @author franc
 */
public class daoUsuario {

    Connection conexion;
    PreparedStatement pstm;
    ResultSet rs;

    public beanUsuario iniciarSesion(String usuario,String contrasena) {
        beanUsuario unUsuario = new beanUsuario();
        Statement st = null;
        try {
            conexion = ConexionSQL.obtenerConexion();
            pstm = conexion.prepareStatement("EXECUTE pa_mostrarUsuarios");
            rs = pstm.executeQuery();
            while (rs.next()) {
                if (rs.getString("correoElectronico").equals(usuario) && rs.getString("contrasena").equals(contrasena)) {
                    unUsuario.setIdUsuario(rs.getInt("idUsuario"));
                    beanRol unRol = new beanRol();
                    unRol.setIdRol(rs.getInt("idRol"));
                    unRol.setNombre(rs.getString("nombre"));
                    unUsuario.setRol(unRol);
                    break;
                }
            }
        } catch (SQLException ex) {
            System.out.println("Excepción SQL: " + ex.getMessage());
        } catch (Exception e) {
            System.out.println("Excepción: " + e.getMessage());
        } finally {
            try {
                if (conexion != null) {
                    conexion.close();
                }
                if (st != null) {
                    st.close();
                }
            } catch (Exception exc) {
                System.out.println("Excepción: " + exc.getMessage());
            }
        }
        return unUsuario;
    }
    public boolean consultarCorreo(String correo) {
        boolean resultado = false;
        try {
            conexion = ConexionSQL.obtenerConexion();
            pstm = conexion.prepareStatement("EXECUTE pa_consultarCorreo ?");
            pstm.setString(1, correo);
            rs = pstm.executeQuery();
            int numero=0;
            while(rs.next()){
                numero++;
            }
            if(numero>0){
                resultado=true;
            }          
        } catch (SQLException ex) {
            System.err.println("Excepción SQL: " + ex.getMessage());
        } catch (Exception e) {
            System.err.println("Excepción: " + e.getMessage());
        } finally {
            try {
                if (conexion != null) {
                    conexion.close();
                }
                if (pstm != null) {
                    pstm.close();
                }
            } catch (Exception exc) {
                System.err.println("Excepción: " + exc.getMessage());
            }
        }
        return resultado;
    }

}
