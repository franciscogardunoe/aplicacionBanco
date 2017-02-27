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
import model.cliente.beanCliente;
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
                beanTipoCuenta unTipo = new beanTipoCuenta();
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

    public List<beanCuenta> consultaCuentasCliente(int idCliente) {
        List<beanCuenta> lista = new ArrayList<>();
        try {
            conexion = ConexionSQL.obtenerConexion();
            pstm = conexion.prepareStatement("pa_mostrarCuentasCliente ?");
            pstm.setInt(1, idCliente);
            rs = pstm.executeQuery();
            while (rs.next()) {
                beanCuenta unaCuenta = new beanCuenta();
                unaCuenta.setIdCuenta(rs.getInt("idCuenta"));
                unaCuenta.setFechaCreacion(rs.getString("fechaCreacion"));
                unaCuenta.setSaldo(rs.getDouble("saldo"));
                beanTipoCuenta unTipo = new beanTipoCuenta();
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

    public boolean eliminarCuentaUsuario(int idCuenta) {
        boolean eliminado = false;
        try {
            conexion = ConexionSQL.obtenerConexion();
            pstm = conexion.prepareStatement("pa_eliminarCuenta ?");
            pstm.setInt(1, idCuenta);
            eliminado = pstm.executeUpdate() == 1;
        } catch (SQLException esql) {
            eliminado = false;
            System.err.println("Excepción: " + esql.getMessage());
        } catch (Exception e) {
            eliminado = false;
            System.err.println("Excepción: " + e.getMessage());
        } finally {
            try {
                if (conexion != null) {
                    conexion.close();
                }
                if (pstm != null) {
                    pstm.close();
                }
            } catch (Exception ex) {
                System.err.println("Excepción: " + ex.getMessage());
            }
        }
        return eliminado;
    }

    public boolean registrarNuevaCuenta(beanCliente cliente) {
        boolean registrado = false;
        try {
            conexion = ConexionSQL.obtenerConexion();
            pstm = conexion.prepareStatement("pa_registrarNuevaCuenta ?,?,?");
            pstm.setDouble(1, cliente.getCuenta().getSaldo());
            pstm.setInt(2, cliente.getTipo().getIdTipoCuenta());
            pstm.setInt(3, cliente.getIdCliente());
            registrado = pstm.executeUpdate() == 1;
        } catch (SQLException esql) {
            registrado = false;
            System.err.println("Excepción SQL: " + esql.getMessage());
        } catch (Exception e) {
            registrado = false;
            System.err.println("Excepción programacion: " + e.getMessage());
        } finally {
            try {
                if (conexion != null) {
                    conexion.close();
                }
                if (pstm != null) {
                    pstm.close();
                }
            } catch (Exception ex) {
                System.err.println("Excepción: " + ex.getMessage());
            }
        }
        return registrado;
    }

}
