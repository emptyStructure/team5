<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
	integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link href="./css/messagewrite.css" rel="stylesheet" />
<script>
	function url(url) {
		window.location.href = url;
	}
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 쓰기</title>
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
			</nav>
		</div>
		<div class="main">
			<article>
				<h2>쪽지 쓰기</h2>
				<select name="grade">
					<option value="" disabled selected style="display: none;">수신자를
						선택하세요</option>
					<c:forEach var="row" items="${list }">
						<option value="${row.mno }">${row.mname}</option>
					</c:forEach>
				</select>
				<div class="writeFORM">
					<form action="./send-message" method="post">
						<!-- 알맞은 서블릿 주소를 사용하세요 -->
						<textarea id="messageContent" name="messageContent" rows="4"></textarea>

						<button type="submit">쪽지 발송</button>
					</form>
				</div>
			</article>
		</div>
	</div>

</body>
</html>