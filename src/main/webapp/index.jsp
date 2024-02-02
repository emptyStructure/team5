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
			<%@ include file="leftside.jsp"%>
		</div>
		<div class="side" id="right">
			<%@ include file="rightside.jsp"%>
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
							<td class="title"><a href="./detail?no=${row.bno}">${row.btitle }</a></td>
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
							<td class="title"><a href="./jdetail?no=${row.jno}">${row.get("title") }</a></td>
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