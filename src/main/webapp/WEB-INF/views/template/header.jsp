<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="header-top"></div>
<header>
	<div class="header-contents">
		<div class="header-left">
			<a href="/"><img src="/image/logo.png" alt="뉴닉" class="logo"></a>
		</div>
	
		
	<div class="header-right">
		<ul class="header-nav">
			<li>
				<form class="search-item">
					<input class="search-input" type="search" id="help-search" placeholder="고슴아 이게 궁금해. (인물, 이슈)" name="search">
					<button class="search-btn"><i class="fas fa-search"></i></button>
				</form>
			</li>
			<li class="nav-item dropdown">
		     	<a class="nav-link dropdown-icon" data-toggle="dropdown" style="cursor: pointer;">
		     	🦔
		      	</a>
		      	 <c:choose>
	                  <c:when test="${not empty member}">
					     <div class="dropdown-menu dropdown-menu-right">
						    <a class="dropdown-item" href="${pageContext.request.contextPath}/member/memberProfile">프로필 설정</a>
						    <a class="dropdown-item" href="${pageContext.request.contextPath}/member/likeList">좋아요🧡</a>
						    <a class="dropdown-item" href="${pageContext.request.contextPath}/help/helpPage">고객센터</a>
						    <a class="dropdown-item" href="${pageContext.request.contextPath}/member/memberLogout">로그아웃</a>
						 </div>
					  </c:when>
					  <c:otherwise>
						<div class="dropdown-menu dropdown-menu-right">
							<a class="dropdown-item" href="${pageContext.request.contextPath}/member/memberLogin">로그인</a>
						    <a class="dropdown-item" href="${pageContext.request.contextPath}/member/memberJoin">회원가입</a>
					    </div>
					  </c:otherwise>
				</c:choose>
	    	</li>
	    	<c:if test="${member.email eq 'admin@newneek.com'}">
	    		<li><a href="${pageContext.request.contextPath}/admin/adminPage" style="font-size: 1.3em; text-decoration: none;">🔧</a></li>
	    	</c:if>
	    </ul>
	</div>
	
	</div>
	
</header>
