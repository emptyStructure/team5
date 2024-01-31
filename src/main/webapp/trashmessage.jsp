<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>채팅</title>
<script>function url(url) {window.location.href = url;}</script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link href="./css/receivedmessage.css" rel="stylesheet"/>
<script type="text/javascript">

</script>
<style>
.chat {
	width: 300px;
	height: 500px;
	background-color: gray;
	margin: 0 auto;
}
.chatContent {
	width: 300px;
	margin: 0 auto;
}
#chatting {
	width: 250px;
	height: 80px;
	background-color: white;
}
#chattingBtn {
	height: 85px;
	border-radius: 0;
}
</style>
</head>
<body>
	<div class="wrap">
		<div class="menu">
			<nav>
				<ul>
					<li onclick="url('./message')"><i class="xi-home"></i> 홈</li>
					<li onclick="url('./messagewrite')"><i class="xi-send"></i> 쪽지 쓰기</li>
					<li onclick="url('./receivedmessage')"><i class="xi-reply"></i> 받은 쪽지함</li>
					<li onclick="url('./sentmessage')"><i class="xi-share"></i> 보낸 쪽지함</li>
					<li onclick="url('./trashmessage')"><i class="xi-forum"></i> 채팅</li>
				</ul>
				<ul>
				<c:forEach var="user" items="${namelist }">
					<li onclick="url('./trashmessage?mname=${user.mno }')" value=${user.mno }><small><i class="xi-user"></i> ${user.mname } 님</small></li>
				</c:forEach>
				</ul>
				<button class="homeBtn" onclick="location.href='./trashmessage'"><i class="xi-home"></i> 채팅 홈</button>
			</nav>
		</div>
		<div class="main">
			<article>
				<h2>채팅기능 테스트</h2>
				<div class="chat">
				
				</div>
				<div class="chatContent">
				<input type="text" id="chatting" placeholder="이곳에 입력하세요."><button id="chattingBtn">전송</button>
				</div>
			</article>
		</div>
	</div>
</body>
</html>