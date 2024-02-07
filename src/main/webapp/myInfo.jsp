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
<link href="./css/myInfo.css" rel="stylesheet"/>
<script type="text/javascript" src="./js/header.js"></script>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$('.infoBox').hide();
	
	$('.infoBtn').click(function(){
		$(this).css('color', 'dimgray');
		$(this).next().show();
	});
	
	$('.closeBtn').click(function(){
		$(this).parents('.infoBox').prev().css('color', 'black');
		$(this).parents('.infoBox').hide();
	});
	
/* 	$('#mPW').text("*"); */

});

</script>
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
			<h3>마이 페이지</h3>
			<div id="infoContents">
				<h4 class="infoBtn">내 정보 수정</h4>
				<div id="chngInfo" class="infoBox">
 					<form action="./myInfo" method="post" id="change">
 							<label> 닉네임 <br>
								<input type="text" id="mName" name="mName" value="${myInfo.mname }">
 							</label><br>
							<label> 이메일 <br>
								<input type="text" id="memail" name="mEmail" value="${myInfo.memail }">
							</label><br>
							<label> 비밀번호 <br>
								<input type="password" id="mPW" name="mPW" value="${myInfo.mpw }">
							</label><br>
					<button type="submit">변경사항 저장</button>
					<button type="reset">초기화</button>
					<input type="hidden" name="no" value="${myInfo.mno }">
					</form>
				<button type="button" class="closeBtn"> 닫기 </button>
				</div>
				<h4 class="infoBtn">내가 쓴 글</h4>
				<div class="infoBox">
					<table>
						<c:forEach items="${myBoard }" var="row">
						<tr>
							<td class="w5"><a href="./detail?bno=${row.bno}">${row.btitle }</a></td>
							<td class="w2">${row.bdate }</td>
							<td class="w2">${row.bcount }</td>
						</tr>
						</c:forEach>
					</table>															
					<button type="button" class="closeBtn">닫기</button>
				</div>
				<h4 class="infoBtn">내 댓글</h4>
				<div class="infoBox">
					<table>
						<c:forEach items="${myComments }" var="row">
						<tr>
							<td class="w5" id="cBno"><a href="./detail?bno=${row.bno}">${row.ccontent}</a></td>
							<td class="w2">${row.cdate }</td>
						</tr>
						</c:forEach>
					</table>															
					<button type="button" class="closeBtn">닫기</button>
				</div>
				<h4 class="infoBtn"><a href="./somoimAdmin">소모임 관리</a></h4>
				<h4 class="infoBtn">내 거래내역</h4>
				<div id="myMarket" class="infoBox">
					<button type="button" class="closeBtn">닫기</button>
				</div>	
			</div>
		</div>
	<footer>
		<%@ include file="footer.jsp"%>
	</footer>
</div>
</body>
</html>