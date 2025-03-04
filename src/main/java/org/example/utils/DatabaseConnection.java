package org.example.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

    private String Dburl = "jdbc:postgres://localhost:5432/products";
    private String username = "postgres";
    private String password = "beni@ish";
    public Connection conn;

    public Connection getConnection () {
        try {
          conn = DriverManager.getConnection(Dburl, username, password);
        }
        catch ( SQLException e ) {
            e.printStackTrace();
        }
        return conn;
    }

    public boolean isConnected () {
        try {
            return conn == null || conn.isClosed();
        }
        catch ( SQLException e ) {
            return true;
        }
    }

}
