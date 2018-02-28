package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	public static void initConnect() {
	      try {
	         Class.forName("oracle.jdbc.driver.OracleDriver");
	         System.out.println("Driver Loading Success!!");
	      } catch (ClassNotFoundException e) {
	         e.printStackTrace();
	      }
	   }

	   public static Connection makeConnection() {

	      Connection conn = null;

	      try {
	    	  	conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr", "hr");
	         //conn = DriverManager.getConnection("jdbc:oracle:thin:@myoracle.czzpf0jkqsrj.ap-northeast-2.rds.amazonaws.com:1521:oracle","root", "Rudtjr1216!");

	         System.out.println("DB Connection Success");
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }

	      return conn;
	   }
}
