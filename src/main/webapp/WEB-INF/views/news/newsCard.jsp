<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:forEach items="${list}" var="vo">
	

	<div class="card col-md-3" OnClick="location.href ='./newsSelect?num=${vo.num}'">
		<c:if test="${vo.fileList[0].fileName ne null}">
			<img alt="" src="/upload/news/${vo.fileList[0].fileName}" width="100%" height="200px"/>
			
			<p class="post-title1">${vo.title}</p>
			<span>${vo.regDate} &nbsp;  &nbsp;${vo.categoryVO.category_name}</span>
		</c:if>
		<c:if test="${vo.fileList[0].fileName eq null}">
			<p class="post-emoji">${vo.categoryVO.category_emoji} </p>
			<p class="post-title">${vo.title}</p>
			<span>${vo.regDate} &nbsp;  &nbsp;${vo.categoryVO.category_name}</span>
		</c:if>
	</div>
</c:forEach>
