/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.tipoCuenta;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import util.ConexionSQL;

/**
 *
 * @author franc
 */
public class daoTipoCuenta {

    Connection conexion;
    PreparedStatement pstm;
    ResultSet rs;

    public List<beanTipoCuenta> consultarTiposCuentas() {
        List<beanTipoCuenta> lista= new ArrayList<>();
        try {
            conexion = ConexionSQL.obtenerConexion();
            pstm = conexion.prepareStatement("pa_mostrarTiposCuentas");
            rs = pstm.executeQuery();
            while (rs.next()) {
                beanTipoCuenta tipo=new beanTipoCuenta();
                tipo.setIdTipoCuenta(rs.getInt("idTipoCuenta"));
                tipo.setNombre(rs.getString("nombre"));
                lista.add(tipo);
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
        return lista;
    }
}
