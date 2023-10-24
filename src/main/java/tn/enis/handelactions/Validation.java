package tn.enis.handelactions;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/Validation")
public class Validation extends HttpServlet {
	final static String DB_URL = "jdbc:mysql://localhost/";
	final static String USER = "root";
	final static String PASS = "";
	private static final long serialVersionUID = 1L;
    String firstName;
    String lastName;
    String userName;
    String email;
    String gender;
    String pwd;
    

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		String uName = request.getParameter("userName");
		String password= request.getParameter("password");
		String isChecked = request.getParameter("remember");
        pw.print("<h1>user Name : "+uName+"</h1>");
        pw.print("<h1>password : "+password+"</h1>");
        pw.print("<h1>**************************</h1>");
        try{ 
   		 Class.forName("com.mysql.cj.jdbc.Driver");
   		 Connection conn = DriverManager.getConnection(DB_URL+"magasin", USER, PASS);
         Statement stmt = conn.createStatement();
         String sql = "SELECT * FROM user WHERE userName = "+"'"+uName+"'"+"AND pwd = "+"'"+password+"'";
         ResultSet result=stmt.executeQuery(sql);
         if(result != null) {
         	System.out.println("result is not null"); 
             if(result.next() == false) {
            	System.out.println("query is empty"); 
             	response.sendRedirect("Index.jsp?isFound=false");
             }else {
            	System.out.println("query is not empty"); 
             	result.previous();
                while(result.next()) {
                	 firstName = result.getString("firstName");
                	 lastName = result.getString("lastName");
                	 userName = result.getString("userName");
               	     email = result.getString("email");
               	     gender = result.getString("gender");
               	     pwd = result.getString("pwd");
               	     pw.println("<h1>First Name : "+firstName+"</h1>");
              	     pw.println("<h1>last Name : "+lastName+"</h1>");
              	     pw.println("<h1>user name : "+userName+"</h1>");
              	     pw.println("<h1>email : "+email+"</h1>");
              	     pw.println("<h1>gender : "+gender+"</h1>");
              	     pw.println("<h1>pwd : "+pwd+"</h1>");
              	     pw.println("<hr>");
                	
                	}
                HttpSession session=request.getSession();
                session.setAttribute("userName", userName);
                System.out.println("user : "+uName+" selected successfully :-)");
                //System.out.println("*********ISCHECKED =  "+isChecked+"***************");
                Cookie[] cookies = null;
                
                if(isChecked != null) {
                	cookies = request.getCookies();
                    request.getCookies()[0].setValue(password);
                    request.getCookies()[1].setValue(uName);
                    System.out.println("<h2> Found Cookies Name and Value</h2>");

                    for (int i = 0; i < cookies.length; i++) {
                       Cookie cookie = cookies[i];
                       System.out.print("Name : " + cookie.getName( ) + ",  ");
                       System.out.print("Value: " + cookie.getValue( ) + " <br/>");
                    }
                }
                response.sendRedirect("CrudProduct.jsp");
                }
             }
        } catch (SQLException e) {
            pw.println("SQLException "+e);
            e.printStackTrace();
         } catch (ClassNotFoundException e) {
       	  pw.println("ClassNotFoundException "+e);
   		 e.printStackTrace();
         }
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
