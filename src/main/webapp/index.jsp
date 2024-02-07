<%@page import="java.util.Date"%>
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
<link href="./css/header.css" rel="stylesheet"/>
<script type="text/javascript" src="./js/header.js"></script>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(function(){
	
	//제목이 12자 이상인 경우 ... 처리
	$('.title').each(function(){
		var thistitle = $(this);
		var titleC = thistitle.text();
		var titleE = thistitle.html();
		var start = titleE.indexOf(">");
		var end = titleE.indexOf("<", 2);
 		if(titleC.length > 13) {
			var shortTitle = titleE.substr(0, start + 1) + titleC.substr(0, 12) + "..." + titleE.substr(end);
			thistitle.html(shortTitle);
		}
	})
	
});

</script>
<style type="text/css">
#content{
	display: flex;
/* 	align-items: center; */
}
</style>
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
		<div id="content">
			<div id="contents">
			<c:set var="now" value="<%=new Date() %>"/>
			<fmt:formatDate var="today" value="${now }" pattern="yyyy-MM-dd"/>
			<div id="newBoard">	
				<div class="newTitle">
				새로 올라온 게시판 글
				</div>
				<div class="newContents">
					<table>
					<c:forEach items="${boardList}" var="row">
						<tr>
							<td class="title"><a href="./detail?bno=${row.bno}">${row.btitle }</a></td>
							<td class="date">
							<fmt:parseDate value="${row.bdate }" var="bdate" pattern="yyyy. MM. dd. hh:mm"/>
							<fmt:formatDate value="${bdate}" var="dateOne" pattern="yyyy-MM-dd"/>
							<c:choose>
							<c:when test="${dateOne eq today}">
							<fmt:formatDate value="${bdate}" var="bodate" pattern="hh:mm"/>&#127381;${bodate }			
							</c:when>
							<c:otherwise>
							<fmt:formatDate value="${bdate}" var="bodate" pattern="MM/dd"/>${bodate }
							</c:otherwise>
							</c:choose>																					
							</td>
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
							<td class="date">
							<fmt:parseDate value="${row.sdate }" var="sdate" pattern="yyyy. MM. dd. hh:mm"/>
							<fmt:formatDate value="${sdate}" var="dateTwo" pattern="yyyy-MM-dd"/>
							<c:choose>
							<c:when test="${dateTwo eq today}">
							<fmt:formatDate value="${sdate}" var="sodate" pattern="hh:mm"/>&#127381;${sodate }			
							</c:when>
							<c:otherwise>
							<fmt:formatDate value="${sdate}" var="sodate" pattern="MM/dd"/>${sodate }
							</c:otherwise>
							</c:choose>																				
							</td>
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
							<td class="title"><a href="./jdetail?no=${row.jno}">${row.jtitle }</a></td>
							<td class="date">
							<fmt:parseDate value="${row.jdate }" var="jdate" pattern="yyyy. MM. dd. hh:mm"/>
							<fmt:formatDate value="${jdate}" var="dateThr" pattern="yyyy-MM-dd"/>
							<c:choose>
							<c:when test="${dateThr eq today}">
							<fmt:formatDate value="${jdate}" var="mkdate" pattern="hh:mm"/>&#127381;${mkdate }
							</c:when>
							<c:otherwise>
							<fmt:formatDate value="${jdate}" var="mkdate" pattern="MM/dd"/>${mkdate }
							</c:otherwise>
							</c:choose>							
							</td>
						</tr></c:forEach>
					</table>			
				</div>
			</div>
			</div>
		</div>
	<footer>
		<%@ include file="footer.jsp"%>
	</footer>
</div>
</body>
</html>