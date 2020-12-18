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
	
	*{
		box-sizing: border-box;
	}
	
	
	#JoinForm{
		padding: 0 6%;
    	max-width: 670px;
    	min-height: 100vh;
    	margin: 0 auto;
	}
	
	#logo{
		width: 300px;
		margin-bottom: 60px;
	}
	
	#join{
		margin-top: 100px; 
		text-align: center;
	}
	
	#join input{
		width: 100%;
		height: 60px;
		margin-bottom: 15px;
		padding-left: 20px;
	}
	
	#checkbox{
		width: 100%;
		margin-top: 20px;
		font-weight: bold;
		float: left;
	}
	
	#checkbox input{
		transform : scale(1.5);
		margin: 0 10px 20px 5px;;
	}
	
	#JoinBtn{
		width: 100%;
		height: 60px;
		background-color: black;
		color: white;
		font-weight: 600;
		font-size: 1.05em;
		margin: 60px 0 200px 0; 
	}
	
</style>
</head>
<body>

<div id="JoinContainer">

<form action="" id="JoinForm">
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
	
	<div id="checkbox">
		<input type="checkbox"> <span>약관 전체동의</span>
		<br>
		<input type="checkbox"> <span>만 14세 이상 가입 동의 (필수)</span>
		<br>
		<input type="checkbox"> <span>뉴닉 이용약관 동의 (필수)</span>
		<br>
		<input type="checkbox"> <span>개인정보 수집/이용 동의 (필수)</span>
		<br>
		<input type="checkbox"> <span>뉴스레터 및 이벤트 정보 수신 동의 (선택)</span>
		<br>
	</div>
	
	<div>
		<button class="btn" id="JoinBtn">가입하기</button>
	</div>
</form>
</div>

</body>
</html>