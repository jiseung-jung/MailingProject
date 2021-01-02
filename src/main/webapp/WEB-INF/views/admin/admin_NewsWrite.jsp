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

<style type="text/css">

	#NewsInsert{
    	max-width: 1000px;
    	min-height: 100vh;
    	margin: 0 auto;		
	}
	
	#NWtitle{
		border: 0;
		background-color: #ebebeb;
		border-bottom: 1px solid black;
		width: 70%;
		margin: 30px 0;
		font-size: 1.1em;
		padding-left: 3px;
	}
	
	#NWtitle:focus{
		outline:none;
	}
	
	#NWnewsId{
		margin-top: 100px;
		border: 0;
		background-color: #ebebeb;
		font-size: 0.9em;
	}
	
	#NWbtn{
		text-align: center;
		margin-top: 30px;
	}
	
	.nwbtn{
		border: 1px solid black;
		font-size: 0.9em;
		border-radius: 0;
	}
	
	.okbtn{
		background-color: #737373;
		color: white;
		margin-right: 3px;
	}
	
</style>

</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<section class="admin_NewsWrite">

<form:form modelAttribute="newsVO" id="NewsInsert">
	
	<div>
		<form:select path="newsId" id="NWnewsId">
			<form:option value="0" label="-카테고리 선택-"/>
			<form:option value="1" label="국내외정치"/>
			<form:option value="2" label="경제"/>
			<form:option value="3" label="노동·인권"/>
			<form:option value="4" label="테크"/>
			<form:option value="5" label="문화"/>
			<form:option value="6" label="환경·에너지"/>
			<form:option value="7" label="코로나19"/>
		</form:select>
	</div>
	
	<div>
		<form:input path="title" id="NWtitle" placeholder="제목을 입력하세요."/>
	</div>
	
	<div>
		<form:textarea path="contents" id="contents"/>
	</div>
	
	<div id="NWbtn">
		<button class="btn btn-default nwbtn okbtn">확인</button>
		<button class="btn btn-default nwbtn nobtn">취소</button>
	</div>

</form:form>



</section>
<c:import url="../template/footer.jsp"></c:import>


<script type="text/javascript">
	$('#contents').summernote({
		 height: 400
		});
</script>	
</body>
</html>