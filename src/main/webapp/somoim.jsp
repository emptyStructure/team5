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
<script type="text/javascript" src="./js/menu.js"></script>
<script type="text/javascript">
$(function(){
	
	$('.simage').click(function(){
		let sno = $(this).children().children(".sno").val();
		var url = "./soDetail?sno="+sno;
        var name = "popup test";
        var option = "width = 600, height = 700, top = 100, left = 200, location = no";
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
			<%@ include file="leftside.jsp"%>
		</div>
		<div class="side" id="right">
			<%@ include file="rightside.jsp"%>
		</div>			
		<div id="content">
			<h1>소모임 출력</h1>
			<div class="main">
				<div>
					<c:if test="${sessionScope.mname ne null }">
						<button onclick="location.href='./somoimWrite'">글 작성</button>
					</c:if>
				</div>
				<div class="mainStyle">
					<c:forEach items="${list }" var="row">
						<div class="scard">
							<div class="simage">
								<c:if test="${row.scategory eq  '공부'}">
									<img alt="사진" src="./img/study.jpg" class="backimage">	
								</c:if>
								<c:if test="${row.scategory eq  '유흥'}">
									<img alt="사진" src="./img/beer.jpg" class="backimage">	
								</c:if>
								<c:if test="${row.scategory eq  '게임'}">
									<img alt="사진" src="./img/game.jpeg" class="backimage">	
								</c:if>
								<c:if test="${row.scategory eq  '식사'}">
									<img alt="사진" src="./img/chicken.jpg" class="backimage">	
								</c:if>
								<div class="scategory">${row.scategory }</div>
								<div class="sviews">👪 ${row.total }/${row.personnel } ❤️ 100</div>
								<div class="sinfo">
									<div class="stitle">${row.stitle }</div>
									<div class="swriter">${row.swriter }</div>
									<div class="sdate">${row.sdate }</div>
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