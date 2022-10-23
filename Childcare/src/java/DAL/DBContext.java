package DAL;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.time.LocalDate;

public class DBContext {

    /*USE BELOW METHOD FOR YOUR DATABASE CONNECTION FOR BOTH SINGLE AND MULTILPE SQL SERVER INSTANCE(s)*/
 /*DO NOT EDIT THE BELOW METHOD, YOU MUST USE ONLY THIS ONE FOR YOUR DATABASE CONNECTION*/
    public static Connection getConnection() throws Exception {
        String url = "jdbc:sqlserver://" + serverName + ":" + portNumber
                + ";databaseName=" + dbName;//+"; integratedSecurity=true";
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(url, userID, password);
//        return DriverManager.getConnection(url);
    }

    public static Date getSQLDate(LocalDate date) {
        return java.sql.Date.valueOf(date);
    }

    public static LocalDate getUtilDate(Date sqlDate) {
        return sqlDate.toLocalDate();
    }



    private static String serverName = "localhost";
    private static String dbName = "SWP";
    private static String portNumber = "1311";
    private static String userID = "sa";
    private static String password = "123456";

    
//    public static void main(String[] args) throws Exception {
//        Connection con = DBContext.getConnection();
//        System.out.print(con);
//    }
}