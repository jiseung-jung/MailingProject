<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/bootStrap.jsp"></c:import>
<link href="../css/style.css" rel="stylesheet">
<style type="text/css">

	body{
		background-color: #ebebeb;
	}

	#logo{
		width: 300px;
		margin-bottom: 60px;
	}
	
	#join{
		margin: 100px 0; 
		text-align: center;
	}
	
	#join input{
		width: 470px;
		height: 60px;
		margin-bottom: 15px;
		padding-left: 20px;
	}
	
</style>
</head>
<body>

<form action="">

	<div id="join">
		<img src="/image/logo.png" alt="뉴닉" class="logo" id="logo">
		<br>
		<input type="text" name="email" placeholder="이메일">
		<br>
		<input type="password" name="pw" placeholder="비밀번호 (8자 이상)">
		<br>
		<input type="password" name="pw2" placeholder="비밀번호 확인 (8자 이상)">
		<br>
		<input type="text" name="name" placeholder="닉네임">
	</div>

</form>
</body>
</html>