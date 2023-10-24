<%@page import="java.sql.Connection"
        import="java.sql.DriverManager"
        import="java.sql.Statement"
        import="java.sql.SQLException"
        import="java.sql.ResultSet"
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add new product</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<style>
body{
        background : gainsboro;
        justify-content: center;
    }   
</style>

<body>
<h1 class="text-center mt-3">ADD NEW PRODUCT</h1>
<div class="container card mt-4 p-3 wb-5 border border-dark shadow-lg p-3 mb-5 bg-body rounded" style="width: 25rem;">
<form action="Add" method="post">
Designation <input class="form-control" type="text" name="designation" required ><br>
Category &nbsp; &nbsp; &nbsp; <select name="categoryName">
         	<%
         	final  String DB_URL = "jdbc:mysql://localhost/";
        	final  String USER = "root";
        	final  String PASS = "";
        	try{ 
        		 Class.forName("com.mysql.cj.jdbc.Driver");
        		 Connection conn = DriverManager.getConnection(DB_URL+"magasin", USER, PASS);
                 Statement stmt = conn.createStatement();
                 String sql = "SELECT nameCtg FROM category ORDER BY codeCtg";
                 ResultSet result=stmt.executeQuery(sql);
                 System.out.println("name category selected successflly :-)");
                 while(result.next()){
                	 out.print("<option name='category' value="+result.getString("nameCtg")+">"
                 +result.getString("nameCtg")+"</option>");
                 }
        	 } catch (SQLException e) {
                e.printStackTrace();
             } catch (ClassNotFoundException e) {
        		 e.printStackTrace();
             } 	  
         	%>
         </select><br><br>
Price <br> <input class="form-control" type="number" name="price" required>
Stock<input class="form-control" type="number" name="stock" required>
Promotion <input class="form-control" type="number" name="promotion" required><br>
<div class="form-group">
    <label for="exampleFormControlFile1">Image </label>
    <input type="file" class="form-control-file" id="exampleFormControlFile1" name="img" required>
  </div><br><hr>
  <div class="d-flex flex-row justify-content-around">
    <div><input type="submit" class="btn btn-success" name="submit" value="Save"></div>
    <div>
      <a href="CrudProduct.jsp" >Go Back</a>
    </div>
  </div>
</form>
</div>
</body>
</html>