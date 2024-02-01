<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${detail.stitle } / ${detail.swriter }님</title>
<link href="./css/sodetail.css" rel="stylesheet"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript">
$(document).ready(function(){
		$("#form").hide();
		
		$(".order").click(function(){
			$("#form").slideToggle("slow");
		});
		
		$("#form").submit(function(){
			event.preventDefault();
			
			if(confirm("신청하시겠습니까?")){
				let sno = $("#sno").val();
				let mno = $("#mno").val();
				let name = $("#name").val();
				let ph = $("#ph").val();
				let msg = $("#message").val();
				$.ajax({
					url:'./joinsomoim',
					type:'post',
					dataType:'text',
					data:{'sno':sno,"mno":mno,"name":name,"ph":ph,"msg":msg},
					success: function(result){
						if(result==1){
							alert("신청이 완료되었습니다.");
							$("#form")[0].reset();
							$("#form").slideToggle("slow");
						} else {
							alert("신청에 실패했습니다. 관리자에게 문의하세요");
						}
					},
					error: function(request, status, error){ //통신오류
						alert("에러 발생");
					}
				});
			}
		});
});
</script>
</head>
<body>
	<article>
		<div class="detail">
			<div class="soheader">
				<div class="title">
					${detail.stitle }
				</div>
				<div class="category">
					${detail.scategory }
				</div>
			</div>
			<div class="body">
				<div class="info">
					<div class="writer">${detail.swriter }</div>
					<div class="view">👪 ${detail.total } / ❤️ 100</div>
				</div>
				<div class="conStyle">
					<div class="content">${detail.scontent }</div>
				</div>
				<button class="order">신청하기</button>
			</div>
			<form action="./join" method="post" onsubmit="return check()" id="form">
				<div class="name"> 
					이름 <input type="text" placeholder="이름을 입력하세요." id="name">
				</div>
				<div class="ph">
					연락처 <input type="text" placeholder="전화번호를 입력하세요." id="ph">
				</div>
				<div class="msg">
						메세지 <br>
						<textarea placeholder="Host에게 전할 말을 적어주세요." id="message"></textarea>
					<div class="buttons">
						<button type="reset">초기화</button>
						<button type="submit" value="${detail.sno }">참가 요청</button>
						<input type="hidden" value="${detail.sno }" id="sno">
						<input type="hidden" value="${detail.mno }" id="mno">
					</div>
				</div>
			</form>
		</div>
	</article>
</body>
</html>