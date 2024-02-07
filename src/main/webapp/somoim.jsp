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
	
	$('.search').click(function(){
		let form = document.createElement('form');
		form.name = 'form';
		form.method = 'get';
		form.action = './somoim';
		/*붙이기*/
		let category = document.createElement('input');
		category.setAttribute("type","hidden");
		category.setAttribute("name","category");
		category.setAttribute("value", $('.cSelect').val());
		/*붙이기*/
		let select = document.createElement('input');
		select.setAttribute("type","hidden");
		select.setAttribute("name","select");
		select.setAttribute("value", $('.select').val());
		/*form에 붙이기*/
		form.appendChild(category);
		form.appendChild(select);
		/*전송*/
		document.body.appendChild(form);
		form.submit();
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
					<select class="cSelect">
						<option>--- 선택 ---</option>
						<option value="meal">식사</option>
						<option value="game">게임</option>
						<option value="study">공부</option>
						<option value="drinking">유흥</option>
					</select>
					<select class="select">
						<option value="all">전체보기</option>
						<option value="recruiting">마감되지 않은 글</option>
						<option value="complete">마감된 글</option>
					</select>
					<button type="button" class="search">검색</button>
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
					<c:set var="totalPage" value="${totalCount/12 }"/>
					
					<fmt:parseNumber integerOnly="true" value="${totalPage }" var="totalPage"/>
					<c:if test="${totalCount%12 gt 0 }">
						<c:set var="totalPage" value="${totalPage+1 }"/>
					</c:if>
					<c:set var="startPage" value="1"/>
					<c:set var="endPage" value="${totalPage }"/>
					
					<div class="leftArrow"><img alt="left" src="./img/leftArrow.png" class="leftImg" 
					<c:if test="${page gt startPage }">onclick="url('./somoim?page=${page-1 }&category=${category }&select=${select }')"</c:if>></div>
					<div class="rightArrow"><img alt="right" src="./img/rightArrow.png" class="rightImg"
					<c:if test="${page lt endPage }">onclick="url('./somoim?page=${page+1 }&category=${category }&select=${select }')"</c:if>></div>
				</div>
			</div>
		</div>
		</div>		

</body>
</html>