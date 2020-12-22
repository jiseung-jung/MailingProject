<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/bootStrap.jsp"></c:import>
<link href="../css/style.css" rel="stylesheet">
<script src="../js/address.js"></script>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<section class="member-profile">
<div class="container">
	<div class="row">
		<div class="col-12">
		
			<div class="profile-title">
				<h1>${member.name} 뉴니커,</h1>
				<h1>어떤 사람인지 더 알고 싶어요!</h1>
			</div>
			
			<div class="profile-info">
				<i class="fas fa-pen-alt fas-info"></i>
				<h2>뉴니커 정보</h2>
				<form action="./memberInfo" method="post" class="profile-form">
					<div class="setting-row">
					<label for="nickname">닉네임</label>
						<input type="text" name="name" id="name" value="${member.name}"/>
					</div>
					<div class="info-row">	
						<div class="info-head">
								<h3>출생년도</h3>
								<p>${member.birthYear}</p>
						</div>
						<div class="info-items">
							<select name="birthYear" id="birthYear">
								<option value="null">년도</option>
							</select>
						</div>
					</div>
					<div class="info-row">
						<div class="info-head">
								<h3>성별</h3>
								<p>${member.gender}</p>
						</div>
						<div class="info-items">
						<select name="gender" id="gender">							
							<option value="null">기타</option>
							<option value="남성">남성</option>
							<option value="여성">여성</option>
						</select>
						</div>
					</div>	
					<div class="info-row">
						
						<div class="info-head">
							<h3>배송지</h3>
							<p>${member.zipCode} ${member.address} ${member.detailAddress} ${member.extraAddress}</p>
							
						</div>
						<div class="info-items">
				            <input type="text" id="sample6_postcode" placeholder="우편번호" name="zipCode">
				            <input type="text" id="sample6_address" placeholder="주소" name="address" class="text">
				            <input type="text" id="sample6_detailAddress" placeholder="상세주소" name="detailAddress" class="text" onkeyup="address()">
				            <input type="text" id="sample6_extraAddress" placeholder="참고항목" name="extraAddress" class="text">
				            <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
	         			</div>
					</div>
					<input type="hidden" name="email" value="${member.email}">
					<button type="submit" class="info-btn">변경</button>
				</form>
			</div>
			
			<div class="profile-info">

				<h2>비밀번호 변경</h2>

				<form:form modelAttribute="memberVO" class="password-form">
					<form:hidden path="email" value="${member.email}" />
					<form:password path="pw" placeholder="비밀번호 (8자 이상)"/>
			        <form:errors path="pw" cssClass="error"></form:errors>
					
					<form:password path="pw2" placeholder="비밀번호 확인 (8자 이상)"/>
			        <form:errors path="pw2" cssClass="error"></form:errors>
					<button type="submit" class="pw-btn">변경</button>
				</form:form>
			</div>
			<div class="profile-info">
				<h2>이메일 수신여부</h2>
				<div class="profile-row">
					<h3>이메일</h3>
					<p>${member.email}</p>
				</div>
				
				<form action="" method="get" class="mail-form">
					<h3>구독여부</h3>
					
					<c:if test="${member.mailCheck eq 1}"><p>구독중</p></c:if>
					<c:if test="${member.mailCheck eq 0}"><p>미구독</p></c:if>
					<button type="submit" class="email-btn">변경</button>
				</form>
				<p>NEWNEEK에서 제공하는 유익한 뉴스레터를 이메일로 받으실 수 있습니다.</p>
				
			</div>
			
			<div class="setting-foot">
				<p><a href="./memberDelete">계정 탈퇴하기</a></p>
				<button type="button" >로그아웃</button>
			</div>
		</div>
	</div>	
</div>
</section>

<c:import url="../template/footer.jsp"></c:import>
<script type="text/javascript">
$(document).ready(function(){
    setDate();
    $(".info-items").addClass('hide');
    $(".info-btn").addClass('hide');
});    

function setDate(){
	var year = new Date().getFullYear();

	for(var y = year; y >= (year-100); y--){
          $("#birthYear").append("<option value='"+ y +"'>"+ y +"</option>");
	}}


$(".fas-info").click(function(){
	$(".info-items").toggle(
      function(){$(".info-items").addClass('show')}, //클릭하면 show클래스 적용되서 보이기
      function(){$(".info-items").removeClass('show').addClass('hide')}) //한 번 더 클릭하면 hide클래스가 숨기기
	
     $(".info-btn").toggle(
   	      function(){$(".info-btn").addClass('show')}, //클릭하면 show클래스 적용되서 보이기
   	      function(){$(".info-btn").removeClass('show').addClass('hide')}) //한 번 더 클릭하면 hide클래스가 숨기기
   	   	      
});




$(".info-btn").click(function() {
	var sample6_detailAddress = $("#sample6_detailAddress").val();
	
	if(sample6_detailAddress==''){
		alert("상세주소는 필수항목 입니다.")
		return false;
	}
});



</script>
</body>
</html>