<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<link href="./css/index.css" rel="stylesheet"/>
<link href="./css/menu.css" rel="stylesheet"/>
<script type="text/javascript" src="./js/menu.js"></script>
</head>
<body>	
	<div id="container">
		<header>
			<div id="menu">
				<%@ include file="menu.jsp"%>
			</div>
		</header>					
		<div class="side" id="left">
			<div class="add" id="add1">
			광고1
			</div>
		</div>
		<div class="side" id="right"><c:choose><c:when test="${sessionScope.mname eq null}">
			<div class="loginBox">
				<form action="./login" method="post">
					<input type="text" name="id">			
					<input type="password" name="pw">
					<button type="button"><a href="./join">회원가입</a></button>		
					<button type="submit">로그인</button>		
				</form>
			</div></c:when><c:otherwise>
			<div class="doneLogin">
				<form action="./logout">
					${sessionScope.mname}님<br>
					<button type="button"><a href="./myInfo">마이페이지</a></button>
					<button type="submit">로그아웃</button>
				</form>					
			</div></c:otherwise></c:choose>
			<div class="add" id="add2">
				<img alt="광고2" src="./img/adv.gif" width="100%">
			</div>
		</div>
		<div id="content">
			<div id="contents">
			<div id="newBoard">	
				<div class="newTitle">
				새로 올라온 게시판 글
				</div>
				<div class="newContents">
					<table>
						<c:forEach items="${boardList}" var="row">
						<tr>
							<td class="title">${row.btitle }</td>
							<td class="date">${row.bdate }</td>
						</tr></c:forEach>
					</table>
				</div>	
			</div>			
			<div id="newSomoim">
				<div class="newTitle">
					새로 생겨난 소모임						
				</div>
				<div class="newContents">
					<table>
						<c:forEach items="${somList}" var="row">
						<tr>
							<td class="title"><a href="./soDetail?sno=${row.sno}">${row.stitle }</a></td>
							<td class="date">${row.sdate }</td>
						</tr></c:forEach>
					</table>
				</div>
			</div>
			<div id="newMarket">
				<div class="newTitle">
				갓 올라온 중고상품
				</div>
				<div class="newContents">
					<table>
						<c:forEach items="${marketList}" var="row">
						<tr>
							<td class="title">${row.get("title") }</td>
							<td class="date">${row.get("date") }</td>
						</tr></c:forEach>
					</table>			
				</div>
			</div>
			</div>
		</div>
	<footer>
		푸터푸터푸터  foot은 발바닥
	</footer>
</div>
</body>
</html>