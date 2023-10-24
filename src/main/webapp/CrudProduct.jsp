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
<title>Flower Shop</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="fontawesome-free-6.2.0-web/css/all.css">
</head>
<style>
body{
     background : gainsboro;
    }
</style>
<body>
<nav class="navbar navbar-expand-lg bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">HT. SALMEN</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Hello <%= session.getAttribute("userName") %></a>
        </li>
      </ul>
      <form action="SignOut" method="post" class="d-flex">
        <button class="btn btn-outline-danger" type="submit">Sign out</button>
      </form>
    </div>
  </div>
</nav>

<div class="card shadow-lg p-3 mt-5 mb-5 bg-body rounded border border-dark center container-xl table-responsive table-wrapper">
<div class="table-title row">
<nav class="navbar navbar-light bg-light justify-content-between p-2">
	<a class="navbar-brand">Products Gestion</a>
    <select id="categoryName">
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
        		 System.out.println(e);
                e.printStackTrace();
             } catch (ClassNotFoundException e) {
            	 System.out.println(e);
        		 e.printStackTrace();
             } 	  
         	%>
     </select>
	<button class="btn btn-primary" style="color:white" onclick="setCategory()">Filter</button>

	<%      
	    if (session.getAttribute("userName").equals("admin")) {
	    	out.print("<form action='AddProduct.jsp' method='post'>"
	     	+"<button style='color : white' class='btn btn-success' type='submit' name='addProd'>Add Produit</button>"
	     			+"</form>");
	    	out.print("<form action='AddCategory.jsp' method='post'>"
	    	        +"<button style='color : white' class='btn btn-secondary' type='submit' name='addCategory'>Add Category</button>"
	    			+"</form>");
	    }
	%>
	<form class="form-inline">
 <input onkeyup="showTab(this.value)" class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
    </form>
</nav>
</div>


<table class="table table-responsive col-sm-9 table table-striped text-center mt-5" >
	<thead class="thead-light bg-black text-white">
		<tr>
			<th scope="col">#</th>
			<th scope="col">Designation</th>
			<th scope="col">Category</th>
			<th scope="col">Price Dt</th>
			<th scope="col">Promotion %</th>
			<th scope="col">Stock</th>
			<th scope="col">Image</th>
			<th scope="col">Actions</th>
		</tr>
	</thead>
    <tbody class="text-center" id="tbody">
    <%
	try{ 
		 Class.forName("com.mysql.cj.jdbc.Driver");
		 Connection conn = DriverManager.getConnection(DB_URL+"magasin", USER, PASS);
         Statement stmt = conn.createStatement();
         String sql = "SELECT code,designation,nameCtg,price,promo,stock,img FROM product NATURAL JOIN category ORDER BY code";
         ResultSet result=stmt.executeQuery(sql);
         System.out.println("table product join category selected successflly :-)");
         while(result.next()){
        	 out.print("<tr>");
        	 out.print("<td>"+result.getString("code")+"</td>");
        	 out.print("<td>"+result.getString("designation")+"</td>");
        	 out.print("<td>"+result.getString("nameCtg")+"</td>");
        	 out.print("<td>"+result.getString("price")+"</td>");
        	 out.print("<td>"+result.getString("promo")+"</td>");
        	 out.print("<td>"+result.getString("stock")+"</td>");
        	 out.print("<td><img class='rounded' style='width : 70px ; height : 70px' src="+"'images/"+result.getString("img")+"'"+"alt='img'></td>");
        	 if(session.getAttribute("userName").equals("admin")){
        		 out.print("<td>"
        					+"<a href='/flowerShop/UpdateProduct.jsp?code="+result.getString("code")+"&prevCategoryName="+result.getString("nameCtg")+"'"+" class='edit' data-toggle='modal'><i class='fa-sharp fa-solid fa-pen-to-square'></i></a>  &emsp; &emsp;"
        					+"<a href='/flowerShop/DeleteProduct.jsp?code="+result.getString("code")+"&prevCategoryName="+result.getString("nameCtg")+"'"+"class='delete' data-toggle='modal'><i class='fa-sharp fa-solid fa-trash'></i></a>"
        					+"</td>");
        	 }else{
        		 out.print("<td>"
        				 +"<a href=''><i class='fa-solid fa-cart-plus'></i></a>"
        		         +"</td>");
        	 }
        	 out.print("</tr>");
         }
	 } catch (SQLException e) {
        e.printStackTrace();
     } catch (ClassNotFoundException e) {
		 e.printStackTrace();
     } 	  
    %>
    </tbody>    	
</table>
</div>
</body>
</html>