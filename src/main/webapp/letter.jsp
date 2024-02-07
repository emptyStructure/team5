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
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.7.1.min.js"></script>
<link href="./css/letter.css" rel="stylesheet"/>
<script type="text/javascript">
$(function(){
	$('.row').click(function(){
		let lno = $(this).children(".d").children(".lno").val();
		var url = "./letterDetail?lno="+lno;
        var name = "letterDetail";
        var option = "width = 600, height = 500, top = 100, left = 200, location = no"
		window.open(url, name, option);
	});
	
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
					<li onclick="url('./letter')"><i class="xi-mail"></i> 쪽지 전체보기</li>
					<li onclick="url('./receivedLetter')"><i class="xi-reply"></i> 받은 쪽지함</li>
					<li onclick="url('./sentLetter')"><i class="xi-share"></i> 보낸 쪽지함</li>
					<li class="msgWrite"><i class="xi-send"></i> 쪽지 쓰기</li>
					<li onclick="url('./chatting')"><i class="xi-forum"></i> 채팅</li>
				</ul>
			</nav>
		</div>
		<div class="main">
			<article>
				<h2>쪽지함</h2>
				<table border="1">
					<thead>
						<tr>
							<td class="date">날짜</td>
							<td class="person">보낸 이</td>
							<td class="person">받는 이</td>
							<td class="title">제목</td>
							<td class="content">내용</td>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="row" items="${list }">
						<tr class="row">
							<td class="d">${row.date }
							<input type="hidden" class="lno" value="${row.lno }"></td>
							<td>${row.writer }</td>
							<td>${row.receiver }</td>
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