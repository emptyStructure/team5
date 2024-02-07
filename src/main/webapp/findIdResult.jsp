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
			<h2>&ensp;</h2>
			<h2>아이디 찾기 결과</h2><br>
			<div id="contents">	
				<table>
					<thead>
						<tr>
							<td>아이디</td>
							<td>생성시간</td>
						</tr>
					</thead>
				<c:forEach items="${nameFinderList }" var="row">
					<tbody>
						<tr>
							<td>${row.mid }</td>
							<td>${row.mdate }</td>
						</tr>
					</tbody>	
				</c:forEach>
				<c:forEach items="${emailFinderList }" var="row">
					<tbody>
						<tr>
							<td>${row.mid }</td>
							<td>${row.mdate }</td>
						</tr>
					</tbody>	
				</c:forEach>
				</table>
			</div>	
		</div>
	</div>
	<footer>
		<%@ include file="footer.jsp"%>
	</footer>
</body>
</html>