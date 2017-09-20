/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;
import java.sql.Connection;
import java.sql.DriverManager; 
import java.sql.PreparedStatement;
import java.sql.ResultSet; 
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Simon
 */
public class IHOTEL_DB {
    String DB_URL_SQLSERVER = "jdbc:sqlserver://localhost:1433;databaseName=aiad077_db";
    String DB_URL_MYSQL = "jdbc:mysql://localhost:3306/aiad077_db";
    String DB_USER = "aiad077";
    String DB_PASSWORD = "aiad077";
    Connection cnnct = null;
    Statement stmnt = null;
    PreparedStatement pstmnt = null;
    ResultSet rs = null;
    ArrayList list=new ArrayList();
    String statement;
    private PreparedStatement ps = null;

    public Connection getConnection(){
        
        Connection con=null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            con = DriverManager.getConnection(DB_URL_SQLSERVER, DB_USER, DB_PASSWORD);
        //Class.forName("com.mysql.jdbc.Driver"); 
        //con = DriverManager.getConnection(DB_URL_MYSQL, DB_USER, DB_PASSWORD);
        } catch (SQLException ex) {
            Logger.getLogger(IHOTEL_DB.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            return con;
        }
    }
}
