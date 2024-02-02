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
<link href="./css/menu.css" rel="stylesheet"/>
<link href="./css/myInfo.css" rel="stylesheet"/>
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
			<%@ include file="leftside.jsp"%>
		</div>
		<div class="side" id="right">
			<%@ include file="rightside.jsp"%>
		</div>					
		<div id="content">
			<h3>마이 페이지</h3>
			<div id="infoContents">
				<div id="chngInfo">
					<h4>내 정보 수정</h4>
 					<form action="./myInfo" method="post">
 							<label> 이름 <br>
								<input type="text" value="${myInfo.mname }">
 							</label><br>
							<label> 비밀번호 <br>
								<input type="text" value="${myInfo.mpw }">
							</label><br>
					<button type="submit">저장</button>
					<input type="hidden" name="no" value="${myInfo.mno }">
					</form>
				</div>
				<div id="myMarket">
					<h4>내 거래내역</h4>
				</div>					
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
				<div id="mySomoim">
					<h4>참여중인 소모임</h4>
				</div>			
			</div>
		</div>
	<footer>
		푸터푸터푸터  foot은 발바닥
	</footer>
</div>
</body>
</html>