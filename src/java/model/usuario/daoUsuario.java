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
//    public boolean registrarCategoria(BeanCategoria unaCategoria) {
//        boolean resultado = false;
//        try {
//            conexion = ConexionSQL.obtenerConexion();
//            pstm = conexion.prepareStatement("EXECUTE pa_insertarCategoria ?,?");
//            pstm.setString(1, unaCategoria.getNombreCategoria());
//            pstm.setString(2, unaCategoria.getDescripcionCategoria());
//            resultado = pstm.executeUpdate() == 1;
//        } catch (SQLException ex) {
//            System.err.println("Excepción SQL: " + ex.getMessage());
//        } catch (Exception e) {
//            System.err.println("Excepción: " + e.getMessage());
//        } finally {
//            try {
//                if (conexion != null) {
//                    conexion.close();
//                }
//                if (pstm != null) {
//                    pstm.close();
//                }
//            } catch (Exception exc) {
//                System.err.println("Excepción: " + exc.getMessage());
//            }
//        }
//        return resultado;
//    }

//    public static void main(String[] args) {
//        DaoCategoria objD = new DaoCategoria();
//        List<BeanCategoria> misCategorias;
//        misCategorias = objD.listarCategorias();
//        System.out.println("" + misCategorias);
//    }
//
//    public BeanCategoria consultaCategoria(int idCategoria) {
//        BeanCategoria unaCategoria = new BeanCategoria();
//        try {
//            conexion = ConexionSQL.obtenerConexion();
//            pstm = conexion.prepareStatement("pa_mostrarCategoria ?");
//            pstm.setInt(1, idCategoria);
//            rs = pstm.executeQuery();
//            while (rs.next()) {
//                unaCategoria.setIdCategoria(rs.getInt("idCategoria"));
//                unaCategoria.setNombreCategoria(rs.getString("nombreCategoria"));
//                unaCategoria.setDescripcionCategoria(rs.getString("descripcionCategoria"));
//            }
//        } catch (SQLException esql) {
//            System.out.println("Excepción SQL: " + esql.getMessage());
//        } catch (Exception e) {
//            System.out.println("Excepción: " + e.getMessage());
//        } finally {
//            try {
//                if (conexion != null) {
//                    conexion.close();
//                }
//                if (pstm != null) {
//                    pstm.close();
//                }
//            } catch (Exception ex) {
//                System.out.println("Excepción: " + ex.getMessage());
//            }
//        }
//        return unaCategoria;
//    }
//
//    public boolean modificarCategoria(BeanCategoria categoria) {
//        boolean modificado = false;
//        try {
//            conexion = ConexionSQL.obtenerConexion();
//            pstm = conexion.prepareStatement("pa_modificarCategoria ?,?,?");
//            pstm.setInt(1, categoria.getIdCategoria());
//            pstm.setString(2, categoria.getNombreCategoria());
//            pstm.setString(3, categoria.getDescripcionCategoria());
//            modificado = pstm.executeUpdate() == 1;
//        } catch (SQLException esql) {
//            modificado = false;
//            System.err.println("Excepción: " + esql.getMessage());
//        } catch (Exception e) {
//            modificado = false;
//            System.err.println("Excepción: " + e.getMessage());
//        } finally {
//            try {
//                if (conexion != null) {
//                    conexion.close();
//                }
//                if (pstm != null) {
//                    pstm.close();
//                }
//            } catch (Exception ex) {
//                System.err.println("Excepción: " + ex.getMessage());
//            }
//        }
//        return modificado;
//    }
//
//    public boolean eliminarCategoria(int idCategoria) {
//        boolean eliminado = false;
//        try {
//            conexion = ConexionSQL.obtenerConexion();
//            pstm = conexion.prepareStatement("pa_eliminarCategoria ?");
//            pstm.setInt(1, idCategoria);
//            eliminado = pstm.executeUpdate() == 1;
//        } catch (SQLException esql) {
//            eliminado = false;
//            System.err.println("Excepción: " + esql.getMessage());
//        } catch (Exception e) {
//            eliminado = false;
//            System.err.println("Excepción: " + e.getMessage());
//        } finally {
//            try {
//                if (conexion != null) {
//                    conexion.close();
//                }
//                if (pstm != null) {
//                    pstm.close();
//                }
//            } catch (Exception ex) {
//                System.err.println("Excepción: " + ex.getMessage());
//            }
//        }
//        return eliminado;
//    }
}
