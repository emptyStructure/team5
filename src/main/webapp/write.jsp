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
<title>글쓰기</title>

</head>
<body>
	<div class="container1">
		<div class="main">
			<div class="mainStyle">
				<article>
					<h1>글쓰기</h1>
					<div class="writeFORM">
						<form action="./write" method="post">
							<input type="text" id="title" name="title">
							<textarea id="summernote" name="content"></textarea>
							<button type="submit">저장하기</button>
						</form>
					</div>
				</article>
			</div>
		</div>
	</div>
</body>
</html>