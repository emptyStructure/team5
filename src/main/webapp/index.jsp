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
<script type="text/javascript" src="./js/menu.js"></script>
</head>
<body>	
	<header>
		<div class="menu">
			<%@ include file="menu.jsp"%>
		</div>
	</header>	
	<div class="container">
		<div class="middle">				
			<div class="sideOne">
				왼사이드<br>
				광고1
			</div>
			<div class="sideTwo"><c:choose><c:when test="${sessionScope.mname eq null}">
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
				<div>
					광고2
				</div>
			</div>
			<div class="main">
				<div class="content">
					<div class="board">	
						<div class="new">
						새로 올라온 게시판 글
						</div>
						<div class="newcon">
							<table>
								<c:forEach items="${boardList}" var="row">
								<tr>
									<td class="title">${row.btitle }</td>
									<td class="date">${row.bdate }</td>
								</tr></c:forEach>
							</table>
						</div>	
					</div>			
					<div class="somoim">
						<div class="new">
							새로 생겨난 소모임						
						</div>
						<div class="newcon">
							<table>
								<c:forEach items="${somList}" var="row">
								<tr>
									<td class="title"><a href="./soDetail?sno=${row.sno}">${row.stitle }</a></td>
									<td class="date">${row.sdate }</td>
								</tr></c:forEach>
							</table>
						</div>
					</div>
					<div class="market">
						<div class="new">
						갓 올라온 중고상품
						</div>
						<div class="newcon">
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
		</div>
	</div>
	<footer>
		푸터푸터푸터
	</footer>
</body>
</html>