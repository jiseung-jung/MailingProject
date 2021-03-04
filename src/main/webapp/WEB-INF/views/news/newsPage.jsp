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

</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<section>

	<div id="NL-c-div">
		<a href="${pageContext.request.contextPath}/news/newsPage?kind=category_name&search="><span>전체</span></a>
		<a href="${pageContext.request.contextPath}/news/newsPage?kind=category_name&search=국내외정치"><span>⚖️ 국내외정치</span></a>
		<a href="${pageContext.request.contextPath}/news/newsPage?kind=category_name&search=경제"><span>💰 경제</span></a>
		<a href="${pageContext.request.contextPath}/news/newsPage?kind=category_name&search=노동·인권"><span>💪 노동·인권</span></a>
		<a href="${pageContext.request.contextPath}/news/newsPage?kind=category_name&search=테크"><span>🤖 테크</span></a>
		<a href="${pageContext.request.contextPath}/news/newsPage?kind=category_name&search=문화"><span>🧸 문화</span></a>
		<a href="${pageContext.request.contextPath}/news/newsPage?kind=category_name&search=환경·에너지"><span>🌳 환경·에너지</span></a>
		<a href="${pageContext.request.contextPath}/news/newsPage?kind=category_name&search=코로나19"><span>😷 코로나19</span></a>
	</div>

	<div id="newsList-body">
		<h1 class="newList-title"></h1>
		<div id="news-listbox" class="col-12 posts">
		
		</div>
	 </div>
	
  	<div class="category_pager">
  		<button type="button" id="add-btn">더보기</button>
  	</div>
  	
</section>
<c:import url="../template/footer.jsp"></c:import>
<script type="text/javascript">
	
	var url = decodeURIComponent(window.location.href);
	var kind= url.indexOf("kind=");
	
	if(kind!=-1){
		var c_kind = url.substring(url.indexOf("kind=")+5, url.indexOf("&"));
	} else {
		var c_kind = '';
	}
	
	var c_title = url.substring(url.indexOf("search=")+7);
	var startRow = 0;
	var addRow = 8;
	
	$(".newList-title").append(c_title);

	console.log(url);
	console.log(c_title);
	console.log(c_kind);
	getList();
	
	$("#add-btn").click(function() {
		var count = $('.card').length;
		startRow += 8; 
		console.log("startRow" + startRow);
		console.log("count" + count);
		
		getList();
		if(count < startRow) {
				$("#add-btn").addClass("hide");
			}
		
		
	});

	function getList() {

		$.ajax({
			url:"./newsList",
			type: "GET",
			data:{kind :c_kind, search: c_title, startRow: startRow, perPage: addRow},
			success:function(data){
				$("#news-listbox").append(data);
				console.log($('.card').length);
				if($('.card').length==0 ){
					$(".newList-title").remove();
					$(".category_pager").remove();
					$("#news-listbox").html("<div><h1 class=\"newList-title\">" + c_title + " <strong>관련된 이슈를 아직 다루지 않았어요!</strong></h1></div>");
					$("#news-listbox").addClass("newsList-ht");
					}
			}
		});
	}
	
</script>
</body>
</html>