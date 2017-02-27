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
import java.util.ArrayList;
import java.util.List;
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

    public boolean registrarEjecutivo(beanEjecutivo unCliente) {
        boolean resultado = false;
        try {
            conexion = ConexionSQL.obtenerConexion();
            pstm = conexion.prepareStatement("EXECUTE pa_registarEjecutivo ?,?,?,?,?,?,?,?,?,?");
            pstm.setString(1, unCliente.getNombre());
            pstm.setString(2, unCliente.getApellidos());
            pstm.setString(3, unCliente.getFechaNacimiento());
            pstm.setString(4, unCliente.getDireccion());
            pstm.setString(5, unCliente.getTelefono());
            pstm.setDouble(6, unCliente.getSueldo());
            pstm.setString(7, unCliente.getNss());
            pstm.setString(8, unCliente.getRfc());
            pstm.setString(9, unCliente.getUsuario().getCorreoElectronico());
            pstm.setString(10, unCliente.getUsuario().getContrasena());
            resultado = pstm.executeUpdate() == 1;
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
    
    public List<beanEjecutivo> buscarEjecutivo(String criterio) {
        List<beanEjecutivo> lista = new ArrayList<>();
        try {
            conexion = ConexionSQL.obtenerConexion();
            pstm = conexion.prepareStatement("pa_buscarEjecutivo ?");
            pstm.setString(1,criterio);
            rs = pstm.executeQuery();
            while (rs.next()) {
                beanEjecutivo unCliente=new beanEjecutivo();
                unCliente.setIdEjecutivo(rs.getInt("idEjecutivo"));
                unCliente.setNombre(rs.getString("nombre"));
                unCliente.setApellidos(rs.getString("apellidos"));
                unCliente.setFechaNacimiento(rs.getString("fechaNacimiento"));
                beanUsuario unUsuario = new beanUsuario();
                unUsuario.setCorreoElectronico(rs.getString("correoElectronico"));
                unCliente.setUsuario(unUsuario);
                lista.add(unCliente);
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
    
    public beanEjecutivo consultarEjecutivoModificar (int idEjecutivo) {
        beanEjecutivo unEjecutivo = new beanEjecutivo();
        try {
            conexion = ConexionSQL.obtenerConexion();
            pstm = conexion.prepareStatement("pa_mostrarEjecutivoModificar ?");
            pstm.setInt(1, idEjecutivo);
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
    
    public boolean modificarEjecutivo(beanEjecutivo unCliente) {
        boolean resultado = false;
        try {
            conexion = ConexionSQL.obtenerConexion();
            pstm = conexion.prepareStatement("EXECUTE pa_modificarEjecutivo ?,?,?,?,?,?,?,?,?,?");
            pstm.setString(1, unCliente.getNombre());
            pstm.setString(2, unCliente.getApellidos());
            pstm.setString(3, unCliente.getFechaNacimiento());
            pstm.setString(4, unCliente.getDireccion());
            pstm.setString(5, unCliente.getTelefono());
            pstm.setDouble(6, unCliente.getSueldo());
            pstm.setString(7, unCliente.getNss());
            pstm.setString(8, unCliente.getRfc());
            pstm.setString(9, unCliente.getUsuario().getCorreoElectronico());
            pstm.setInt(10, unCliente.getIdEjecutivo());
            resultado = pstm.executeUpdate() == 1;
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
    
    public boolean eliminarEjecutivo(int idEjecutivo) {
        boolean eliminado = false;
        try {
            conexion = ConexionSQL.obtenerConexion();
            pstm = conexion.prepareStatement("pa_eliminarEjecutivo ?");
            pstm.setInt(1, idEjecutivo);
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
}
