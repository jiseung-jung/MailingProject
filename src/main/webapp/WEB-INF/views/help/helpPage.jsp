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
		border-bottom: none;
		margin-bottom: 50px;
	}
	
	#help-box p{
		font-size: 1.4em;
		margin: 0 0 0 20px;
		cursor: pointer;
	}
	
	#help-box h6{
		margin: 0 0 0 42px;
		line-height: 1.7em;
	}
	
	.box-div{
		padding: 30px 0;
		border-bottom: 1px solid black;
	}
	
	.box-div-hide{
		margin-top: 20px;
	}
	

</style>
</head>

<body>

<c:import url="../template/header.jsp"></c:import>
<section class="helpPage">

<div class="container help-con">
	<div class="row">
		<div class="col-12">
		
			<div class="board-title">
				<h1>고객센터를 통해<br>
				궁금증을 해결하세요.</h1>
			</div>
			
			<h2>자주 묻는 질문</h2>
			
			<div id="help-box">
				<div class="box-div">
					<p id="box-p1">✔ 구독했는데 뉴스레터가 안 와요.</p>
					
					<div class="box-div-hide" id="box-div-hide1">
						<h6>뉴닉 뉴스레터는 월·수·금 오전 5시에 모든 뉴니커에게 한번에 전송돼요. 워낙 많은 뉴니커에게 
							<br>전송하다보니, 메일함에서 뉴스레터를 받아보는 데에 시간 차가 생길 수 있어요.<br>
							<strong>혹시 월·수·금 오전 8시가 지났는데 뉴스레터를 받아보지 못했나요? 그렇다면</strong>
							<br><br>
							<strong>1. 스팸 메일함을 확인해주세요!</strong><br>
								스팸 메일함에 뉴닉의 뉴스레터가 있다면, 해당 이메일 서비스에서 스팸을 해지할 수 있는 버튼을 꾸욱 눌러주세요.<br>
								🦔고슴이: 스팸 싫슴! 밀웜 좋슴!
							<br><br>
							<strong>2. 차단 목록도 확인 부탁드려요.</strong>
							<br><br>
							<strong>3. 마지막으로 whatsup@newneek.co를 주소록에 추가해 주세요.</strong><br>
							<strong>혹시 회사 메일로 구독하셨나요?</strong><br>
								위 3가지 방법을 확인했는데도 메일함에서 고슴이를 볼 수 없다면, 회사 이메일 서버가 뉴닉을 차단하는 것일 수 있어요.<br>
								안타깝게도 이 경우에는 저희가 도와드리기 어려운 점 양해 부탁드리며, 자주 사용하는 개인 이메일로 다시 한 번 구독 신청 권장드릴게요. 🦔
						</h6>
					</div>
				</div>
				
				<div class="box-div">
					<p id="box-p2">✔ 지난 뉴스레터는 어디서 볼 수 있나요?</p>
					
					<div class="box-div-hide" id="box-div-hide2">
						<h6>지금은 뉴스레터 전문을 공개하고 있지는 않아요. <br>
							뉴닉의 완전체 콘텐츠를 제대로 즐기려면 뉴스레터를 구독해주시는 것이 좋습니다!<br>
							웹사이트에서 뉴스레터에 발행된 콘텐츠의 일부를 볼 수 있어요.<br>
							특정 이슈가 궁금할 때 카테고리를 눌러보거나 검색창에 키워드를 입력해서 뉴닉이 쉽고 재미있게 풀어준 콘텐츠를 읽을 수 있답니다.<br>
							웹사이트에서 더 많은 콘텐츠를 읽을 수 있도록 준비 중이니 조금만 기다려주세요🙏🏼!
						</h6>
					</div>
				</div>

				<div class="box-div">
					<p id="box-p3">✔ 이미 뉴스레터를 구독 중인데요, 웹사이트도 가입해야 하나요?</p>
					
					<div class="box-div-hide" id="box-div-hide3">
						<h6>뉴스레터 구독과 웹사이트 회원은 구분이 되어 있어요, <br> 
							웹사이트에 가입하지 않아도 뉴닉 뉴스레터를 받아볼 수 있지만 가입하면 여러 혜택이 있어요 🎁<br>
							<br>
							1. 좋아하는 콘텐츠를 저장할 수 있고<br>
							2. 유료 콘텐츠를 결제 및 읽을 수 있어요 <br>
							3. 키워드별로 뉴닉이 깊이 있게 다루는 FOCUS & 5분 뉴닉 기사도 읽을 수 있고요 <br>
							4. 이외에도 '고슴책 이벤트' 등 홈페이지를 가입해야만 참여할 수 있는 코너가 있으니, <br>
							   &nbsp;&nbsp;&nbsp;&nbsp;가입해서 둘러보는 걸 추천해요! (구글 아이디로 시작하면 5초 만에 가입 가능!)
						</h6>
					</div>
				</div>	
				
				<div class="box-div">
					<p id="box-p4">✔ 수신거부하고 싶어요.</p>
					
					<div class="box-div-hide" id="box-div-hide4">
						<h6>웹사이트에 가입한 경우에는 <span style="color: #fb7800">프로필 설정</span> 페이지에서 이메일 수신여부를 변경할 수 있어요.<br>
							뉴스레터만 구독한 경우에는 각 뉴스레터 하단의 수신거부 버튼을 통해 하실 수 있어요.
						</h6>
					</div>
				</div>	
				
				<div class="box-div">
					<p id="box-p5">✔ 구독하는 이메일/닉네임 바꾸고 싶어요.</p>
					
					<div class="box-div-hide" id="box-div-hide5">
						<h6>아쉽게도 현재는 뉴스레터 하단에 있는 "수신거부" 버튼을 통해 기존 이메일을 수신 거부한 후 <br>
						 	새로운 이메일이나 닉네임으로 다시 구독하는 방법이 유일해요.
						</h6>
					</div>
				</div>

				<div class="box-div">
					<p id="box-p6">✔ 결제한 콘텐츠, 환불하고 싶어요.</p>
					
					<div class="box-div-hide" id="box-div-hide6">
						<h6><strong><고슴이 생존기 - 경제 기본기편></strong><br>
						결제 후 열람을 시작한 경우에는 결제된 금액은 환불해드리지 않아요.<br> 
						결제 후 어떤 콘텐츠도 열람하지 않으신 경우에는, 결제일로부터 7일 이내에 아래 '문의하기'로 요청해주시면 환불을 도와드려요.<br>
						카드사 마다 조금 차이가 있지만, 영업일 기준 3-5일 이내에 처리가 완료됩니다.
						</h6>
					</div>
				</div>	
				
				<div class="box-div">
					<p id="box-p7">✔ 제 피드백에 답장이 잘 안 와요.</p>
					
					<div class="box-div-hide" id="box-div-hide7">
						<h6>우선 모두 답변드리지 못해 죄송한 마음이에요.<br> 
							뉴닉 팀도 모든 피드백에 답변하며 안부 인사도 함께 건네고 싶은 마음이 굴뚝 같지만 😢,<br>
							하루 1000에서 2000여 개 오는 피드백을 모두 답변하기 물리적으로 어려워 많이 고민하고 있습니다.<br>
							하지만 보내주시는 피드백에 항상 감사하며 한 글자 한 글자 놓치지 않고 살펴보고 있답니다.<br>
							혹시 당장 해결해야 하는 문제가 있다면 아래 "문의하기"를 이용해주세요.
						</h6>
					</div>
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


