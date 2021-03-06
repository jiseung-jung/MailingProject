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

	#Sel-head{
		border-bottom: 1px solid black;
		text-align: center;	
	}
	
	#Sel-title{
		max-width: 1000px;
    	margin: 0 auto;
    	padding: 70px 0;
    	font-weight: bold;
	}
	
	#Sel-title p{
		font-size: 2.6em;
		padding: 8px 0 15px 0;
	}
	
	#Sel-title-s1{
		color: #fb7800;
		text-decoration: underline;
		cursor: pointer;
		font-size: 1.05em;
	}
	
	#Sel-head button{
		padding: 0 6px;
		margin-top: -10px;
		margin-bottom: 10px;
	}
	
	#Sel-body{
		padding: 48px 0 30px 0;
	}
	
	.Sel-contents{
		max-width: 1000px;
    	margin: 0 auto;
    	padding: 0 100px;
    	
	}
	
	
	
</style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<section class="admin_NewsSelect">

<div class="Select-Container">
 <div id="Sel-head">	
	<div id="Sel-title">
		<a href="./newsPage?kind=category_name&search=${vo.category_name}"><span id="Sel-title-s1">${vo.category_name}</span></a><br>
		<p>${vo.title}</p>
		<span id="Sel-title-s2">${vo.regDate}</span>
	</div>
	
	<c:if test="${member.email eq 'admin@newneek.com'}">
		<button class="btn btn-default" id="upbtn">수정</button>
		<button class="btn btn-default" id="delbtn">삭제</button>
	</c:if>
 </div>	
 
 <div id="Sel-body">
 	<div class="Sel-contents">
 		<p>${vo.contents}</p>
 	</div>
 	
 	<c:if test="${vo.newsFilesVO ne null}">
 	 <div class="Sel-contents">
 		<label>첨부파일:</label> <br>
 		<c:forEach items="${vo.newsFilesVO}" var="fileList">
 			<a href="newsFileDown?fnum=${fileList.fnum}"><img alt="" src="/upload/news/${fileList.fileName}" width="200px" height="200px">${fileList.oriName}</a><br>
 		</c:forEach>
 		
 	 </div>
 	</c:if>
 </div>
 
<c:if test="${member ne null }">
  <div class="inbox-actions">
    <button type="submit" id="inbox-heart">
    	<span class="like ${class}" id="heart">❤</span>
    	<span id ="like-item">좋았슴</span>
    </button>
  </div>
</c:if>


	
</div>

</section>
<c:import url="../template/footer.jsp"></c:import>


<!-- **************************** Script **************************** -->

<script type="text/javascript">

	$("#upbtn").click(function(){
		location.href="../admin/admin_NewsUpdate?num=${vo.num}";
	});

	$("#delbtn").click(function(){
		if(confirm("삭제하시겠습니까?")== true){
			location.href="../admin/admin_NewsDelete?num=${vo.num}";			
		}else{
			return false;
		}
	});

	var check = "${class}";

	$("#inbox-heart").click(function(){
			$.ajax({ 
				type: 'POST',
				url: "./newsLike",
				data: {newsNum :"${num}", email:"${email}" },
				error: function(error) {
					console.log("error");
				},
				success: function(data) {
					console.log("success");
					if(check=="active") {
						$("#heart").removeClass("active");
					}

					if(check=="") {
						$("#heart").addClass("active");
						
					}					
					//alert(check);
					location.reload(true);
				}
				});
	});

</script>
</body>
</html>