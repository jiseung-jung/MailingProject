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

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<section class="admin_NewsWrite">

<form:form modelAttribute="newsVO" id="NewsInsert">
	
	<label>카테고리:</label>
	<form:select path="newsId">
		<form:option value="1" label="국내외정치"/>
		<form:option value="2" label="경제"/>
		<form:option value="3" label="노동·인권"/>
		<form:option value="4" label="테크"/>
		<form:option value="5" label="문화"/>
		<form:option value="6" label="환경·에너지"/>
		<form:option value="7" label="코로나19"/>
	</form:select>

</form:form>



</section>
<c:import url="../template/footer.jsp"></c:import>	
</body>
</html>