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
</head>
<body>
<c:import url="../template/header.jsp"></c:import>

<section class="helpPage">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="board-title">
					<h1>고객센터를 통해<br>
					궁금증을 해결하세요.</h1>
					<h2>자주 묻는 질문</h2>
				</div>
				
				<div id="help-box">
					<c:forEach items="${list}" var="vo" varStatus="i"> 
						<div class="box-div" title="${i.index+1}">
							<h1 id="box-p${i.index+1}">${vo.title}</h1>
							<div class="box-div-hide" id="box-div-hide${i.index+1}">
								${vo.contents}
							</div>
						</div>
					</c:forEach>
				
				
				<div class="help-email">
					<h3>✋ 해결이 안 된 문제가 있나요?</h3>
					<p>문의내용을 남겨주세요. 영업일 기준 3일 내에 이메일 주소로 답변 드릴게요!<br>🦔고슴이: 뉴닉은 일월화수목 근무하슴!</p>
					<form th:action="@{/mail}" method="post">
				        <input name="address" placeholder="이메일 주소"> <br>
				        <input name="title" placeholder="제목"> <br>
				        <textarea name="contents" placeholder="메일 내용을 입력해주세요." cols="60" rows="10"></textarea>
				        <button>문의하기</button>
	    			</form>
	    			<p><strong>개인정보 수집·이용에 대한 안내</strong><br>
	    			문의를 접수하고 회신하기 위해 최소한의 개인정보(이메일과 문의내용)를 수집하며 후속조치를 위해 1년간 보관합니다. 개인정보 수집·이용을 거부할 수 있으며, 이 경우 답변이 제한됩니다. 더 자세한 내용에 대해서는 개인정보처리방침을 참고하시기 바랍니다.
	    			</p>			
				</div>
				</div>
			</div>
		</div>
	</div>
</section>
<c:import url="../template/footer.jsp"></c:import>

<!-- **************************** Script **************************** -->

<script type="text/javascript">

$(document).ready(function(){
  $(".box-div-hide").addClass('hide');    
});    


$(".box-div").click(function(){
	var val = $(this).attr("title");
	console.log(val);
	var hide =  "box-div-hide"+ val;
	console.log(hide);
	$("#"+ hide).toggle(
      function(){$(".box-div-hide").addClass('show')}, 
      function(){$(".box-div-hide").removeClass('show').addClass('hide')}) 
});


</script>

</body>
</html>