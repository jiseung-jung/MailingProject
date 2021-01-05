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
<section class="helpPage">

<div class="container help-con">
	<div class="row">
		<div class="col-12">
		
			<div class="board-title">
				<h1>고객센터를 통해<br>
				궁금증을 해결하세요.</h1>
			</div>
			
			<h2>자주 묻는 질문</h2>
			
			<div id="help-box">
			<c:forEach items="${list}" var="vo" varStatus="i"> 
				<div class="box-div" title="${i.index+1}">
					<p id="box-p${i.index+1}">${vo.title}</p>
					
					<div class="box-div-hide" id="box-div-hide${i.index+1}">
						<h6>${vo.contents}</h6>
					</div>
				</div>
			</c:forEach>
			</div>
			
			<div class="help-email">
				<form th:action="@{/mail}" method="post">
			        <input name="address" placeholder="이메일 주소"> <br>
			        <input name="title" placeholder="제목"> <br>
			        <textarea name="contents" placeholder="메일 내용을 입력해주세요." cols="60" rows="20"></textarea>
			        <button>발송</button>
    			</form>			
			</div>
		</div>
	</div>
</div>

</section>
<c:import url="../template/footer.jsp"></c:import>

<!-- **************************** Script **************************** -->

<script type="text/javascript">

$(document).ready(function(){
  $(".box-div-hide").addClass('hide');

 
  $('#summernote').summernote({
	  height: 300,                 // 에디터 높이
	  minHeight: null,             // 최소 높이
	  maxHeight: null,             // 최대 높이
	  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
	  lang: "ko-KR",				// 한글 설정
     	  placeholder: "내용",				
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


$(".box-div").click(function(){
	var val = $(this).attr("title");
	console.log(val);
	var hide =  "box-div-hide"+ val;
	console.log(hide);
	$("#"+ hide).toggle(
      function(){$(".box-div-hide").addClass('show')}, 
      function(){$(".box-div-hide").removeClass('show').addClass('hide')}) 
});


</script>

</body>
</html>