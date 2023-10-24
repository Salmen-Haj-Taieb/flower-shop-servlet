<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Category</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<style>
body{
        background : gainsboro;
        justify-content: center;
    }   
</style>
<body>
<h1 class="text-center mt-3">ADD NEW CATEGORY</h1>
<div class="container card mt-4 p-3 wb-5 border border-dark shadow-lg p-3 mb-5 bg-body rounded" style="width: 25rem;">
<form action="AddCategory" method="post">
Category Name : <input class="form-control" type="text" name="categoryName" ><br>
<hr>
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