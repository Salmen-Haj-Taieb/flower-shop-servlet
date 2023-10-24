<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<title>Sign Up</title>
</head>
<style>
body{
        background : gainsboro;
        justify-content: center;
    }   
</style>
<body>
<h1 class="text-center mt-3">Create your account</h1>
<div class="container card mt-4 p-3 wb-5 border border-dark shadow-lg p-3 mb-5 bg-body rounded" style="width: 25rem;">
<div class="form container">
<form action="AddUser" method="post">
<div class="form-row row">
   <div class="col">
    First name <input class="form-control" type="text" name="firstName" required >
    </div>
    <div class="col">
    Last name <input class="form-control" type="text" name="lastName" required >
    </div>
  </div>
    User name <input class="form-control" type="text" name="userName" value=" " ><br>
<div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control" aria-describedby="emailHelp" name="email" required>
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
Gender <div class="form-check">
  <input class="form-check-input" type="radio" name="gender"  value="male" checked required>
  <label class="form-check-label" for="male">
    Male
  </label>
</div>
<div class="form-check">
  <input class="form-check-input" type="radio" name="gender"  value="female">
  <label class="form-check-label" for="female">
    Female
  </label>
</div><br>
<div class="form-group">
    <label >Password</label>
    <input type="password" placeholder="password" class="form-control" name="password"  required>
  </div><br>
  <div class="d-flex flex-row justify-content-around">
    <div><input type="submit" class="btn btn-success" name="submit" value="Sign up"></div>
    <div>
    <a href="Index.jsp" >Go Back</a>
</div>
  </div>
</form>
</div>
</div>
</body>
</html>