<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>당신의 아이디는</h2>
	<table>
		<tr>
			<th>아이디</th>
			<th>생성시간</th>
		</tr>
	<c:forEach items="${nameFinderList }" var="row">
		<tr>
			<td>${row.mid }</td>
			<td>${row.mdate }</td>
		</tr>	
	</c:forEach>
	</table>
</body>
</html>