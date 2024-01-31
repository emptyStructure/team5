<%@page import="com.team5.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.team5.dao.BoardDAO"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>

</head>
<body>
	<div class="container">
	<header>
			<%@ include file="menu.jsp"%>
		</header>
		<div class="main">
			<div class="mainStyle">
				<article>
					<%-- <c:choose>
						<c:when test="${fn:length(list) gt 0 }"> --%>
							<table>
							    <thead>
								    <tr>
									    <th>번호</th>
									    <th>제목</th>
									    <th>글쓴이</th>
									    <th>날짜</th>
									    <th>읽음</th>
								    </tr>
								</thead>
								<tbody>
								    <c:forEach items="${list }" var="row">
									    <tr>
										    <td class="w1">${row.bno }</td>
										    <td class="w1">${row.btitle}</td> 
										    <td class="w2">${row.bwrite }</td>
										    <td class="w1">${row.bdate }</td>
										    <td class="w1">${row.bcount }</td>
									    </tr>
									</c:forEach>
							    </tbody>
							</table>	
							<c:if test="${sessionScope.mname ne null }">
							    <button onclick="url('./write')">글쓰기</button>
							</c:if>				
				</article>
			</div>
		</div>
	</div>
</body>
</html>