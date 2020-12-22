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
<section class="Login-wrap">
	<div class="container">
		<div class="row">
			<div class="col-12">
			<form action="./memberLogin" method="post" id="LoginForm">
				<div id="login">
					<a href="/"><img src="/image/logo.png" alt="뉴닉" class="logo" id="login_logo"></a>
					<p>뉴스레터를 구독 중이더라도, 회원가입은 별개로 진행됩니다!</p>
					<hr>
					<input type="email" class="form-control" id="email" placeholder="이메일 입력" name="email">
					<input type="password" class="form-control" id="pw" placeholder="비밀번호 입력" name="pw">
					<button type="submit" class="btn" id="LoginBtn">로그인</button>
				</div>
				
			</form>
			</div>
		</div>	
	</div>
</section>	


</body>
</html>