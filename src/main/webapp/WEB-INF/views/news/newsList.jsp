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
	
	#NL-c-div{
		border-bottom: 1px solid black;
		padding: 30px 0;
		margin-bottom: 30px;
		text-align: center;
	}
	
	#NL-c-div span{
		font-size: 1.1em;
		padding: 0 18px;
	}
	
	#NL-c-div a:hover{
		text-decoration: none;
		color: #fb7800;
	}
	
</style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>

<section>

<div id="NL-c-div">
	<a href="${pageContext.request.contextPath}/news/newsList"><span>전체</span></a>
	<a href="${pageContext.request.contextPath}/news/newsList?kind=newsId&search=1"><span>국내외정치</span></a>
	<a href="${pageContext.request.contextPath}/news/newsList?kind=newsId&search=2"><span>경제</span></a>
	<a href="${pageContext.request.contextPath}/news/newsList?kind=newsId&search=3"><span>노동·인권</span></a>
	<a href="${pageContext.request.contextPath}/news/newsList?kind=newsId&search=4"><span>테크</span></a>
	<a href="${pageContext.request.contextPath}/news/newsList?kind=newsId&search=5"><span>문화</span></a>
	<a href="${pageContext.request.contextPath}/news/newsList?kind=newsId&search=6"><span>환경·에너지</span></a>
	<a href="${pageContext.request.contextPath}/news/newsList?kind=newsId&search=7"><span>코로나19</span></a>
</div>

<div>
	<c:forEach items="${list}" var="vo">
		<div>
			<p>${vo.title}</p>
		</div>
	</c:forEach>
</div>




</section>
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>