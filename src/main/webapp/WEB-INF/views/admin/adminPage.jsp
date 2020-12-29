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
	
	.adminPage-title h1{
		margin: 50px 0;
		font-size: 30px;
		font-weight: 500;
		line-height: 1.2;
	}
	
	#imoji{
		font-size: 1em;
		margin-right: 2px;
	}
	
	.admin-con{
		padding-bottom: 145px;
	}
	
	.admin-con p{
		font-weight: bold;
		font-size: 2em;
		padding: 20px;
		margin: 0;
	}
	
	.admin-count{
		margin-top: 10px;
		border-top: solid 1px black;
		border-bottom: solid 1px black; 
		cursor: pointer;
	}
	
	.admin-count span{
		color: #fb7800;
	}
	
	#admin-member{
		margin-bottom: 30px;
	}
	
	
</style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<section class="adminPage">

<div class="container admin-con">
	<div class="row">
		<div class="col-12">
		
			<div class="adminPage-title">
				<h1><span id="imoji">⚙</span>관리자 페이지</h1>
			</div>
			
			
			<div class="admin-count" id="admin-member">
				<p>지금 <span>${mCount}</span>명이 NEWNEEK을 사용 중 입니다.</p> 
			</div>
			

			
			<div class="admin-count" id="admin-news">
				<p>지금 <span>${nCount}</span>개의 기사가 있습니다.</p> 
			</div>
		
		
		</div>
	</div>
</div>

</section>
<c:import url="../template/footer.jsp"></c:import>	


<!-- **************************** Script **************************** -->

<script type="text/javascript">

	$("#admin-member").click(function(){
			location.href="${pageContext.request.contextPath}/admin/member/admin_MemberList";
		});

	$("#admin-news").click(function(){
		location.href="${pageContext.request.contextPath}/admin/news/admin_NewsList";
	});

</script>

</body>
</html>