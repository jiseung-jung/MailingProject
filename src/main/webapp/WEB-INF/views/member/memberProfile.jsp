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
<script src="../js/address.js"></script>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<section class="member-profile">
<div class="container">
	<div class="row">
		<div class="col-12">
		
			<div class="profile-title">
				<h1>뉴니커,</h1>
				<h1>어떤 사람인지 더 알고 싶어요!</h1>
			</div>
			
			<div class="profile-info">
				
				<h2>뉴니커 정보</h2>
				
				<form action="" method="post" class="profile-form">
					<div class="setting-row">
					<label for="nickname">닉네임</label>
						<input type="text" name="nickname" id="nickname" />
					</div>
					<div class="setting-row">	
					<label for="year">출생년도</label>
						<select name="year" id="year">
							<option value=''>년도</option>
						</select>
					</div>
					<div class="setting-row">
					<label for="gender">성별</label>
						<select name="gender" id="gender">
							<option value="null">기타</option>
							<option value="male">남성</option>
							<option value="female">여성</option>
						</select>
					</div>	
					<div class="address-row">
						
						<div class="address-head">
							<h3>배송지</h3>
							<p>서울특별시 마포구 월드컵북로 21, 2층</p>
							<i class="fas fa-pen-alt fas-info"></i>
						</div>
						<div class="address-items">
				            <input type="text" id="sample6_postcode" placeholder="우편번호" name="zipCode">
				            <input type="text" id="sample6_address" placeholder="주소" name="address" class="text">
				            <input type="text" id="sample6_detailAddress" placeholder="상세주소" name="detailAddress" class="text" onkeyup="address()">
				            <input type="text" id="sample6_extraAddress" placeholder="참고항목" name="extraAddress" class="text">
				            <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
				            <input type="hidden" id="address" name="address">
	         			</div>
					</div>
					<button type="submit" class="info-btn">변경</button>
				</form>
			</div>
			
			<div class="profile-info">
				<i class="fas fa-pen-alt fas-pw"></i>
				<h2>비밀번호 변경</h2>
				
				<div class="profile-row">
					<h3>비밀번호</h3>
					<p>********</p>
				</div>	
				<form action="" method="post" class="password-form">
					<input type="hidden" name="id" id="id">
					<input type="password" name="pw" id="pw" placeholder="비밀번호">
					<input type="password" name="pwChk" id="pwChk" placeholder="비밀번호 확인">
					<button type="submit" class="pw-btn">변경</button>
				</form>
			
			</div>
			<div class="profile-info">
				<h2>이메일 수신여부</h2>
				<div class="profile-row">
					<h3>이메일</h3>
					<p>aa@naver.com</p>
				</div>
				<form action="" method="get" class="mail-form">
					<h3>구독여부</h3>
					<input type="radio" name="mailCheck" id="subscribed" value="true">
					<label for="subscribed">구독중</label>
					<input type="radio" name="mailCheck" id="unsubscribed" value="false">
					<label for="unsubscribed">미구독</label>
					<button type="submit" class="email-btn">변경</button>
				</form>
				<p>NEWNEEK에서 제공하는 유익한 뉴스레터를 이메일로 받으실 수 있습니다.</p>
				
			</div>
			
			<div class="setting-foot">
				<p><a href="#">계정 탈퇴하기</a></p>
				<button type="button">로그아웃</button>
			</div>
		</div>
	</div>	
</div>
</section>

<c:import url="../template/footer.jsp"></c:import>
<script type="text/javascript">
$(document).ready(function(){
    setDate();
    $(".address-items").addClass('hide');
    $(".password-form").addClass('hide');
});    

function setDate(){
	var year = new Date().getFullYear();

	for(var y = year; y >= (year-100); y--){
          $("#year").append("<option value='"+ y +"'>"+ y +"</option>");
	}}

$(".fas-info").click(function(){
	$(".address-items").toggle(
      function(){$(".address-items").addClass('show')}, //클릭하면 show클래스 적용되서 보이기
      function(){$(".address-items").removeClass('show').addClass('hide')}) //한 번 더 클릭하면 hide클래스가 숨기기
	

});


$(".fas-pw").click(function(){
	$(".password-form").toggle(
      function(){$(".password-form").addClass('show')}, //클릭하면 show클래스 적용되서 보이기
      function(){$(".password-form").removeClass('show').addClass('hide')}) //한 번 더 클릭하면 hide클래스가 숨기기
	

});

</script>
</body>
</html>