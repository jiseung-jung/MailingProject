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
 		border: 1px solid black;
 		text-align: center;
	}
	
	.pager{
		margin-bottom: 70px;
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
				<h1>회원 목록</h1>
			</div>
			
			<table class="table listTable">
				<tr>
					<td>no.</td>
					<td>이메일</td>
					<td>닉네임</td>
					<td>메일 수신 여부</td>
				</tr>
				
				<c:if test="${pager.curPage eq 1}">
				<tr style="background-color: #cccccc">
					<td>-</td>
					<td>${member.email}</td>
					<td>${member.name}</td>
					<td>
					<c:choose>
						<c:when test="${member.mailCheck eq 1}">
							<div>O</div>
						</c:when>
					
						<c:otherwise>
							<div>X</div>
						</c:otherwise>
					</c:choose>
					</td>
				</tr>
				</c:if>
				
				<c:forEach items="${list}" var="vo" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td>${vo.email}</td>
					<td>${vo.name}</td>
					<td>
					<c:choose>
						<c:when test="${vo.mailCheck eq 1}">
							<div>O</div>
						</c:when>
					
						<c:otherwise>
							<div>X</div>
						</c:otherwise>
					</c:choose>
					</td>
				</tr>
			</c:forEach>
			</table>
			
			
  <div class="pager">
  	<c:if test="${pager.before}">
  		<a href="./admin_MemberList?curPage=${pager.startNum-1}">[이전]</a>
  	</c:if>
  
  	<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
  		<a href="./admin_MemberList?curPage=${i}">${i}</a>
  	</c:forEach>
  	
  	<c:if test="${pager.after}">
  		<a href="./admin_MemberList?curPage=${pager.lastNum+1}">[다음]</a>
  	</c:if>
  </div>


		</div>
	</div>
</div>
</section>
<c:import url="../template/footer.jsp"></c:import>	

<script type="text/javascript">


</script>

</body>
</html>