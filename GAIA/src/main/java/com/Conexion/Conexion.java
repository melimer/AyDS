/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Conexion;
import java.sql.*;
/**
 *
 */
public class Conexion {
    private Connection con;

    public Connection getCon() {
        return con;
    }

    public void setCon(Connection con) {
        this.con = con;
    }

    public void conectar() throws Exception {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String databaseUrl = "jdbc:mysql://localhost:3306/GAIA?useSSL=false";
            String user = "root";
            String pswd = "root";
            con = DriverManager.getConnection(databaseUrl, user, pswd);
        } catch (ClassNotFoundException | SQLException e) {
            throw e;
        }
    }

    public void desconectar() throws Exception {
        try {
            if (con != null) {
                if (con.isClosed() == false) {
                    con.isClosed();
                }
            }
        } catch (SQLException e) {
            throw e;
        }
    }
}
