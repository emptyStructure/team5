<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 작성</title>
<link href="./css/letterWrite.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"	rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){

	$("#title").keyup(function(){
		let length = $("#title").val().length;
		$('#textLengthCheck').text("( "+length+" / 10글자 )");
		$('#textLengthCheck').css("color","black");
		if(length>10){
			$('#textLengthCheck').text("( "+length+" / 10글자 ) 10글자까지만 입력 가능합니다.");
			$('#textLengthCheck').css("color","red");
		}
	});
	
	$("#done").click(function(){
		let title = $("#title").val();
		let content = $("#summernote").val();
		let receiver = $("#receiver").val();
		
		if(title.length>10||title.length<1||content.length<1||receiver.length<1){
			alert("작성 내용을 확인해주세요");
		} else{
			$.ajax({
				url:'./letterWrite',
				type:'post',
				dataType:'text',
				data: {'title':title,'receiver':receiver, 'content':content},
				success: function(result){
					if(result==1){
						alert("발송 성공");
						window.close();
					} else {
						alert("존재하지 않은 사용자입니다. 수신자을 확인해주세요.");
						$('#receiver').focus();
					}
				}, error: function(request, status, error){
					alert("통신 오류");
				}
			});
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
					<h1>쪽지 작성</h1>
					<div class="letter">
						<form action="./letterWrite" method="post" id="letter">
							<div class="lhead">
								<div class="title">
									제목 :
									<input type="text" id="title" name="title" placeholder="제목">
								</div>
								<div class="receiver">
									받는사람 : 
									<input type="text" id="receiver" name="receiver" placeholder="받는사람">
								</div>
							</div>
								<div>
								<span id="textLengthCheck">( 0 / 10글자 )</span>
								<textarea id="summernote" name="content"></textarea>
							</div>
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