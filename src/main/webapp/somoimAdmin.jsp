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
<link href="./css/somoimAdmin.css" rel="stylesheet"/>
<script type="text/javascript">
$(function(){
	$('.title').click(function(){
		let sno = $(this).prev().text();
		var url = "./joinerList?sno="+sno;
        var name = "joinerList";
        var option = "width = 1050, height = 700, top = 100, left = 200, location = no"
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
					<li onclick="location.href='./somoimAdmin'"><i class="xi-calendar-check"></i> 신청자 관리</li>
					<li onclick="location.href='./somoimApplications'"><i class="xi-list"></i> 내 신청 목록</li>
					<li class="msgWrite"><i class="xi-send"></i> 쪽지 쓰기</li>
				</ul>
			</nav>
		</div>
		<div class="main">
			<article>
				<h2>신청자 관리</h2>
				<table>
					<thead>
						<tr>
							<th>글 번호</th>
							<th>제목</th>
							<th>카테고리</th>
							<th>작성일</th>
							<th>현재 인원</th>
							<th>대기 인원</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="row">
							<tr>
								<td>${row.sno }</td>
								<td class="title">${row.stitle }</td>
								<td>${row.scategory }</td>
								<td>${row.sdate }</td>
								<td>${row.total }명</td>
								<td>${row.waiting }명</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</article>
		</div>
	</div>
</body>
</html>