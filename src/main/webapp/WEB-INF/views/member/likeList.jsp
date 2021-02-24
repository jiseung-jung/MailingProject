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
		
			<div class="like-title">
				<h1>🧡 좋았슴</h1>
			</div>

			<div id="newsList-body">
				<div id="news-listbox" class="col-12 posts">
					<c:forEach items="${list}" var="vo">
						<div class="card col-md-3" OnClick="location.href ='../news/newsSelect?num=${vo.newsNum}'">
							<c:if test="${vo.fileList[0].fileName ne null}">
								<img alt="" src="/upload/news/${vo.fileList[0].fileName}" width="100%" height="200px"/>
								
								<p class="post-title1">${vo.newsVO.title}</p>
								<span>${vo.newsVO.regDate} &nbsp;  &nbsp;${vo.categoryVO.category_name}</span>
							</c:if>
							<c:if test="${vo.fileList[0].fileName eq null}">
								<p class="post-emoji">${vo.categoryVO.category_emoji} </p>
								<p class="post-title">${vo.newsVO.title}</p>
								<span>${vo.newsVO.regDate} &nbsp;  &nbsp;${vo.categoryVO.category_name}</span>
							</c:if>
						</div>
					</c:forEach>
				</div>
			</div>
			
		</div>
	</div>
</div>
</section>
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>