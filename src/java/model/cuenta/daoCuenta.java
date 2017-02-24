/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.cuenta;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.tipoCuenta.beanTipoCuenta;
import util.ConexionSQL;

/**
 *
 * @author franc
 */
public class daoCuenta {

    Connection conexion;
    PreparedStatement pstm;
    ResultSet rs;

    public List<beanCuenta> consultaCategoria(int idCategoria) {
        List<beanCuenta> lista = new ArrayList<>();
        try {
            conexion = ConexionSQL.obtenerConexion();
            pstm = conexion.prepareStatement("pa_mostrarCuentas ?");
            pstm.setInt(1, idCategoria);
            rs = pstm.executeQuery();
            while (rs.next()) {
                beanCuenta unaCuenta = new beanCuenta();
                unaCuenta.setIdCuenta(rs.getInt("idCuenta"));
                unaCuenta.setFechaCreacion(rs.getString("fechaCreacion"));
                unaCuenta.setSaldo(rs.getDouble("saldo"));
                beanTipoCuenta unTipo=new beanTipoCuenta();
                unTipo.setNombre(rs.getString("tipoCuenta"));
                unaCuenta.setTipoCuenta(unTipo);
                lista.add(unaCuenta);
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
