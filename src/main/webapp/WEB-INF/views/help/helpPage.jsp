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
			<c:forEach items="${list}" var="vo" varStatus="i"> 
				<div class="box-div" title="${i.index+1}">
					<p id="box-p${i.index+1}">${vo.title}</p>
					
					<div class="box-div-hide" id="box-div-hide${i.index+1}">
						<h6>${vo.contents}</h6>
					</div>
				</div>
			</c:forEach>
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