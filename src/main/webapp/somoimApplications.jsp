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
<link href="./css/somoimApplications.css" rel="stylesheet"/>
<script type="text/javascript" src="./js/menu.js"></script>
<script type="text/javascript">
$(function(){
	$('.title').click(function(){
		let sno = $(this).prev().children(".sno").val();
		var url = "./soDetail?sno="+sno;
        var name = "detail from admin";
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
					<li onclick="location.href='./somoimAdmin'"><i class="xi-home"></i> 신청자 관리</li>
					<li onclick="location.href='./somoimApplications'"><i class="xi-home"></i> 내 신청 목록</li>
				</ul>
			</nav>
		</div>
		<div class="main">
			<article>
				<h2>내 신청 목록</h2>
				<div class="sList">
					<ul>
						<li onclick="url('./somoimApplications')">전체보기</li>
						<li onclick="url('./somoimApplications?status=1')">승인</li>
						<li onclick="url('./somoimApplications?status=2')">대기</li>
						<li onclick="url('./somoimApplications?status=0')">거절</li>
					</ul>
				</div>
				<table border="1">
					<thead>
						<tr>
							<th class="tno">No.</th>
							<th class="ttitle">제목</th>
							<th class="tname">이름</th>
							<th class="tph">연락처</th>
							<th class="tmsg">메세지</th>
							<th class="tdate">신청일</th>
							<th class="tstatus">상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="row">
							<tr>
								<td>${row.no }
								<input value="${row.jno }" type="hidden" class="sno"></td>
								<td class="title">${row.title }</td>
								<td>${row.name }</td>
								<td>${row.ph }</td>
								<td>${row.message }</td>
								<td>${row.joindate }</td>
								<td>
									<c:choose>
										<c:when test = "${row.status eq 0}">
										❌ 거절
										</c:when>
										<c:when test = "${row.status eq 1}">
										🟢 승인
										</c:when>
										<c:otherwise>
										🧾 대기중
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</article>
		</div>
	</div>
</body>
</html>