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
		cursor: pointer;
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
		font-weight: 600;
		float: left;
	}
	
	#checkbox input{
		transform : scale(1.5);
		margin: 0 10px 20px 3px;
	}
	
	#checkbox span{
		float: right;
		text-decoration: underline;
		cursor: pointer;
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

<form:form modelAttribute="memberVO" id="JoinForm">
	<div id="join">
		<img src="/image/logo.png" alt="뉴닉" class="logo" id="logo">
		<br>
		<form:input path="email" placeholder="이메일"></form:input>
		<form:errors path="email" cssClass="error"></form:errors>
		<br>
		<form:password path="pw" placeholder="비밀번호 (8자 이상)"/>
        <form:errors path="pw" cssClass="error"></form:errors>
		<br>
		<form:password path="pw2" placeholder="비밀번호 확인 (8자 이상)"/>
        <form:errors path="pw2" cssClass="error"></form:errors>
		<br>
		<input type="text" name="name" placeholder="닉네임">
	</div>
	
	<div id="checkbox">
		<input type="checkbox" id="checkAll"> <label>약관 전체동의</label>
		<br>
		<input type="checkbox" class="cb" id="c1"> <label>만 14세 이상 가입 동의 (필수)</label>
		<br>
		<input type="checkbox" class="cb" id="c2"> <label>뉴닉 이용약관 동의 (필수)</label> 
		<span><a onclick="window.open('./memberJoin_clause1',
		                 'insert','width = 500, height = 530, top = 100, left = 200, location = no');">약관보기</a></span>
		<br>
		<input type="checkbox" class="cb" id="c3"> <label>개인정보 수집/이용 동의 (필수)</label> 
		<span><a onclick="window.open('./memberJoin_clause2',
		                 'insert','width = 500, height = 530, top = 100, left = 200, location = no');">약관보기</a></span>
		<br>
		<input type="checkbox" class="cb"> <label>뉴스레터 및 이벤트 정보 수신 동의 (선택)</label>
		<br>
	</div>
	
	<div>
		<button type="submit" class="btn" id="JoinBtn">가입하기</button>
	</div>
</form:form>
</div>


<!-- **************************** Script **************************** -->

<script type="text/javascript">


$("#logo").click(function(){
	location.href = "${pageContext.request.contextPath}/";
});


var btn = document.getElementById("JoinBtn");
var cb = document.getElementsByClassName("cb");
var checkAll = document.getElementById("checkAll");

//전체 동의
checkAll.addEventListener('click', function (){
   for(var i=0;i<cb.length;i++){
      cb[i].checked = checkAll.checked;

   }
});


for(var i=0;i<cb.length;i++){
cb[i].addEventListener('click', function (){
   var result= true;
   
   for(var j=0;j<cb.length;j++){
      if(!cb[j].checked){
         result= false;
      }
   }
      
   checkAll.checked = result;
});

}


//필수 선택 동의
var c1 = document.getElementById("c1");
var c2 = document.getElementById("c2");
var c3 = document.getElementById("c3");


$("#JoinBtn").click(function(){

	if(c1.checked && c2.checked && c3.checked){
		   console.log("ok");
	}else{
			alert("필수 항목을 체크하세요");
			return false;
	}
});


</script>

</body>
</html>