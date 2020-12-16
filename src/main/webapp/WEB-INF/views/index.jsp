<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<title>Spring Boot Web Project</title>
<c:import url="./template/bootStrap.jsp"></c:import>
<link href="./css/style.css" rel="stylesheet">
</head>
<body>
<c:import url="./template/header.jsp"></c:import>
<h1 class= "head-title">특보! 🗞️ 우리가 시간이 없지, 세상이 안 궁금하냐!</h1>

<section class="service">
<div class="container">
	<div class="row">
		<div class="col-12 intro">
			<div class="mail-service col-md-7">
				<p>✨지금 <strong>264,368</strong>명이 뉴닉을 읽고 있어요.</p>
				<p>세상 돌아가는 소식, 알고는 싶지만 신문 볼 새 없이 바쁜 게 우리 탓은 아니잖아요! <br>
				월/수/금 아침마다 세상 돌아가는 소식을 메일로 받아보세요.</p>
				<form class="subscribe">
					<input type="text" name="email" placeholder="이메일 주소" class="subscribe-items">
					<input type="text" name="nickname" placeholder="닉네임" class="subscribe-items">
					<div class="subscribe-chk">
						<input type="checkbox"/><a href="#"> 개인정보수집 및 이용약관에 동의합니다</a>
					</div>
					<button class="subscribe-btn">뉴스레터 무료로 구독하기</button>
				</form>
			</div>
			<div class="intro-gosum col-md-5">
				<img src="/image/gosum.png" alt="고슴">
			</div>
		</div>
	</div>
</div>
</section>	

<div class="news-nav">
	<ul class="news-item">
		<li><a href="#" class="news-link">전체</a></li>
		<li><a href="#" class="news-link">⚖️ 국내외정치</a></li>
		<li><a href="#" class="news-link">💰 경제</a></li>
		<li><a href="#" class="news-link">💪 노동·인권</a></li>
		<li><a href="#" class="news-link">🤖 테크</a></li>
		<li><a href="#" class="news-link">🧸 문화</a></li>
		<li><a href="#" class="news-link">🌳 환경·에너지</a></li>
		<li><a href="#" class="news-link">😷 코로나19</a></li>
	</ul>
</div>

<section class="news">
<div class="container news-container">
	<div class="row">
		<div class="col-12 posts">

		<div class="card col-md-3"></div>
		<div class="card col-md-3"></div>
		<div class="card col-md-3"></div>
		<div class="card col-md-3"></div>
		<div class="card col-md-3"></div>
		<div class="card col-md-3"></div>
		<div class="card col-md-3"></div>
		
		</div>
	</div>
</div>		
</section>
<c:import url="./template/footer.jsp"></c:import>	
</body>
</html>