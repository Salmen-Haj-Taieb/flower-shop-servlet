<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<title>Sign In</title>
</head>
<style>
body{
       background : gainsboro;
       justify-content: center;
    }   
</style>
<body>
<h1 class="text-center mt-3">Welcome Back</h1>
<marquee><h2 class="fst-italic">HAJ TAIEB SALMEN FLOWER SHOP</h2></marquee>
<div class="container card p-3 mt-5 wb-5 border border-dark shadow-lg p-3 mb-5 bg-body rounded" style="width: 25rem;">
        <%
          if(request.getParameter("isFound") != null){
        	  if(request.getParameter("isFound").equals("false")){
        		  out.print("<div class='alert alert-danger text-center' role='alert'>"
                           + "Email or password is incorrect !"
                           + "</div>");
        	  }
          }
          if(request.getParameter("success") != null){
        	  if(request.getParameter("success").equals("true")){
        		  out.print("<div class='alert alert-info text-center' role='alert'>"
                           + "You are just signing out !"
                           + "</div>");
        	  }
          }
          
        %>
        
        <div class="form">
            <form action="Validation" method="post">
                <div class='form-group'>
                    <label class="form-label">Username</label>
                   
                    <input type="text" class="form-control" name="userName" >
                </div><br>
                <div class='form-group'>
                    <label>Password</label>
           
                    <input type="password" class="form-control" name="password" >
                </div><br>
                <div class='form-group form-check'>
                    <input type='checkbox' checked class='form-check-input' id='exampleCheck1' name="remember">
                    <label class='form-check-label' for='exampleCheck1'>Remember Me</label>
                </div><br>
                <div class="d-flex flex-row justify-content-around">
                    <button name=submit type='submit' class='btn btn-primary'>Submit</button>
                    <a href="SignUp.jsp">You don't have account ?</a>
                </div>
            </form>
        </div>
        </div>
</body>
</html>