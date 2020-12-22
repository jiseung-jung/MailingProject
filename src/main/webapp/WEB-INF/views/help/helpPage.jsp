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

<style type="text/css">
	
	.help-con h1{
		margin: 50px 0 70px 0;
		font-size: 30px;
		font-weight: 500;
		line-height: 1.2;
	}
	
	.help-con h2 {
		font-size: 17px;
		font-weight: 700;
		padding-bottom: 18px;
	}
	
	#help-box{
		border: 1px solid black;
		margin-bottom: 30px;
	}
	
	#help-box p{
		font-size: 1.5em;
		margin: 0 0 0 15px;
	}

</style>
</head>

<body>

<c:import url="../template/header.jsp"></c:import>
<section class="helpPage">

<div class="container help-con">
	<div class="row">
		<div class="col-12">
		
			<div class="help-title">
				<h1>고객센터를 통해<br>
				궁금증을 해결하세요.</h1>
			</div>
			
			<h2>자주 묻는 질문</h2>
			
			<div id="help-box">
				<div>
					<p>✔ 구독했는데 뉴스레터가 안 와요.</p>
				</div>
				
				<div>
					<p>✔ 지난 뉴스레터는 어디서 볼 수 있나요?</p>
				</div>

				<div>
					<p>✔ 이미 뉴스레터를 구독 중인데요, 웹사이트도 가입해야 하나요?</p>
				</div>	
				
				<div>
					<p>✔ 수신거부하고 싶어요.</p>
				</div>	
				
				<div>
					<p>✔ 구독하는 이메일/닉네임 바꾸고 싶어요.</p>
				</div>

				<div>
					<p>✔ 결제한 콘텐츠, 환불하고 싶어요.</p>
				</div>	
				
				<div>
					<p>✔ 제 피드백에 답장이 잘 안 와요.</p>
				</div>																
			</div>
			
			
		</div>
	</div>
</div>

</section>
<c:import url="../template/footer.jsp"></c:import>

</body>
</html>