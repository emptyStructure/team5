<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<link href="./css/header.css" rel="stylesheet"/>
<link href="./css/index.css" rel="stylesheet"/>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<title>채팅</title>
<script>function url(url) {window.location.href = url;}</script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
$(function(){
	
	$(".personalChatBtn").click(function(){
		let personalChat = $(this).val();

		window.location.href = "./personalchat?toMno=" + personalChat;
	    
	    return false;
	})
	
	$("#chattingBtn").click(function(){
		//alert("버튼을 클릭하였습니다.");
		let chatting = $("#chatting").val();
	   
		if (chatting.trim() === "") {
			alert("1글자 이상 적어주세요.");
			return;
		}
		
	    $.ajax({
	    	url : './chatting',
	    	type : 'post',
	    	dataType : 'html',
	    	data : {'mscontent' : chatting},
	    	success : function(result) {
	    		if (result == 1) {
	    		location.reload();
				$("#chatting").val('');
	    		} else if (result == 0) {
					alert("로그인 해주세요.");	    			
	    		}
	    	},
	    	error : function(error) {
	    		alert("에러");
	    	}
	    });
		
	})
	$("#chatting").keyup(function(){
	    let text = $(this).val();
	    if(text.length > 50){
	       alert("50자 넘었어요.");
	       $(this).val(  text.substr(0, 50)   );   
	    }
	    $("#chattingBtn").text("전송 " + text.length +  "/50");
	 });
	
	  function scrollToBottom() {
		    var element = document.getElementById('mscontent');
		    element.scrollTop = element.scrollHeight;
		  }

		  // 페이지가 로드될 때 함수 호출
		  scrollToBottom();
});
</script>
<script type="text/javascript">
$(document).ready(function() {
  
  //말풍선 길이 변경
  adjustBackgroundLength();

  //테마 변경
  
  $("#themeBtn").click(function() {
	  toggleTheme();
  });
  
  let themeApplied = loadThemePreference() == 'dark';
  
  function toggleTheme() {
	  themeApplied = !themeApplied;
	  
	  if(themeApplied) {
		  applyDarkTheme();
		  saveThemePreference('dark');
	  } else {
		  applyOriginalTheme();
		  saveThemePreference('original');
	  }
  }
  
  if(themeApplied) {
	  applyDarkTheme();
  } else {
	  applyOriginalTheme();
  }
  
  function applyDarkTheme() {
	$(".chat").css({
		"background-image": "url('img/friends4.gif')"
	});
  }
  
  
  function applyOriginalTheme() {
	  $(".chat").css({
			"background-image": "url('img/friends3.gif')"
		});
	  }
  
  
  $("#chatting").keydown(function(event) {
      if (event.keyCode === 13) {  // Enter 키 코드
          event.preventDefault();  // 기본 동작 방지 (줄바꿈)
          $("#chattingBtn").click();  // 버튼 클릭
      }
  });
	
  //추가 1
  updateChat();
  
  //추가2
  setInterval(updateChat, 1000);
  
   $('#mscontent').on('scroll', function() {
    const chatContainer = document.getElementById("mscontent");
    autoScroll = chatContainer.scrollHeight - chatContainer.clientHeight <= chatContainer.scrollTop + 1;
  });
  //추가3
  function updateChat() {
	  $.ajax({
		  url: './updateChat',
	  	  type: 'get',
	  	  dataType: 'html',
	  	  success: function(result) {
	  		  $("#mscontent").html(result);
	  		  adjustBackgroundLength();
	  		  
			  if(autoScroll || isScrolledToBottom) {
	  		  chatContainer.scrollTop = chatContainer.scrollHeight;
			  }
			
	  	  },
	  	  error: function(error) {
	  		  alert("에러");
	  	  }
	  });
  }
  //여기까지
  
  
  
  
  $("#chatting").on("input", function() {
    adjustBackgroundLength();
  });
	
  
  function adjustBackgroundLength() {
    $(".mscontent h5").css("width", "auto"); // 초기화

    $(".mscontent h5").each(function() {
      var textLength = $(this).text().length;
      var dynamicWidth = (textLength / 50) * 70; // 30자를 기준으로 계산

      $(this).css("width", dynamicWidth + "%");
    });
  }
});
function saveThemePreference(theme) {
	localStorage.setItem('themePreference', theme);
}
function loadThemePreference() {
	return localStorage.getItem('themePreference') || 'original';
}
</script>
<style>
* {
    cursor: url("./img/pngegg(1)(1).png") 12 12, auto;
}

#main {
    margin: auto;
	width: 70%;
	height: 85%;
  }
 .chat {
 	background-image: url('img/friends3.gif');
  	background-size : cover;
  	width : 100%;
  	height: 75vh;
  }
.mscontent {
	text-align: left;
	overflow-y: auto;
	height: 98%;
	padding : 5px;
}
.user {
	overflow-y: auto;
	height: 25vh;
}
 #chatting {
 	width: 80%;
 	height: 5vh;
 	box-sizing: border-box;
 }
 #chattingBtn {
 	width: 15%;
 	height: 5vh;
 	box-sizing: border-box;
 }
 #themeBtn {
 	width: 5%;
 	height: 5vh;
 	box-sizing: border-box;
 }
 .write {
 	display: flex;
 	
 }
 .mscontent h5 {
 	position: relative;
 	background-color: #000000;
 	color: #ffffff;
 	border-radius: 8px;
 	padding: 10px;
 	max-width: 70%;
 	word-wrap: break-word;
 	margin-bottom: 1px;
 }
 .mscontent h5 small {
 	color: #ffff00;
 	margin-left: 5px;
 }
 h4 {
 	color: #ffffff;
 }
 .user{
 color: black;
 }
</style>
</head>
<body>
	<div id="container">
		<header>
				<%@ include file="header.jsp"%>
		</header>
		<div class="side" id="left">
			<%@ include file="leftside.jsp"%>
				<h2>참가자</h2>
			<div class="user">
				<p><i class="xi-user"></i> 전체채팅 <button onclick="url('./chatting')">채팅</button></p>
				<c:forEach var="user" items="${userlist }">
				<p><i class="xi-user"></i> ${user.mname } <button class="personalChatBtn" value="${user.mno }">채팅</button></p>
				</c:forEach>
			</div>
		</div>
		<div class="side" id="right">
			<%@ include file="rightside.jsp"%>
		</div>	
		<div id="main">
			<article>
				<div class="chat">
					<div class="mscontent" id="mscontent">
					<c:forEach var="chat" items="${chatlist }">
					<h4><i class="xi-user"></i> ${chat.mname }</h4>
					<h5>${chat.mscontent }<small>${chat.sendDate }</small></h5>
					<br>
					</c:forEach>
					</div>
				</div>
				<div class="write">
				<textarea name="chatting" id="chatting" placeholder="이곳에 입력하세요. Enter 눌러도 입력됩니다. 금지어[자바, 코딩, html, css]"></textarea>
				<button type="submit" id="chattingBtn">전송</button><button id="themeBtn"><i class="xi-palette"></i></button>
				</div>
			</article>
		</div>
		<footer>
		<%@ include file="footer.jsp"%>
	</footer>
		</div>
</body>
</html>