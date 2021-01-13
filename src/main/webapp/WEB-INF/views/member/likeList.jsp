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
				</tr>
				
						
			<c:forEach items="${list}" var="vo" varStatus="status">
				<tr>
					<td>${vo.num}</td>
					<td>${vo.newsVO.category }</td>
					<td>${vo.newsVO.title}</td>
					<td>${vo.newsVO.writer}</td>
					<td>${vo.newsVO.regDate}</td>
				</tr>
			</c:forEach>
			</table>
</body>
</html>