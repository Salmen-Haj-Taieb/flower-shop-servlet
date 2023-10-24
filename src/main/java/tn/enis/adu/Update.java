package tn.enis.adu;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Update")
public class Update extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final static String DB_URL = "jdbc:mysql://localhost/";
	final static String USER = "root";
	final static String PASS = "";
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter pw = response.getWriter();
		String categoryName="";
		String designation="";
		String price="";
		String stock="";
		String promotion="";
		String img="";
		String categoryCode="";
		String prevImg=request.getParameter("prevImg");
		String code=request.getParameter("code");
		try{ 
	   		 Class.forName("com.mysql.cj.jdbc.Driver");
	   		 Connection conn = DriverManager.getConnection(DB_URL+"magasin", USER, PASS);
	         Statement stmt = conn.createStatement();
	         categoryName = request.getParameter("categoryName");
	         designation = request.getParameter("designation");
	         price = request.getParameter("price");
	         stock = request.getParameter("stock");
	         promotion = request.getParameter("promotion");
	         img = request.getParameter("img");
	         String sql="SELECT codeCtg FROM category WHERE nameCtg = "+'"'+categoryName+'"';
	         ResultSet result=stmt.executeQuery(sql);
	         while(result.next()) {
	        	 categoryCode=result.getString("codeCtg");
	        	 //pstmt.setString(2, categoryCode);
	             //System.out.println("THE CODE OF "+categoryName+" IS : "+categoryCode);
	         }
	         String newImg= (img.equals(""))?prevImg:img;
	         sql="UPDATE product SET " 
	                +"designation = "+"'"+designation+"'"
	                +", codeCtg = "+"'"+categoryCode+"'"
	                +", price = "+"'"+price+"'"
	                +", stock = "+"'"+stock+"'"
	                +", promo = "+"'"+promotion+"'"
	                +", img = "+"'"+newImg+"'"
	                +"WHERE code = "+"'"+code+"'";
	         stmt.executeUpdate(sql);
	         pw.println("img = "+newImg);
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
