package tn.enis.handelactions;

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


@WebServlet("/AddUser")
public class AddUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final static String DB_URL = "jdbc:mysql://localhost/";
	final static String USER = "root";
	final static String PASS = "";
	final static String SQL="INSERT INTO user (firstName,lastName,userName,email,gender,pwd) VALUES (?,?,?,?,?,?);";
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw = response.getWriter(); 
		//response.setContentType("text/htlm");
		String firstName=request.getParameter("firstName");
		String lastName=request.getParameter("lastName");
		String userName=request.getParameter("userName");
		String email=request.getParameter("email");
		String gender=request.getParameter("gender");
		String password=request.getParameter("password");
		
		pw.println("<h1>First Name : "+firstName+"</h1>");
		pw.println("<h1>last Name : "+lastName+"</h1>");
		pw.println("<h1>user name : "+userName+"</h1>");
		pw.println("<h1>email : "+email+"</h1>");
		pw.println("<h1>gender : "+gender+"</h1>");
		pw.println("<h1>password : "+password+"</h1>");
		
		try   {  Class.forName("com.mysql.cj.jdbc.Driver");
				Connection conn = DriverManager.getConnection(DB_URL+"magasin", USER, PASS);
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				 pstmt.setString(1, firstName);	      
				 pstmt.setString(2, lastName);	      
				 pstmt.setString(3, userName);	      
				 pstmt.setString(4, email);	      
				 pstmt.setString(5, gender);	      
				 pstmt.setString(6, password);	      
		         pstmt.executeUpdate();
		         pw.println("<h1>user inserted successfully :-)</h1>");   	 
		         response.sendRedirect("Index.jsp");
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
