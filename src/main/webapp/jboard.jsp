<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고거래</title>
</head>
<body>

	<table>
    <tr>
        <td>번호</td>
        <td>제목</td>
        <td>글쓴이</td>
        <td>날짜</td>
        <td>읽음</td>
        <td>판매</td>
    </tr>
    <c:forEach items="${list}" var="row">
        <tr>
            <td>${row.jno}</td>
            <td>${row.jtitle}</td>
            <td>${row.jwrite}</td>
            <td>${row.jdate}</td>
            <td>${row.jcount}</td>
            <td>${row.jsell}</td>
        </tr>
    </c:forEach>
</table>
	
	<c:set var="totalPage" value="${totalCount / 10 }" />
	<fmt:parseNumber integerOnly="true" value="${totalPage }"
		var="totalPage" />
	<c:if test="${totalCount % 10 gt 0 }">
		<c:set var="totalPage" value="${totalPage + 1 }" />
	</c:if>
	<c:set var="startPage" value="1" />
	<c:if test="${page gt 5 }">
		<c:set var="startPage" value="${page - 5 }" />
	</c:if>
	<c:set var="endPage" value="${startPage + 9 }" />
	<c:if test="${endPage gt totalPage }">
		<c:set var="endPage" value="${totalPage }" />
	</c:if>

	<div class="paging">
		<button onclick="paging(1)">⏮️</button>
		<button <c:if test="${page - 10 lt 1 }">disabled="disabled"</c:if>
			onclick="paging(${page - 10 })">◀️</button>
		<c:forEach begin="${startPage }" end="${endPage }" var="p">
			<button <c:if test="${page eq p }">class="currentBtn"</c:if>
				onclick="paging(${p })">${p }</button>
		</c:forEach>
		<button
			<c:if test="${page + 10 gt totalPage }">disabled="disabled"</c:if>
			onclick="paging(${page + 10 })">▶️</button>
		<button onclick="paging(${totalPage })">⏭️</button>

	</div>




</body>
</html>