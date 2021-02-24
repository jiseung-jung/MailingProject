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
 		border: 1px solid black !important;
 		text-align: center;
	}
	
	.pager{
		margin-bottom: 70px;
	}
	
	#nWritebtn{
		margin-bottom: 30px;
		border: 1px solid black;
		font-size: 0.9em;
	}
	
	#searchFrm{
		display: flex;
		float: right;
		font-size: 0.9em;
	}
	
	#searchFrm select{
		background-color: #ebebeb;
	}
	
	#searchFrm button{
		padding: 0px;
		margin-left: 2px;
	}
	
	.search{
		margin-left: 1.5px;
		height: 26px;
		background-color: #ebebeb;
		border: 1px solid #737373;
		font-size: 0.9em;
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
				<h1>기사 목록</h1>
			</div>
			
			<button class="btn btn-default" id="nWritebtn">글쓰기</button>
			
			<form action="./admin_NewsList" id="searchFrm">
					<select name="kind" id="List-kind">
						<option>--전체--</option>
						<option value="newsId">카테고리</option>
						<option value="title">제목</option>
						<option value="contents">내용</option>
					</select>
				
				<div class="search-div">
				
				</div>
					<button class="btn btn-default" type="submit">
						<img alt="" src="../image/search111.png" width="20px" height="20px">
					</button>
			</form>
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
					<td>${vo.categoryVO.category_emoji} ${vo.categoryVO.category_name}</td>
					<td><a href="../news/newsSelect?num=${vo.num}">${vo.title}</a></td>
					<td>${vo.writer}</td>
					<td>${vo.regDate}</td>
				</tr>
			</c:forEach>
			</table>
			
			
  <div class="pager">
  	<c:if test="${pager.before}">
  		<a href="./admin_NewsList?curPage=${pager.startNum-1}">[이전]</a>
  	</c:if>
  
  	<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
  		<a href="./admin_NewsList?curPage=${i}">${i}</a>
  	</c:forEach>
  	
  	<c:if test="${pager.after}">
  		<a href="./admin_NewsList?curPage=${pager.lastNum+1}">[다음]</a>
  	</c:if>
  </div>


		</div>
	</div>
</div>
</section>
<c:import url="../template/footer.jsp"></c:import>	

<!-- **************************** Script **************************** -->

<script type="text/javascript">

$("#nWritebtn").click(function(){
	location.href="./admin_NewsWrite";		
});


$("#List-kind").click(function(){
    var List_kind = $("#List-kind option:selected").val();
    var hml = "";
    
    if(List_kind == "newsId"){
  	 hml += "<select class='search' name='search'>";
  	 hml += "<option>--전체--</option>";
	     hml += "<option value='1'>국내외정치</option>";
	     hml += "<option value='2'>경제</option>";
	     hml += "<option value='3'>노동·인권</option>";
	     hml += "<option value='4'>테크</option>";
	     hml += "<option value='5'>문화</option>";
	     hml += "<option value='6'>환경·에너지</option>";
	     hml += "<option value='7'>코로나19</option>";
    }else if(List_kind == "title" || List_kind == "contents"){
  	  hml += "<input type='text' class='search' name='search'>";
    }

$(".search-div").html(hml);

});

</script>

</body>
</html>