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
<link href="./css/menu.css" rel="stylesheet"/>
<link href="./css/myInfo.css" rel="stylesheet"/>
<script type="text/javascript" src="./js/menu.js"></script>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$('.name').click(function (){
	
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
			<div id="menu">
				<%@ include file="menu.jsp"%>
			</div>
		</header>
		<div class="side" id="left">
			<%@ include file="leftside.jsp"%>
		</div>
		<div class="side" id="right">
			<%@ include file="rightside.jsp"%>
		</div>					
		<div id="content">
			<h3>아이디 찾기</h3>
			<div id="infoContents">
				<form action="./findId" method="post">
				
					<div class="namefinder">
						<label class="name">이름</label>
	    				<input type="text" id="namefinder" name="namefinder" placeholder="아이디">
	    				<button type="submit" id="namefinder">아이디 확인하기</button>
    				</div>
    				<br><br><br>
    				<div class="emailfinder">
						<label>이메일</label>
    					<input type="text" id="emailfinder" name="emailfinder" placeholder="이메일">
    					<button type="submit" id="emailfinder">아이디 확인하기</button>
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