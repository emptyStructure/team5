<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소모임 디테일</title>
<style type="text/css">
.soheader{
	width: calc(100% - 40px);
	height: auto;
	margin: 0px 20px; 
	background-color: green;
}
.title{
	width: 50%;
	height: 50px;
	float: left;
}
.category{
	width: 50%;
	height: 50px;
	float: left;
}

</style>
</head>
<body>
	<article>
		<div class="detail">
			<div class="soheader">
				<div class="title">
					${detail.stitle }
				</div>
				<div class="category">
					카테고리
				</div>
			</div>
			<div class="body">
				<div>${detail.mno }</div>
				<div>view</div>
				<hr>
				<div>${detail.scontent }</div>
			</div>
		</div>
	</article>
</body>
</html>