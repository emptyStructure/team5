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
<link href="./css/somoim.css" rel="stylesheet"/>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$('.image').click(function(){
		let sno = $(this).children().children(".sno").val();
		var url = "./soDetail?sno="+sno;
        var name = "popup test";
        var option = "width = 600, height = 700, top = 100, left = 200, location = no"
		window.open(url, name, option);
		
	});
});
</script>
</head>
<body>
	<div class="container">
		<header>
			<h1>소모임 출력</h1>
		</header>
		<div class="main">
			<div class="mainStyle">
				<c:forEach items="${list }" var="row">
					<div class="card">
						<div class="image">	
							<div class="category">${row.scategory }</div>
							<div class="info">
								<div class="title">${row.stitle }</div>
								<div class="views">❤️ 100</div>
								<div class="writer">박시호</div>
								<input type="hidden" class="sno" value="${row.sno }">
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

</body>
</html>