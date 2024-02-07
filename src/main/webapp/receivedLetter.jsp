<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지함</title>
<script>function url(url) {window.location.href = url;}</script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="./css/letter.css" rel="stylesheet"/>
<script type="text/javascript">
$(function(){
	$('.msgWrite').click(function(){
		let sno = $(this).children().children(".sno").val();
		var url = "./letterWrite";
        var name = "msgWrite";
        var option = "width = 600, height = 700, top = 100, left = 200, location = no";
		window.open(url, name, option);
	});
	
});
</script>
</head>
<body>
	<div class="wrap">
		<div class="menu">
			<nav>
				<ul>
					<li onclick="url('./letter')"><i class="xi-home"></i> 홈</li>
					<li class="msgWrite"><i class="xi-send"></i> 쪽지 쓰기</li>
					<li onclick="url('./receivedLetter')"><i class="xi-reply"></i> 받은 쪽지함</li>
					<li onclick="url('./sentLetter')"><i class="xi-share"></i> 보낸 쪽지함</li>
					<li onclick="url('./chatting')"><i class="xi-forum"></i> 채팅</li>
				</ul>
			</nav>
		</div>
		<div class="main">
			<article>
				<h2>받은 쪽지함</h2>
				<table border="1">
					<thead>
						<tr>
							<td class="date">날짜</td>
							<td class="person">보낸 이</td>
							<td class="title">제목</td>
							<td class="content">내용</td>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="row" items="${list }">
						<tr class="row${row.lno }">
							<td>${row.date }</td>
							<td>${row.writer }</td>
							<td class="rowTitle">${row.ltitle }</td>
							<td>${row.msg }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</article>
		</div>
	</div>
</body>
</html>