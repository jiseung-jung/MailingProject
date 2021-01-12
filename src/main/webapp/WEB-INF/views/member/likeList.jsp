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
<h1>좋아요 목록</h1>
			<table class="table listTable">
				<tr>
					<td>no.</td>
					<td>카테고리</td>
					<td>제목</td>
					<td>작성자</td>
					<td>작성일</td>
					<td>조회수</td>
				</tr>
				
						
			<c:forEach items="${list}" var="vo" varStatus="status">
				<tr>
					<td>${vo.num}</td>
					<td>${vo.categoryVO.category_emoji} ${vo.categoryVO.category_name}</td>
					<td><a href="../news/newsSelect?num=${vo.num}">${vo.title}</a></td>
					<td>${vo.writer}</td>
					<td>${vo.regDate}</td>
					<td>${vo.hit}</td>
				</tr>
			</c:forEach>
			</table>
</body>
</html>