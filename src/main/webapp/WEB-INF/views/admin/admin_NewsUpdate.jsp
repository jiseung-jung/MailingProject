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

	.admin_NewsUpdate{
		padding: 100px 0;	
	}

	#NewsInsert{
    	max-width: 1000px;
    	margin: 0 auto;
	}
	
	#NWtitle{
		border: 0;
		background-color: #ebebeb;
		border-bottom: 1px solid black;
		width: 77%;
		margin: 30px 0;
		font-size: 1.1em;
		padding: 5px 3px;
	}
	
	#NWtitle:focus{
		outline:none;
	}
	
	#NWnewsId{
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
	
	#filebox{
		margin-top: 30px;
	}
	
	.admin_NewsUpdate span{
		font-size: 0.9em;
		cursor: pointer;
	}
	
	#f{
		display: none;
	}
	
	.files{
		margin-bottom: 5px;
	}
	
	.fileList{
		background-color: #ebebeb;
		border: 1px solid black;
		margin-bottom: 5px;
		width: 32.5%;
	}
	

</style>

</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<section class="admin_NewsUpdate">

<form:form modelAttribute="newsVO" id="NewsInsert" enctype="multipart/form-data">

		<input type="hidden" value="${vo.num}" name="num">
	
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
		<form:errors path="newsId" cssClass="error"></form:errors>
	</div>
	
	<div>
		<form:input path="title" id="NWtitle" value="${vo.title}"/>
		<form:errors path="title" cssClass="error"></form:errors>
	</div>
	
	<div>
		<form:textarea path="contents" id="contents"/>
		<form:errors path="contents" cssClass="error"></form:errors>
	</div>
	
	<div id="filebox">
		<c:if test="${fileList[2].oriName eq null}">
		 <div>
			<input type="file" name="files" class="files"> <span id="fileAdd">➕</span> <br>
		</div>
		</c:if>
	</div>
	
	<div id="fileListbox">
			<c:if test="${fileList[0].oriName ne null}">
				<c:forEach items="${fileList}" var="files">
					<div>
						<input type="text" value="${files.oriName}" title="${files.fileName}" class="fileList"> 
						<span class="del fdel">❌</span> <br>
					</div>
				</c:forEach>
			</c:if>
	</div>
	
	<div id="NWbtn">
		<button type="submit" class="btn btn-default nwbtn okbtn">확인</button>
		<input type="button" class="btn btn-default nwbtn nobtn" value="취소">
	</div>

</form:form>

	<div id="f">
		<div>
			<input type="file" name="files" class="files"> <span class="del">❌</span> <br>
		</div>
	</div>


</section>
<c:import url="../template/footer.jsp"></c:import>


<!-- **************************** Script **************************** -->

<script type="text/javascript">

	$('#contents').summernote({
		 height: 450
		});

	$('#contents').summernote('code', '${vo.contents}');

	$(document).ready(function(){
		$("#NWnewsId").val("${vo.newsId}")	
	});


//-----------------------------------------------
	
	var count = $(".fileList").length;
	
	$("#fileAdd").click(function(){
		if(count<2){
			var f = $("#f").html().trim();
			$("#filebox").append(f);
			count++;
		}else{
			alert("첨부파일은 3개까지 가능합니다.");
		}
	});
	
	$("#filebox").on("click", ".del", function() {
		$(this).parent().remove();
		count--;
	});


	$(document).on("click",".fdel",function() {
		var a = $(this);
		var name = $(".fileList").attr('title');
		console.log(name);
		
		$.ajax(
				{
					method:"GET",
					url:"./setDeleteFile",
					data:{fileName:name},
					success:function(data){
						alert(data);
						a.parent().remove();
						count--;
						
					}
				}		
			);
		
	});


//--------------------버튼 이벤트--------------------
	
	$(".nobtn").click(function() {
	 	if(confirm("이 페이지에서 나가시겠습니까?") == true){    //확인
	     	location.href="../news/newsSelect?num=${vo.num}";
	     	
	 	}else{   //취소
	     	return false;
	 	}
	});
</script>	

</body>
</html>