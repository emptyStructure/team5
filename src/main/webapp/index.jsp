<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<link href="./css/index.css" rel="stylesheet"/>
</head>
<body>	
<h1>메인 페이지</h1>
	<div class="container">
		<div class="sideOne">
		왼사이드<br>
		광고
		</div>
		<div class="sideTwo">
		오른사이드<br>
		로그인박스, 광고
		</div>
		<div class="menu">
			<nav>
				<ul>
					<li onclick="url('./')">홈</li>
					<li onclick="url('./')">게시판</li>
					<li onclick="url('./')">소모임</li>
					<li onclick="url('./')">마켓</li>
					<li onclick="url('./')">로그인</li>
				</ul>
			</nav>
		</div>
		<div class="main">		
			<div class="board">			
				게시판
				<table>
					<tr>
						<th>제목</th>
						<th>날짜</th>
					</tr>
					<c:forEach items="${boardList}" var="row">
					<tr>
						<td>${row.btitle }</td>
						<td>${row.bdate }</td>
					</tr></c:forEach>
				</table>
			</div>			
			<div class="somoim">
			소모임
				<table>
					<tr>
						<th>제목</th>
						<th>날짜</th>
					</tr>
					<c:forEach items="${somList}" var="row">
					<tr>
						<td>${row.stitle }</td>
						<td>${row.sdate }</td>
					</tr></c:forEach>
				</table>
			</div>
			<div class="market">
			중고
			</div>
		</div>
	
	</div>
	

</body>
</html>