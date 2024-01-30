<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소모임</title>
<style type="text/css">
.image{
	position: relative;
	background-color: black;
	color: white;
	width: 500px;
	height: 300px;
	text-align: center;
}
.category{
	position: absolute;
	background-color: white;
	z-index: 1;
}

</style>
</head>
<body>
	<div class="container">
		<header>
			<h1>소모임 출력</h1>
		</header>
		<div class="main">
			<div class="mainStyle">
				<div>
					<c:forEach items="${list }" var="row">
						<div class="card">
							<div class="image">	사진</div>
							<div class="category">카테고리</div>
							<div class="writer">${row.mno }</div>
							<div class="views">100</div>
							<div class="title">${row.stitle }</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>

</body>
</html>