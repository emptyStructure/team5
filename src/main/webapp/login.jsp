<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중하하 로그인</title>
<style type="text/css">
body {
	background-image: url("./img/login3.gif");
	background-size: cover;
}

h1 {
	text-align: center;
	font-size: 100px;
	color: white;
}

.login {
	margin: 0 auto;
	width: 350px ;
	min-height: 100px;
	
	padding: 10px;
	box-sizing: border-box;
	text-align: center;
}

.login input {
	width: 100%;
	height: 50px;
	text-align: center;
	color: #eeeef1;
	margin-bottom: 10px;
	box-sizing: border-box;
	background-color: #9b9b9b;
	border-radius: 5px;
}

.login button {
	width: 45%;
	height: 30px;
	color: #eeeef1;
	font-size: large;
	background-color: #9b9b9b;
}
</style>
<script type="text/javascript">
function err() {
	let errBox = document.querySelector("#errorMSG");
	errBox.innerHTML = "<marquee>올바른 id와 pw를 입력하세요.</marquee>";
	errBox.style.color = 'white';
	
}
</script>
</head>
<body>
	<div class="container">
		<div class="main">
			<div class="mainStyle">
				<article>
					<h1>&nbsp;</h1>
					<c:if test="${param.error ne null }">
						<script type="text/javascript">
							alert("올바른 암호와 아이디를 입력하세요.");
							
						</script>
					</c:if>
					
					<div class="login">
						<form action="./login" method="post">
							<input type="text" name="id"  placeholder="아이디를 입력하세요">
							<input type="password" name="pw" placeholder="암호를 입력하세요">
							<button type="reset">지우기</button>
							<button type="submit">로그인</button>
							<div id="errorMSG"></div>
						</form>
						<a href="./join">회원가입</a>&ensp;|&ensp;<a href="./findId">아이디 찾기</a>&ensp;|&ensp;<a href="./findPw">비밀번호 찾기</a>
					</div>

				</article>
			</div>
		</div>
	</div>
	
	<c:if test="${param.error ne null }">
		<script type="text/javascript">
			err();
		</script>
	</c:if>
</body>
</html>