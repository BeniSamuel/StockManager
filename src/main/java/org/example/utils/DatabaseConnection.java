package org.example.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

    private static String url = "jdbc:postgresql://localhost:5432/products";
    private static String user = "postgres";
    private static String password = "beni@ish";
    public static Connection conn;

//    public static Connection getConnection() {
//        try ( Connection conn = DriverManager.getConnection(url,user,password)) {
//           if ( conn != null ) {
//               System.out.println("Connected to the database!");
//           }
//           else {
//               System.out.println("Failed to make connection!");
//           }
//        } catch (SQLException e) {
//            System.err.println("Failed to establish a database connection:");
//            e.printStackTrace();
//        }
//        return conn;
//    }

    public static Connection getConnection () {
        try {
            Class.forName("org.postgresql.Driver");
            return DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException e) {
            System.out.println("JDBC Driver not found!");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Database Connection Failed");
            e.printStackTrace();
        }
        return null;
    }

    public boolean isConnected() {
        try {
            return conn != null && !conn.isClosed();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}