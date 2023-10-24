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
<title>Update Product</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="fontawesome-free-6.2.0-web/css/all.css">
</head>
<style>
body{
        background : gainsboro;
        justify-content: center;
    }   
</style>
<body>
<%
final String DB_URL = "jdbc:mysql://localhost/";
final String USER = "root";
final String PASS = "";
String code = request.getParameter("code");
String prevCategoryName = request.getParameter("prevCategoryName");
String designation="";
String price="";
String promo="";
String stock="";
String img="";
String categoryName="";
String isMyCategory="";
try{ 
	 Class.forName("com.mysql.cj.jdbc.Driver");
	 Connection conn = DriverManager.getConnection(DB_URL+"magasin", USER, PASS);
     Statement stmt = conn.createStatement();
     String sql = "SELECT designation,price,promo,stock,img FROM product WHERE code = "+"'"+code+"'";
     ResultSet result=stmt.executeQuery(sql);
     while (result.next()) {
    	System.out.println("********************* ENTRED TO THE FIRST WHILE ????? !!!!!"); 
    	designation = result.getString("designation");
    	price = result.getString("price");
        promo = result.getString("promo");
     	stock = result.getString("stock");
     	img = result.getString("img");
     	  }
}
     catch (SQLException e) {
    e.printStackTrace();
 } catch (ClassNotFoundException e) {
	 e.printStackTrace();
 }
%>
<h1 class="text-center mt-3">UPDATE PRODUCT <%= code %></h1>
<div class="container card mt-4 p-3 wb-5 border border-dark shadow-lg p-3 mb-5 bg-body rounded" style="width: 25rem;">
<form action="Update?code=<%= code %>&prevImg=<%= img %>" method="post">
<div class="d-flex flex-row justify-content-around">
    <div>
    Designation <input class="form-control" type="text" name="designation" value=<%= designation %> required >
    </div>
    <div>
    <img style="width : 70px; height : 70px" src=<%="'images/"+img+"'" %> class="rounded" alt=<%= img %> name="img" />
    </div>
  </div><br>
Category &nbsp; &nbsp; &nbsp; <select name="categoryName">
         	<%
        	try{ 
        		 Class.forName("com.mysql.cj.jdbc.Driver");
        		 Connection conn = DriverManager.getConnection(DB_URL+"magasin", USER, PASS);
                 Statement stmt = conn.createStatement();
                 String sql = "SELECT nameCtg FROM category ORDER BY codeCtg";
                 ResultSet result=stmt.executeQuery(sql);
                 System.out.println("name category selected successflly :-)");
                 while(result.next()){
                	 //System.out.println("********************* ENTRED TO THE SECOND WHILE ????? !!!!!");
                	 categoryName=result.getString("nameCtg");
                	 out.print((prevCategoryName.equals(categoryName))?
                "<option selected name='category' value="+categoryName+" "+">"+categoryName+"</option>"
                :"<option name='category' value="+categoryName+" "+">"+categoryName+"</option>");
                 }
        	 } catch (SQLException e) {
                e.printStackTrace();
             } catch (ClassNotFoundException e) {
        		 e.printStackTrace();
             } 	  
         	%>
         </select><br><br>
Price <br> <input class="form-control" type="number" name="price" value=<%= price %> required />
Stock<input class="form-control" type="number" name="stock" value=<%= stock %> required />
Promotion <input class="form-control" type="number" name="promotion" value=<%= promo %> required /><br>
<div class="form-group">
    <label for="exampleFormControlFile1">Image </label>
    <input type="file" class="form-control-file" id="exampleFormControlFile1" name="img" />
    <p style="color : red">Not required</p>
  </div><br><hr>
  <div class="d-flex flex-row justify-content-around">
    <div><input type="submit" class="btn btn-success" name="submit" value="Update"></div>
    <div>
      <a href="CrudProduct.jsp" >Go Back</a>
    </div>
  </div>
</form>
</div>
</body>
</html>