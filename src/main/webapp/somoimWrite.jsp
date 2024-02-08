<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소모임 글 작성</title>
<link href="./css/somoimWrite.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"	rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){

	$("#title").keyup(function(){
		let length = $("#title").val().length;
		$('#textLengthCheck').text("( "+length+" / 20글자 )");
		$('#textLengthCheck').css("color","black");
		if(length>20){
			$('#textLengthCheck').css("color","red");
		}
	});
	
	$("#done").click(function(){
		
		let title = $("#title").val();
		let content = $("#summernote").val();
		if(title.length>20||title.length<1||content.length<1){
			alert("작성 내용을 확인해주세요");
		} else{
			$('#somoim').submit();
		}
	});
	
	$('.addrSearch').click(function(){
		var url = "./searchAddr";
        var name = "addr";
        var option = "width = 300, height = 500, top = 100, left = 200, location = no";
		window.open(url, name, option);
	});
	
});
</script>
</head>
<body>
	<div class="container">
		<div class="main">
			<div class="mainStyle">
				<article>
					<h1>글 작성</h1>
					<div class="board">
						<form action="./somoimWrite" method="post" id="somoim">
							<div class="title">
							제목 : <input type="text" id="title" name="title" placeholder="입력">
							<span id="textLengthCheck"> ( 0 / 20글자 )</span>
							</div>
							<div class="cate">
							카테고리 : 
							<select class="category" name="category">
								<option>식사</option>
								<option>게임</option>
								<option>공부</option>
								<option>유흥</option>
							</select>
							</div>
							<div class="per">
							 정원 : 
							<select class="personnel" name="personnel">
								<c:forEach var="i" begin="1" end="20">
								<option>${i }명</option>
								</c:forEach>
							</select>
							</div>
							<div class="addr">
								주소 : <input type="text" id="address" name="address" placeholder="주소">
							<button type="button" class="addrSearch">주소 검색</button>
							</div>
							<textarea id="summernote" name="content"></textarea>
							<button type="button" id="done">작성하기</button>
						</form>
					</div>
				</article>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			$('#summernote').summernote({
				height : 405
			});
		});
	</script>
</body>
</html>