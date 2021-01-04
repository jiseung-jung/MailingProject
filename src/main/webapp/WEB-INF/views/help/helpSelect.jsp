<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../template/bootStrap.jsp"></c:import>
<link href="../css/style.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<section class="adminPage">

<div class="container admin-con">
	<div class="row">
		<div class="col-12">
			<div class="board-title">
				<h1>자주묻는질문</h1>
			</div>
			
			<div>
				<p>${vo.title}</p>
				<p>${vo.writer}</p>
				<p>${vo.contents}</p>
				<p>${vo.regDate}</p>
			</div>
			
			<div class="section-footer">
				<button type="button" id="del-btn">글삭제</button>
				<button type="button" id="alter-btn">글수정</button>
			</div>
		</div>
	</div>
</div>
</section>

<script type="text/javascript">
$("#del-btn").click(function() {
	if (confirm("정말 삭제하시겠습니까?") == true){    
		location.href="./helpDelete?num=${vo.num}";

	}else{   
		return false;
	}
});

$("#alter-btn").click(function() {
	if (confirm("수정하시겠습니까?") == true){    
		location.href="./helpUpdate?num=${vo.num}";

	}else{   
		return false;
	}
});
	
</script>
<c:import url="../template/footer.jsp"></c:import>	
</body>
</html>