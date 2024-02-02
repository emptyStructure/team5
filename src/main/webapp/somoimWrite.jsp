<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			$('#textLengthCheck').text("( "+length+" / 20글자 ) 20글자까지만 입력 가능합니다.");
			$('#textLengthCheck').css("color","red");
		}
	});
	
	$("#submit").click(function(){
		
		let title = $("#title").val();
		let content = $("#content").val();
		if(title.length>20||title.length<1||content.length<1){
			alert("작성 내용을 확인해주세요");
		} else{
			$('#somoim').submit();
		}
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
					<div>
						<form action="./somoimWrite" method="post" id="somoim">
							<input type="text" id="title" name="title" placeholder="입력">
							<select class="category" name="category">
								<option>식사</option>
								<option>게임</option>
								<option>공부</option>
								<option>유흥</option>
							</select>
							<span id="textLengthCheck">( 0 / 20글자 )</span>
							<textarea id="summernote" name="content"></textarea>
							<button type="button" id="submit">작성하기</button>
						</form>
					</div>
				</article>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			$('#summernote').summernote({
				height : 100
			});
		});
	</script>
</body>
</html>