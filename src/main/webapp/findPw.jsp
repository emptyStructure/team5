<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<link href="./css/index.css" rel="stylesheet"/>
<link href="./css/header.css" rel="stylesheet"/>
<script type="text/javascript" src="./js/menu.js"></script>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.7.1.min.js"></script>
<style type="text/css">
* {
	cursor: url("./img/porori.png") 12 12, auto;
}
</style>
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
			<h2>비밀번호 찾기</h2><br>
			<div id="infoContents">
				<form action="./findPw" method="post">
					<div class="idfinder">
						<label class="id">아이디</label>
	    				<input type="text" id="idfinder" name="idfinder" placeholder="아이디를 입력해주세요" required>
    				</div>
    				<div class="emailfinder">
    					<label class="email">이메일</label>
	    				<input type="email" id="emailfinder" name="emailfinder" placeholder="이메일을 입력해주세요" required>
	    				<button type="submit">비밀번호 확인하기</button>
    				</div>
				</form>
			</div>
		</div>
	<footer>
		<%@ include file="footer.jsp"%>
	</footer>
</div>
</body>
</html>