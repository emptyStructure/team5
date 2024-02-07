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