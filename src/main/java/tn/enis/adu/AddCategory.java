package tn.enis.adu;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


@WebServlet("/AddCategory")
public class AddCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final static String DB_URL = "jdbc:mysql://localhost/";
	final static String USER = "root";
	final static String PASS = "";
	final static String SQL="INSERT INTO category (nameCtg) VALUES (?);";
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String categoryName=request.getParameter("categoryName");
		PrintWriter pw = response.getWriter();
		try   {  Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(DB_URL+"magasin", USER, PASS);
		PreparedStatement pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, categoryName);
		pstmt.executeUpdate();
		System.out.println(categoryName+"added successflly in category table");
		response.sendRedirect("CrudProduct.jsp");
		pw.println("<h1>"+categoryName+"</h1>");
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
