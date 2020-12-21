<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Login</title>
<c:import url="../template/bootStrap.jsp"></c:import>
<link href="../css/style.css" rel="stylesheet">
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<section class="Login">
	<div class="container">
		<div class="row">
			<div class="col-12 login">
				  <form action="./memberLogin" method="post" id="LoginForm">
				  <img src="/image/logo.png" alt="뉴닉" class="logo" id="logo">
				    <div class="form-group">
				      <label for="email">Email:</label>
				      <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
				    </div>
				    <div class="form-group">
				      <label for="pwd">Password:</label>
				      <input type="password" class="form-control" id="pw" placeholder="Enter password" name="pw">
				    </div>
				    <button type="submit" class="btn btn-default">Submit</button>
				  </form>
			</div>
		</div>	
	</div>
</section>	


</body>
</html>