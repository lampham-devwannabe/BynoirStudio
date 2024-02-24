package dal;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBContext {

    protected Connection connection;

    public Connection getConnection() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String username = "sa";
            String password = "sa";
            String url = "jdbc:sqlserver://localhost:1433;databaseName=BynoirDB";
            connection = DriverManager.getConnection(url, username, password);
            return connection;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
//    public static void main(String[] args) {
//   
//       String xServer = "localhost";
//       String xPort = "1433";
//       String xDbName = "BynoirDB";
//       String xUrl = "jdbc:sqlserver://" + xServer + ":" + xPort + ";databaseName = " + xDbName;
//    
//       String xUser = "sa";
//       String xPW = "sa";
//       Connection con = null; 
//       try {
//         Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//         con = DriverManager.getConnection(xUrl,xUser,xPW);
//         System.out.println("Connection successful.");
//       }
//       catch(Exception e) {
//         System.out.println("Connection failed.");
//       }
//    }
}