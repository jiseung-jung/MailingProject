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
<section class="adminPage">

<div class="container admin-con">
	<div class="row">
		<div class="col-12">
		
			<div class="board-title">
				<h1>좋아요 ❤</h1>
			</div>

			<table class="table listTable">
				<tr>
					<td>no.</td>
					<td>제목</td>
					<td>작성자</td>
					<td>작성일</td>
				</tr>
				
						
			<c:forEach items="${list}" var="vo" varStatus="status">
				<tr>
					<td>${vo.num}</td>
					<td><a href="../news/newsSelect?num=${vo.newsVO.num}">${vo.newsVO.title}</a></td>
					<td>${vo.newsVO.writer}</td>
					<td>${vo.newsVO.regDate}</td>
					<td>${vo.newsVO.hit}</td>
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