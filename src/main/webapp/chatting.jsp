<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<link href="./css/menu.css" rel="stylesheet"/>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<title>오픈 채팅</title>
<script>function url(url) {window.location.href = url;}</script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#chattingBtn").click(function(){
		//alert("버튼을 클릭하였습니다.");
		let chatting = $("#chatting").val();
	   
	    $.ajax({
	    	url : './chatting',
	    	type : 'post',
	    	dataType : 'html',
	    	data : {'mscontent' : chatting},
	    	success : function(result) {
	    		location.reload();
				$("#chatting").val('');
	    	},
	    	error : function(error) {
	    		alert("에러");
	    	}
	    });
		
	})
	$("#chatting").keyup(function(){
	    let text = $(this).val();
	    if(text.length > 15){
	       alert("15자 넘었어요.");
	       $(this).val(  text.substr(0, 15)   );   
	    }
	    $("#chattingBtn").text("전송 " + text.length +  "/15");
	 });
	
	  function scrollToBottom() {
		    var element = document.getElementById('mscontent');
		    element.scrollTop = element.scrollHeight;
		  }

		  // 페이지가 로드될 때 함수 호출
		  scrollToBottom();
});
</script>
<style>
#main {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-20%, -50%);
    text-align: center;
  }
 .chat {
  	background-image : url('img/kakao.jpg');
  	background-size : cover;
  	width : 300px;
  	height: 500px;
  }
.mscontent {
	text-align: left;
	overflow-y: scroll;
	height: 100%;
}
 body{
 	background-image: url('img/friends.gif');
 	background-size: cover;
 	background-repeat: no-repeat;
 	margin: 0;
 	padding: 0;
 }
</style>
</head>
<body>
	<div id="container">
		<header>
			<div id="menu">
				<%@ include file="menu.jsp"%>
				<h2>601 오픈 채팅</h2>
			</div>
		</header>
		<div id="main">
			<article>
				<div class="chat">
					<div class="mscontent" id="mscontent">
					<c:forEach var="chat" items="${chatlist }">
					<h4><i class="xi-user"></i> ${chat.mname }</h4>
					<h5>${chat.mscontent }<small> ${chat.sendDate }</small></h5>
					<br>
					</c:forEach>
					</div>
				</div>
				<div class="write">
				<input type="text" name="chatting" id="chatting" placeholder="이곳에 입력하세요.">
				<button type="submit" id="chattingBtn">전송</button>
				</div>
			</article>
		</div>
		
		</div>
</body>
</html>