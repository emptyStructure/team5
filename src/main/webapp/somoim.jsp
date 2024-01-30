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
.card{
	width: calc(50% - 10px);
	float: left;
	margin: 5px 5px;
}
.image{
	position: relative;
	background-color: black;
	color: white;
	width: 100%;
	height: 200px;
}
.image:hover{
	background-color: rgba(0, 0, 0, 0.8);
}
.info{
	position: absolute;
	width: 100%;
	height: 100%;
}
.category{
	top: 0%;
	background-color: rgba(255, 255, 255, 0.8);
	padding: 10px;
	z-index: 1;
	margin: 10px;
	border-radius: 10%;
	height: 10%;
	width: 12%;
	text-align: center;
}
.title{
	width: 50%;
	text-align: left;
	box-sizing: border-box;
	float: left;
	top: 50%;
}
.views{
	width: 50%;
	box-sizing: border-box;
	text-align: right;
	float: left;
		top: 50%;
}
.writer{
	text-align: left;
	top: 50%;
}
</style>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$('.image').click(function(){
		let sno = $(this).children().children(".sno").val();
		location.href="./soDetail?sno="+sno;
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
				<div>
					<c:forEach items="${list }" var="row">
						<div class="card">
							<div class="image">	
								<div class="info">
									<div class="category">${row.scategory }</div>
									<div class="title">${row.stitle }</div>
									<div class="views">100</div>
									<div class="writer">${row.mno }</div>
									<input type="hidden" class="sno" value="${row.sno }">
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>

</body>
</html>