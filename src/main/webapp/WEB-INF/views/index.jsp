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
				<p>✨지금 <strong>${count}</strong>명이 뉴닉을 읽고 있어요.</p>
				<p>세상 돌아가는 소식, 알고는 싶지만 신문 볼 새 없이 바쁜 게 우리 탓은 아니잖아요! <br>
				월/수/금 아침마다 세상 돌아가는 소식을 메일로 받아보세요.</p>
				<form action="./member/memberSub" class="subscribe" method="post">
					<input type="text" name="email" id="email" placeholder="이메일 주소" class="subscribe-items">
					<input type="text" name="name" id="name" placeholder="닉네임" class="subscribe-items">
					<div class="subscribe-chk">
						<input type="checkbox" id="check"/><a href="#"> 개인정보수집 및 이용약관에 동의합니다</a>
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
		<li><a href="${pageContext.request.contextPath}/news/newsList" class="news-link">전체</a></li>
		<li><a href="${pageContext.request.contextPath}/news/newsList?kind=newsId&search=1" class="news-link">⚖️ 국내외정치</a></li>
		<li><a href="${pageContext.request.contextPath}/news/newsList?kind=newsId&search=2" class="news-link">💰 경제</a></li>
		<li><a href="${pageContext.request.contextPath}/news/newsList?kind=newsId&search=3" class="news-link">💪 노동·인권</a></li>
		<li><a href="${pageContext.request.contextPath}/news/newsList?kind=newsId&search=4" class="news-link">🤖 테크</a></li>
		<li><a href="${pageContext.request.contextPath}/news/newsList?kind=newsId&search=5" class="news-link">🧸 문화</a></li>
		<li><a href="${pageContext.request.contextPath}/news/newsList?kind=newsId&search=6" class="news-link">🌳 환경·에너지</a></li>
		<li><a href="${pageContext.request.contextPath}/news/newsList?kind=newsId&search=7" class="news-link">😷 코로나19</a></li>
	</ul>
</div>

<section class="news">
<div class="container news-container">
	<div class="row">
		<div class="col-12 posts">
	<c:forEach items="${list}" var="vo">
		<div class="card col-md-4" OnClick="location.href ='./news/newsSelect?num=${vo.num}'">
			${vo.title}
		</div>
	</c:forEach>	
		</div>
	</div>
</div>		
</section>
<c:import url="./template/footer.jsp"></c:import>	


<!-- **************************** Script **************************** -->

<script type="text/javascript">


/********* email check  ********/
 
/* 
$("#email").blur(function(){
	idCheck=false;
	var id = $(this).val();
	if(id!=''){
		
		$.ajax({
			url : "./memberIdCheck",
			type : "GET",
			data : {id:id},
			success : function(data){
				data=data.trim();
				var str = "중복된 ID 입니다";
				
				$("#idResult").removeClass("idCheck0").addClass("idCheck1");
				if(id==''){
					str= "ID를 입력하세요";
				}else if(data==0){
					str="사용 가능한 ID 입니다"
					$("#idResult").removeClass("idCheck1").addClass("idCheck0");
					idCheck=true;
				}
				
				$("#idResult").html(str);
				
			}
		});
		
		
	}});

*/

	var email = $("#email").val();
	var name = $("#name").val();

	$(".subscribe-btn").click(function(){
		
		if(email == null || name == null){
			alert("이메일과 닉네임은 필수항목 입니다.")
			return false;
	    }else if($("#check").is(":checked") == false){
			   alert("개인정보수집 및 이용약관 동의는 필수입니다.");
			   return false;
		}
		   
	 });
	
</script>

</body>
</html>