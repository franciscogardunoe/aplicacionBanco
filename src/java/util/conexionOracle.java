/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author franc
 */
public class conexionOracle {

    Connection conexion;

    public Connection getConexion() {
        return conexion;
    }

    public void setConexion(Connection conexion) {
        this.conexion = conexion;
    }

    public conexionOracle obtenerConexion() {
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            String url = "jdbc:oracle:thin:@localhost:1521:XE";
            conexion = DriverManager.getConnection(url,"SYSTEM", "root");
            if (conexion != null) {
                System.out.println("Conexión éxitosa a la base de datos :)");
            } else {
                System.out.println("Ha fallado la conexión a la base de datos :(");
            }
        } catch (Exception e) {
            System.out.println("Excepción: "+e.getMessage());
        }
        return this;
    }

    public static void main(String[] args) {
        conexionOracle obconeccion = new conexionOracle();
        obconeccion.obtenerConexion();
    }

}
