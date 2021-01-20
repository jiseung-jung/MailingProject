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
	
	#newsList-body{
		max-width: 1070px;
    	margin: 0 auto;
    	padding-bottom: 30px;
	}
	
	#news-listbox{
		display: flex;
		flex-wrap: wrap;
    	box-sizing: border-box;
    	padding: 0 0 10px 0;
	}
	
	.news-listbox-div{
		border: 1px solid black;
		height: 310px;
		cursor: pointer;
		padding: 13px;
	}
	
	.news-listbox-div:hover{
		background-color: white;
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

<div id="newsList-body">
  <div id="news-listbox" class="col-12">
	<c:forEach items="${list}" var="vo">
		<div class="news-listbox-div col-md-4" OnClick="location.href ='./newsSelect?num=${vo.num}'">
			<p>${vo.title}</p>
		</div>
	</c:forEach>
  </div>


  <div class="pager">
  	<c:if test="${pager.before}">
  		<a href="./newsList?curPage=${pager.startNum-1}">[이전]</a>
  	</c:if>
  
  	<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
  		<a href="./newsList?curPage=${i}">${i}</a>
  	</c:forEach>
  	
  	<c:if test="${pager.after}">
  		<a href="./newsList?curPage=${pager.lastNum+1}">[다음]</a>
  	</c:if>
  </div>
</div>

</section>
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>