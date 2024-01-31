<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지함</title>
<script>function url(url) {window.location.href = url;}</script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link href="./css/message.css" rel="stylesheet"/>
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
				<h2>받은 쪽지함</h2>
				<table>
					<thead>
						<tr>
							<td>보낸 이</td>
							<td>내용</td>
							<td>날짜</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>홍길동</td>
							<td>안녕하세요. 잘 되나요?</td>
							<td>2024-01-29</td>
						</tr>
					</tbody>
				</table>
				<h2>보낸 쪽지함</h2>
				<table>
					<thead>
						<tr>
							<td>받는 이</td>
							<td>내용</td>
							<td>날짜</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>포세이돈</td>
							<td>이건 내가 보낸 쪽지야</td>
							<td>2024-01-24</td>
						</tr>
					</tbody>
				</table>
			</article>
		</div>
	</div>
</body>
</html>