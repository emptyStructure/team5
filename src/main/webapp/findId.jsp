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
<script type="text/javascript">
$(function (){
	$('.namefinder').hide();
	$('.emailfinder').hide();
	
	$('.name').click(function (){
		$('.namefinder').toggle();
	});	

	$('.email').click(function (){
		$('.emailfinder').toggle();
	});	
	
});

</script>
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
			<h2>아이디 찾기</h2><br>
			<div id="infoContents">
				<form method="post">
					<label class="name">이름으로 찾기</label>
					<div class="namefinder">
						<label class="name">이름</label>
	    				<input type="text" id="namefinder" name="namefinder" placeholder="이름을 입력해주세요">
	    				<button type="submit" formaction="./findIdName">아이디 확인하기</button>
    				</div>
    				<br><br><br>
    				<label class="email">이메일로 찾기</label>
    				<div class="emailfinder">
						<label>이메일</label>
    					<input type="email" id="emailfinder" name="emailfinder" placeholder="이메일을 @를 포함해서 입력해주세요" >
    					<button type="submit" formaction="./findIdEmail">아이디 확인하기</button>
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