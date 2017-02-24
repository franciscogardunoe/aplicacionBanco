/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.ejecutivo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.cliente.beanCliente;
import model.usuario.beanUsuario;
import util.ConexionSQL;

/**
 *
 * @author franc
 */
public class daoEjecutivo {
    
    Connection conexion;
    PreparedStatement pstm;
    ResultSet rs;
    
    public beanEjecutivo consultarEjecutivo(int idUsuario) {
        beanEjecutivo unEjecutivo = new beanEjecutivo();
        try {
            conexion = ConexionSQL.obtenerConexion();
            pstm = conexion.prepareStatement("pa_mostrarEjecutivo ?");
            pstm.setInt(1, idUsuario);
            rs = pstm.executeQuery();
            while (rs.next()) {
                unEjecutivo.setIdEjecutivo(rs.getInt("idEjecutivo"));
                unEjecutivo.setNombre(rs.getString("nombre"));
                unEjecutivo.setApellidos(rs.getString("apellidos"));
                unEjecutivo.setFechaNacimiento(rs.getString("fechaNacimiento"));
                unEjecutivo.setDireccion(rs.getString("direccion"));
                unEjecutivo.setTelefono(rs.getString("telefono"));
                unEjecutivo.setSueldo(rs.getDouble("sueldo"));
                unEjecutivo.setNss(rs.getString("nss"));
                unEjecutivo.setRfc(rs.getString("rfc"));
                beanUsuario unUsuario = new beanUsuario();
                unUsuario.setCorreoElectronico(rs.getString("correoElectronico"));
                unEjecutivo.setUsuario(unUsuario);
            }
        } catch (SQLException esql) {
            System.out.println("Excepción SQL: " + esql.getMessage());
        } catch (Exception e) {
            System.out.println("Excepción: " + e.getMessage());
        } finally {
            try {
                if (conexion != null) {
                    conexion.close();
                }
                if (pstm != null) {
                    pstm.close();
                }
            } catch (Exception ex) {
                System.out.println("Excepción: " + ex.getMessage());
            }
        }
        return unEjecutivo;
    }
}
