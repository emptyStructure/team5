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
	height: 50px;
	margin: 10px 20px; 
	background-color: #F9F7C9;
	overflow: hidden;
	border: 1px solid black;
	display: flex;
	justify-content: center;
}
.title, .category{
	width: 40%;
	float: left;
	line-height: 50px;
	margin: 0 auto;
}
.title{
	text-align: left;
}
.category{
	text-align: right;
}
.body{
	width: calc(100% - 80px);
	height: 200px;
	margin: 10px 20px; 
	padding: 10px 20px;
	background-color: #F9F7C9;
	overflow: hidden;
	border: 1px solid black;
}
.writer, .view{
	width: 50%;
	float: left;
	line-height: 20px;
	font-size: smaller;
}
.writer{
	text-align: left;
}
.view{
	text-align: right;
}
.content{
	clear: both;
	width: 100%;
	height: auto;
	margin-top: 10px;
}
.info{
	overflow: hidden;
	border-bottom: 1px solid black;
}
.form{
	width: calc(100% - 80px);
	height: 300px;
	margin: 10px 20px; 
	padding: 10px 20px;
	background-color: #F9F7C9;
	overflow: hidden;
	border: 1px solid black;
}
.form textarea{
	width: 100%;
	height: 150px;
	margin: 0;
	padding: 0;
	resize : none;
	box-sizing: border-box;
}
.msg{
	margin: 10px 0;
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
				<div class="info">
					<div class="writer">${detail.mno }</div>
					<div class="view">view</div>
				</div>
				<div class="conStyle">
					<div class="content">${detail.scontent }</div>
				</div>
			</div>
			<div class="form">
				<div> 
				이름 <input type="text" placeholder="이름을 입력하세요.">
				연락처 <input type="text" placeholder="전화번호를 입력하세요.">
					<div class="msg">
					메세지 <br>
					<textarea placeholder="Host에게 전할 말을 적어주세요." id="message"></textarea>
					</div>
				</div>
			</div>
		</div>
	</article>
</body>
</html>