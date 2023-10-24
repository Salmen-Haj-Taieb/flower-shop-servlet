package tn.enis.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class CreateDB {
	   static final String DB_URL = "jdbc:mysql://localhost/";
	   static final String USER = "root";
	   static final String PASS = "";
	   final static String SQL="INSERT INTO user (nameCtg) VALUES (?);";
	   public static void main(String[] args) {
	      // Open a connection
	      try(Connection conn = DriverManager.getConnection(DB_URL+"magasin", USER, PASS);
	         Statement stmt = conn.createStatement();
	    	 PreparedStatement pstmt = conn.prepareStatement(SQL);
	      ) {		      
	         String sql = "DELETE FROM category WHERE codeCtg = 2";
	         stmt.executeUpdate(sql);
	         System.out.println("catregory deleted successfully :-)");   	  
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } 
	   }
}

