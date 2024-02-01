<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
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
				<article>			
					<h3>마이 페이지</h3>
				</article>
				<div id="chngInfo">
					<h4>내 정보 수정</h4>
 					<form action="./myInfo" method="post">
						<div class="info">
 							<label> 이름 변경
								<input type="text" value="${myInfo.mname }">
 							</label><br>
						</div>
						<div class="info">
							<label> 비밀번호 변경
								<input type="text" value="${myInfo.mpw }">
							</label><br>
						</div>
					<button type="submit">저장</button>
					<input type="hidden" name="no" value="${myInfo.mno }">
					</form>
				</div>

				<div id="myHistory">
					<div class="history">
						<div id="myBoard">
							<h4>내가 쓴 글, 댓글</h4>
							<table>
								<tr>
									<th>제목</th>
									<th>날짜</th>
									<th>조회수</th>
								</tr>
								<c:forEach items="${myBoard }" var="row">
								<tr>
									<td>${row.btitle }</td>
									<td>${row.bdate }</td>
									<td>${row.bcount }</td>
								</tr>
								</c:forEach>
							</table>															
						</div>
						<div>참여중인 소모임</div>
						<div>내 거래내역</div>					
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