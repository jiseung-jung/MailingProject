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
	table, td, th {
 		border: 1px solid black;
 		text-align: center;
	}
	
	.listTable{
		margin-bottom: 50px;
	}
</style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<section class="adminPage">

<div class="container admin-con">
	<div class="row">
		<div class="col-12">
		
			<div class="board-title">
				<h1>회원 목록</h1>
			</div>
			
			<table class="table listTable">
				<tr>
					<td>no</td>
					<td>이메일</td>
					<td>닉네임</td>
					<td>메일 수신 여부</td>
				</tr>
				
			<c:forEach items="${list}" var="vo">
				<tr>
					<td></td>
					<td>${vo.email}</td>
					<td>${vo.name}</td>
					<td>
					<c:choose>
						<c:when test="${vo.mailCheck eq 1}">
							<div style="color: #0066ff">yes</div>
						</c:when>
					
						<c:otherwise>
							<div style="color: #ff3300">no</div>
						</c:otherwise>
					</c:choose>
					</td>
				</tr>
			</c:forEach>
			</table>


		</div>
	</div>
</div>
</section>
<c:import url="../template/footer.jsp"></c:import>	

</body>
</html>