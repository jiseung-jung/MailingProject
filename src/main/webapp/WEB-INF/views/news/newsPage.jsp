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
	

	
</style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<section>

	<div id="NL-c-div">
		<a href="${pageContext.request.contextPath}/news/newsPage?kind=newsId&search="><span>전체</span></a>
		<a href="${pageContext.request.contextPath}/news/newsPage?kind=newsId&search=1"><span>⚖️ 국내외정치</span></a>
		<a href="${pageContext.request.contextPath}/news/newsPage?kind=newsId&search=2"><span>💰 경제</span></a>
		<a href="${pageContext.request.contextPath}/news/newsPage?kind=newsId&search=3"><span>💪 노동·인권</span></a>
		<a href="${pageContext.request.contextPath}/news/newsPage?kind=newsId&search=4"><span>🤖 테크</span></a>
		<a href="${pageContext.request.contextPath}/news/newsPage?kind=newsId&search=5"><span>🧸 문화</span></a>
		<a href="${pageContext.request.contextPath}/news/newsPage?kind=newsId&search=6"><span>🌳 환경·에너지</span></a>
		<a href="${pageContext.request.contextPath}/news/newsPage?kind=newsId&search=7"><span>😷 코로나19</span></a>
	</div>

	<div id="newsList-body">
		<div id="news-listbox" class="col-12">
	
		</div>
	 </div>
	
  	<div class="category_pager">
  		<button type="button" id="add-btn">더보기</button>
  	</div>
  	
</section>
<c:import url="../template/footer.jsp"></c:import>
<script type="text/javascript">
	
	var url = decodeURIComponent(window.location.href);
	var c_num = url.substring(url.indexOf("search=")+7);
	var startRow = 0;
	var addRow = 8;

	console.log(url);
	console.log(c_num);
	getList();


	$("#add-btn").click(function() {
		startRow += 8; 
		getList();
		
	});

	function getList() {

		$.ajax({
			url:"./newsList",
			type: "GET",
			data:{kind :"newsId", search:c_num, startRow: startRow, perPage: addRow},
			success:function(data){
				$("#news-listbox").append(data);
			}
		});		
	}
	
</script>
</body>
</html>