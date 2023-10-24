package tn.enis.adu;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Delete")
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final static String DB_URL = "jdbc:mysql://localhost/";
	final static String USER = "root";
	final static String PASS = "";
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String code=request.getParameter("code");
		try{ 
	   		 Class.forName("com.mysql.cj.jdbc.Driver");
	   		 Connection conn = DriverManager.getConnection(DB_URL+"magasin", USER, PASS);
	         Statement stmt = conn.createStatement();
	         String sql="DELETE FROM product WHERE code = "+'"'+code+'"';
	         stmt.executeUpdate(sql);
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
