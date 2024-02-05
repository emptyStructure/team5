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
<link href="./css/message.css" rel="stylesheet"/>
<script type="text/javascript">
$(function(){
	$('.title').click(function(){
		let sno = $(this).prev().text();
		var url = "./joinerList?sno="+sno;
        var name = "popup test";
        var option = "width = 1000, height = 700, top = 100, left = 200, location = no"
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
					<li onclick="url('')"><i class="xi-home"></i> 신청자 관리</li>
					<li onclick="url('')"><i class="xi-home"></i> 내 신청 목록</li>
				</ul>
			</nav>
		</div>
		<div class="main">
			<article>
				<h2>신청자 관리</h2>
				<table>
					<thead>
						<tr>
							<td>sno</td>
							<td>제목</td>
							<td>카테고리</td>
							<td>사람번호</td>
							<td>날짜</td>
							<td>상태</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="row">
							<tr>
								<td>${row.sno }</td>
								<td class="title">${row.stitle }</td>
								<td>${row.scategory }</td>
								<td>${row.mno }</td>
								<td>${row.sdate }</td>
								<td>${row.sdel }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</article>
		</div>
	</div>
</body>
</html>