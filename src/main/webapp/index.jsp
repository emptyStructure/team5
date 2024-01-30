<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<link href="./css/index.css" rel="stylesheet"/>
</head>
<body>	
<h1>메인 페이지</h1>
	<div class="container">
		<div class="menu">
			<nav>
				<ul>
					<li onclick="url('./')">홈</li>
					<li onclick="url('./')">게시판</li>
					<li onclick="url('./')">소모임</li>
					<li onclick="url('./')">마켓</li>
					<li onclick="url('./')">로그인</li>
				</ul>
			</nav>
		</div>
		<div class="main">
		
			<div class="board">			
			게시판
			</div>
			
			<div class="somoim">
			소모임
			</div>
			<div class="market">
			중고
			</div>
		</div>
	
	</div>
	

</body>
</html>