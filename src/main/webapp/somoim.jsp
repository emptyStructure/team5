<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>소모임</title>
<link href="./css/somoim.css" rel="stylesheet"/>
<link href="./css/menu.css" rel="stylesheet"/>
<link href="./css/index.css" rel="stylesheet"/>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$('.image').click(function(){
		let sno = $(this).children().children(".sno").val();
		var url = "./soDetail?sno="+sno;
        var name = "popup test";
        var option = "width = 600, height = 700, top = 100, left = 200, location = no"
		window.open(url, name, option);
	});
});
</script>
</head>
<body>
	<div class="conteiner">
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
			<h1>소모임 출력</h1>
			<div class="main">
				<div class="mainStyle">
				<div>
					<button onclick="location.href='./somoimWrite'">글 작성</button>
				</div>
					<c:forEach items="${list }" var="row">
						<div class="card">
							<div class="image">	
								<div class="category">${row.scategory }</div>
								<div class="views">👪${row.total } ❤️100</div>
								<div class="info">
									<div class="title">${row.stitle }</div>
									<div class="writer">${row.swriter }</div>
									<div class="date">${row.sdate }</div>
									<input type="hidden" class="sno" value="${row.sno }">
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		</div>		

</body>
</html>