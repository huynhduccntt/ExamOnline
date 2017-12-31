package connect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconnect {
    public static Connection getConnecttion() {
      Connection cons = null;
         try {
            Class.forName("com.mysql.jdbc.Driver");
            cons = DriverManager.getConnection(
            		"jdbc:mysql://localhost:3306/examonline", "root", "14110356");
            //"jdbc:mysql://node177596-examonline.jelastic.servint.net/examonline", "root", "ILAqxx87348");
            System.out.println("Connected successfully");
            
         } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            System.out.println("Error connection " + e);
         }
         return cons;
    }
    public static void main(String[] args) {
         System.out.println(getConnecttion());
    }
}