$("#box-p1").click(function(){
	$("#box-div-hide1").toggle(
      function(){$("#box-div-hide1").addClass('show')}, 
      function(){$("#box-div-hide1").removeClass('show').addClass('hide')}) 
});

$("#box-p2").click(function(){
	$("#box-div-hide2").toggle(
      function(){$("#box-div-hide2").addClass('show')}, 
      function(){$("#box-div-hide2").removeClass('show').addClass('hide')}) 
});

$("#box-p3").click(function(){
	$("#box-div-hide3").toggle(
      function(){$("#box-div-hide3").addClass('show')}, 
      function(){$("#box-div-hide3").removeClass('show').addClass('hide')}) 
});

$("#box-p4").click(function(){
	$("#box-div-hide4").toggle(
      function(){$("#box-div-hide4").addClass('show')}, 
      function(){$("#box-div-hide4").removeClass('show').addClass('hide')}) 
});

$("#box-p5").click(function(){
	$("#box-div-hide5").toggle(
      function(){$("#box-div-hide5").addClass('show')}, 
      function(){$("#box-div-hide5").removeClass('show').addClass('hide')}) 
});

$("#box-p6").click(function(){
	$("#box-div-hide6").toggle(
      function(){$("#box-div-hide6").addClass('show')}, 
      function(){$("#box-div-hide6").removeClass('show').addClass('hide')}) 
});

$("#box-p7").click(function(){
	$("#box-div-hide7").toggle(
      function(){$("#box-div-hide7").addClass('show')}, 
      function(){$("#box-div-hide7").removeClass('show').addClass('hide')}) 
});


</script>

</body>
</html>