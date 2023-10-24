package tn.enis.adu;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Add")
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final static String DB_URL = "jdbc:mysql://localhost/";
	final static String USER = "root";
	final static String PASS = "";
	final static String SQL="INSERT INTO product (designation,codeCtg,price,promo,stock,img) VALUES (?,?,?,?,?,?);";
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		try{ 
			 Class.forName("com.mysql.cj.jdbc.Driver");
			 Connection conn = DriverManager.getConnection(DB_URL+"magasin", USER, PASS);
	         Statement stmt = conn.createStatement();
	         PreparedStatement pstmt = conn.prepareStatement(SQL);
	         String categoryName = request.getParameter("categoryName");
	         String designation = request.getParameter("designation");
	         String price = request.getParameter("price");
	         String stock = request.getParameter("stock");
	         String promotion = request.getParameter("promotion");
	         String img = request.getParameter("img");
	         String categoryCode;
	         String sql="SELECT codeCtg FROM category WHERE nameCtg = "+'"'+categoryName+'"';
	         ResultSet result=stmt.executeQuery(sql);
	         while(result.next()) {
	        	 categoryCode=result.getString("codeCtg");
	        	 pstmt.setString(2, categoryCode);
	             System.out.println("THE CODE OF "+categoryName+"IS : "+categoryCode);
	             pw.println("<h1>"+categoryName +" : "+categoryCode+"</h1>");
	         }
	         
	         pstmt.setString(1, designation);	      	      
			 pstmt.setString(3, price);	      
			 pstmt.setString(4, promotion);	      
			 pstmt.setString(5, stock);	      
			 pstmt.setString(6, img);	 
			 
	         pstmt.executeUpdate();
	         
	         System.out.println("Product added successflly :-)");
	         response.sendRedirect("CrudProduct.jsp");
		} catch (SQLException e) {
	         e.printStackTrace();
	      } catch (ClassNotFoundException e) {
			 e.printStackTrace();
	      } 	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
