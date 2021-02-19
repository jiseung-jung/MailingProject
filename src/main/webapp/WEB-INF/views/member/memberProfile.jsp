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
							<c:if test="${member.birthYear eq null || member.birthYear eq '' }">
								<p>뉴니커는 몇 살이슴</p>
							</c:if>
							<c:if test="${member.birthYear ne null}">
								<p>${member.birthYear}</p>
							</c:if>
						</div>
						<div class="info-items">
							<select name="birthYear" id="birthYear">
								<option value="">년도</option>
							</select>
						</div>
					</div>
					<div class="info-row">
						<div class="info-head">
							<h3>성별</h3>
							<c:if test="${member.gender eq null || member.gender eq ''}">
								<p>고슴이는 성별을 밝히고 싶지 않슴!</p>
							</c:if>
							<c:if test="${member.gender ne null}">
								<p>${member.gender}</p>
							</c:if>
						</div>
						<div class="info-items">
						<select name="gender" id="gender">							
							<option value="">기타</option>
							<option value="남성">남성</option>
							<option value="여성">여성</option>
						</select>
						</div>
					</div>
					<div class="info-row">
						<div class="info-head">
							<h3>이메일</h3>
							<p>${member.email}</p>
						</div>
						<div class="info-head">
							<h3>구독여부</h3>
							<c:if test="${member.mailCheck eq 1}">
								<p>구독중</p>
							</c:if>
							<c:if test="${member.mailCheck eq 0}">
								<p>미구독</p>
							</c:if>
						</div>
						<div class="info-items">
						<select name="mailCheck" id="mailCheck">							
							<option value="1">구독</option>
							<option value="0">미구독</option>
						</select>
						</div>
					</div>	
					<div class="info-row">
						<div class="info-head">
							<h3>배송지</h3>
							<c:if test="${member.address eq null || member.address eq ''}">
								<p>고슴이는 주소를 밝히고 싶지 않슴!</p>
							</c:if>
							<c:if test="${member.address ne null}">
								<p>${member.zipCode} ${member.address} ${member.detailAddress} ${member.extraAddress}</p>
							</c:if>
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
					<input type="hidden" name="mailCheck" value="${member.mailCheck}">
					<button type="submit" class="info-btn">변경</button>
				</form>
			</div>
			
			<div class="profile-info">

				<h2>비밀번호 변경</h2>

				<form:form modelAttribute="memberVO" action="${pageContext.request.contextPath}/member/memberProfile" class="password-form">
					<form:hidden path="email" value="${member.email}" />
					<form:password path="pw" placeholder="비밀번호 (8자 이상)" />
			        <form:errors path="pw" cssClass="error"></form:errors>
					
					<form:password path="pwChk" placeholder="비밀번호 확인 (8자 이상)"/>
			        <form:errors path="pwChk" cssClass="error"></form:errors>
					<button type="submit" class="pw-btn">변경</button>
				</form:form>
			</div>
			
			
			<div class="setting-foot">
				<button type="button" id="del-btn">계정탈퇴</button>
				<button type="button" id="logout-btn">로그아웃</button>
			</div>
		</div>
	</div>	
</div>
</section>

<c:import url="../template/footer.jsp"></c:import>
<script type="text/javascript">
$(document).ready(function(){
    setDate();
    setToggle();
    $(".info-items").addClass('hide');
    $(".info-btn").addClass('hide');
});    

function setDate(){
	var year = new Date().getFullYear();

	for(var y = year; y >= (year-100); y--){
          $("#birthYear").append("<option value='"+ y +"'>"+ y +"</option>");
	}}


function setToggle() {
	$("#birthYear").val("${member.birthYear}").prop("selected", true);
	$("#gender").val("${member.gender}").prop("selected", true);
	$("#mailCheck").val("${member.mailCheck}").prop("selected", true);
	$("#sample6_postcode").val("${member.zipCode}");
	$("#sample6_address").val("${member.address}");
	$("#sample6_detailAddress").val("${member.detailAddress}");
	$("#sample6_extraAddress").val("${member.extraAddress}");
}


$(".fas-info").click(function(){
	$(".info-items").toggle(
      function(){$(".info-items").addClass('show')}, //클릭하면 show클래스 적용되서 보이기
      function(){$(".info-items").removeClass('show').addClass('hide')}) //한 번 더 클릭하면 hide클래스가 숨기기
	
     $(".info-btn").toggle(
   	      function(){$(".info-btn").addClass('show')}, //클릭하면 show클래스 적용되서 보이기
   	      function(){$(".info-btn").removeClass('show').addClass('hide')}) //한 번 더 클릭하면 hide클래스가 숨기기
   	   	      
});



$("#del-btn").click(function() {
	if (confirm("정말 탈퇴하시겠습니까?") == true){    
		location.href="./memberDelete?email=${member.email}";

	}else{   
		return false;
	}
});



$("#logout-btn").click(function() {
		if (confirm("로그아웃 하시겠습니까?") == true){    
 		location.href="./memberLogout";

		}else{   
 		return false;
		}
});



</script>
</body>
</html>