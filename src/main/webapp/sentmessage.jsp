<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지함</title>
<script>function url(url) {window.location.href = url;}</script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link href="./css/receivedmessage.css" rel="stylesheet"/>
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
				<h2>보낸 쪽지함</h2>
				<table>
					<thead>
						<tr>
							<td class="m1">받은 이</td>
							<td class="m3">내용</td>
							<td class="m2">날짜</td>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="row" items="${list }">
						<tr class="row${row.msdel }">
							<td class="m1">${row.mname }</td>
							<td class="m3">${row.mscontent }</td>
							<td class="m2">${row.sendDate }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</article>
		</div>
	</div>
</body>
</html>