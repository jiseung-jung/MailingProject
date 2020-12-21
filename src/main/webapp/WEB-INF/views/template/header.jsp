<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="header-top"></div>
<header>
	<div class="header-contents">
	<div class="header-left">
		<a href="#">
			<span class="economy">💰</span>
			경제기본기
		</a>
	</div>
	<a href="/"><img src="/image/logo.png" alt="뉴닉" class="logo"></a>
	<div class="header-right">
		<ul class="header-nav">
		<li><a href="#"><i class="fas fa-search icon"></i></a></li>
		<li class="nav-item dropdown">
	     	<a class="nav-link dropdown icon" data-toggle="dropdown">
	     	🦔
	      	</a>
		    <div class="dropdown-menu dropdown-menu-right">
			    <a class="dropdown-item" href="e">마이페이지</a>
			    <a class="dropdown-item" href="#">주문내역</a>
			    <a class="dropdown-item" href="${pageContext.request.contextPath}/member/memberProfile">프로필 설정</a>
			    <a class="dropdown-item" href="${pageContext.request.contextPath}/help/helpPage">고객센터</a>
			    <a class="dropdown-item" href="#">로그아웃</a>
		    </div>
    	</li>
    	</ul>
	</div>
	
	</div>
	
</header>
