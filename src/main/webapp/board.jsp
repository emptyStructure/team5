<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link href="./css/index.css" rel="stylesheet" />
<link href="./css/header.css" rel="stylesheet" />
<link href="./css/board.css" rel="stylesheet" />
<script type="text/javascript" src="./js/header.js"></script>
</head>
<body>
	<div id="container">
		<header>
			<%@ include file="header.jsp"%>
		</header>
		<div class="side" id="left">
			<%@ include file="leftside.jsp"%>
		</div>
		<div class="side" id="right">
			<%@ include file="rightside.jsp"%>
		</div>	
		<div class="main">
			<div class="mainStyle">
				<article>
					<c:choose>
						<c:when test="${fn:length(list) gt 0 }">
							<table>
							<thead>
							</thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>글쓴이</th>
									<th>날짜</th>
									<th>읽음</th>
								</tr>
								<c:forEach items="${list }" var="row">
									<tr>
										<td class="w1">${row.bno }</td>
										<td class="btitle"><a href="./detail?page=${page }&bno=${row.bno }">${row.btitle }
										</a></td>
										<td class="w2">${row.bwrite }</td>
										<td class="w1">${row.bdate }</td>
										<td class="w1">${row.bcount }</td>
									</tr>
								</c:forEach>
							</table>
							<c:set var="totalPage" value="${totalCount / 10 }"/>
							<fmt:parseNumber integerOnly="true" value="${totalPage }" var="totalPage"/>
							<c:if test="${totalCount % 10 gt 0 }">
								<c:set var="totalPage" value="${totalPage + 1 }"/>
							</c:if>
							<c:set var="startPage" value="1"/>
							<c:if test="${page gt 5 }">
							    <c:set var="startPage" value="${page - 5 }"/>
							</c:if>
							<c:set var="endPage" value="${startPage + 9 }"/>
							<c:if test="${endPage gt totalPage }">
							 	<c:set var="endPage" value="${totalPage }"/>
							</c:if>
							
							<div class="paging">
								<button onclick="paging(1)">⏮️</button>
								<button <c:if test="${page - 10 lt 1 }">disabled="disabled"</c:if> onclick="paging(${page - 10 })">◀️</button>
								<c:forEach begin="${startPage }" end="${endPage }" var="p">
									<button <c:if test="${page eq p }">class="currentBtn"</c:if> onclick="paging(${p })">${p }</button>
								</c:forEach>
								<button <c:if test="${page + 10 gt totalPage }">disabled="disabled"</c:if> onclick="paging(${page + 10 })">▶️</button>
								<button onclick="paging(${totalPage })">⏭️</button>
								
							</div>
							
			</c:when>
			<c:otherwise>
				<h1>출력할 값이 없습니다.</h1>
			</c:otherwise>
			</c:choose>

			<c:if test="${sessionScope.mname ne null}">
				<button onclick="url('./write')">글쓰기</button>
			</c:if>

			</article>


		</div>
	</div>
	<footer>
		<c:import url="footer.jsp"/>
	</footer>
	</div>
	<script type="text/javascript">
		function paging(bno) {
			location.href = "./board?page=" + bno;
		}
	</script>
</body>
</html>