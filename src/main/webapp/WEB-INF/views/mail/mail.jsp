<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.w3.org/1999/xhtml">
<head>
<meta charset="UTF-8">
<title>메일 발송</title>
<c:import url="../template/bootStrap.jsp"></c:import>
<link href="../css/style.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<!-- include summernote-ko-KR -->
<script src="/css/summernote/lang/summernote-ko-KR.js"></script>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<section>
	<h1>메일 발송</h1>
	<form th:action="@{/mail/mail}" method="post">
	    <!-- <input name="address" placeholder="이메일주소" value=""> <br>-->
	    <input name="title" placeholder="제목"> <br>
	    <textarea id="summernote" name="contents" placeholder="메일 내용을 입력해주세요." cols="60" rows="20"></textarea>
	   	 
	    <button>발송</button>
	</form>
</section>

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
	          ['height', ['height']],
	          ['insert',['picture','link']]
	        ]

	  });
	});
</script>	

</body>
</html>

