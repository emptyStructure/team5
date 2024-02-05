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
		
		let p1 = 0;
		let p2 = 0;
		$("#ph1").keyup(function(){
			let p1Leng = $("#ph1").val().length;
			if(p1Leng == 4 && !isNaN( $("#ph1").val() )) {
				p1 = 1;
			} else {
				p2 = 0;
			}
		});
		
		$("#ph2").keyup(function(){
			let p2Leng = $("#ph2").val().length;
			if(p2Leng == 4 && !isNaN( $("#ph2").val() )) {
				p2 = 1;
			} else {
				p2 = 0;
			}
		});
		
		$("#message").keyup(function(){
			let length = $("#message").val().length;
			$('#textLengthCheck').text("( "+length+" / 100글자 )");
			$('#textLengthCheck').css("color","black");
			if(length>100){
				$('#textLengthCheck').text("( "+length+" / 100글자 ) 100글자까지만 입력 가능합니다.");
				$('#textLengthCheck').css("color","red");
			}
		});
		
		/*신청서 제출*/
		$("#form").submit(function(){
			event.preventDefault();
				let name = $("#name").val();
				let ph = "010-"+$("#ph1").val()+"-"+$("#ph2").val();
				let msg = $("#message").val();

			if(msg.length<=100 && name.length>1 && p1==1 && p2==1){
				if(confirm("신청하시겠습니까?")){
					let sno = $("#sno").val();
					let mno = $("#mno").val();
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
			} else {
				alert("신청서를 다시 확인해주세요.");
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
				<c:if test="${sessionScope.mname ne null }">
					<button class="order">신청하기</button>
				</c:if>
			</div>
			<c:if test="${sessionScope.mname ne null }">
				<form action="./join" method="post" onsubmit="return check()" id="form">
					<div class="name"> 
						이름 : <input type="text" placeholder="이름을 입력하세요." id="name">
					</div>
					<div class="ph">
						연락처 : 010 -  
						<input type="text" id="ph1" class="phn">
						-
						<input type="text" id="ph2" class="phn">
					</div>
					<div class="msg">
							메세지 <br>
							<textarea placeholder="Host에게 전할 말을 적어주세요." id="message"></textarea>
							<span id="textLengthCheck">( 0 / 100글자 )</span>
						<div class="buttons">
							<button type="reset">초기화</button>
							<button type="submit" value="${detail.sno }">참가 요청</button>
							<input type="hidden" value="${detail.sno }" id="sno">
							<input type="hidden" value="${detail.mno }" id="mno">
						</div>
					</div>
				</form>
			</c:if>
		</div>
	</article>
</body>
</html>