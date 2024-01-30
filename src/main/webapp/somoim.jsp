<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소모임</title>
<style type="text/css">
td{
	text-align: center;
	width: 100px;
}

</style>
</head>
<body>
	<div class="container">
		<header>
			<h1>소모임 출력</h1>
		</header>
		<div class="main">
			<div class="mainStyle">
				<table border="1">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>내용</th>
						<th>회원번호</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>삭제여부</th>
					</tr>
					<c:forEach items="${list }" var="row">
					<tr>
						<td>${row.sno }</td>
						<td>${row.stitle }</td>
						<td>${row.scontent }</td>
						<td>${row.mno }</td>
						<td>박시호</td>
						<td>${row.sdate }</td>
						<td>${row.sdel }</td>
					</tr>
					</c:forEach>
				</table>
			
			</div>
		</div>
	</div>

</body>
</html>