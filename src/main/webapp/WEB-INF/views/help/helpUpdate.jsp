<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../template/bootStrap.jsp"></c:import>
<link href="../css/style.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<!-- include summernote-ko-KR -->
<script src="/css/summernote/lang/summernote-ko-KR.js"></script>
<title>Insert title here</title>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<section class="adminPage">

<div class="container admin-con">
	<div class="row">
		<div class="col-12 col-sm-12">
			<div class="board-title">
				<h1>자주묻는질문</h1>
			</div>
			<form method="post" action="./helpUpdate" class="helpUpdate">
				<input type="hidden" name="num" value="${vo.num}">
			
				<input type="text" class="form-control" name="title" id="title" value="${vo.title}">
				
				<input type="text" class="form-control" name="writer" id="writer" value="${vo.writer}">
				
				<textarea id="summernote" name="contents">${vo.contents}</textarea>
			
				<button type="submit" class="write-btn">작성</button>
			</form>

		</div>
	</div>
</div>
</section>
<c:import url="../template/footer.jsp"></c:import>
<script type="text/javascript">
$(document).ready(function() {
	  $('#summernote').summernote({
		  height: 300,                 // 에디터 높이
		  minHeight: null,             // 최소 높이
		  maxHeight: null,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",				// 한글 설정				
		  toolbar: [
	          ['style', ['bold', 'italic', 'underline', 'clear']],
	          ['font', ['strikethrough', 'superscript', 'subscript']],
	          ['fontsize', ['fontsize']],
	          ['color', ['color']],
	          ['para', ['ul', 'ol', 'paragraph']],
	          ['height', ['height']]
	        ]

	  });
	});
</script>	
</body>
</html>