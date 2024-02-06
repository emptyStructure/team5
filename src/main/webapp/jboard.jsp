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
<style>
    table {
        width: 100%;
        border-collapse: collapse;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    }
    th, td {
        padding: 10px;
        text-align: left;
    }
    th {
        background-color: #f2f2f2;
        color: #333;
        font-weight: bold;
    }
    tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    tr:hover {
        background-color: #e9e9e9;
    }
    .paging {
        margin-top: 20px;
        text-align: center;
    }
    .paging button {
        background-color: #4CAF50;
        color: white;
        padding: 10px 20px;
        border: none;
        cursor: pointer;
        border-radius: 5px;
        margin: 0 5px;
    }
    .paging button:hover {
        background-color: #45a049;
    }
    .currentBtn {
        background-color: #45a049;
    }
    .paging button[disabled] {
        background-color: #cccccc;
        cursor: not-allowed;
    }
    button.writeButton {
        background-color: #008CBA;
        border: none;
        color: white;
        padding: 10px 20px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin-top: 20px;
        cursor: pointer;
        border-radius: 5px;
    }
    button.writeButton:hover {
        background-color: #005f7b;
    }
</style>
</head>
<body>

<table>
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>글쓴이</th>
        <th>날짜</th>
        <th>읽음</th>
        <th>판매</th>
    </tr>
    <c:forEach items="${list}" var="row">
        <tr>
            <td>${row.jno}</td>
            <td><a href="./jdetail?page=${page}&no=${row.jno}">${row.jtitle}</a></td>
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

<button class="writeButton" onclick="window.location.href='./jwrite'">글쓰기</button>

</body>
</html>
