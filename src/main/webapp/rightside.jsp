<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<c:choose><c:when test="${sessionScope.mname eq null}">
	<div class="loginBox">
		<form action="./login" method="post">
			<input type="text" name="id">			
			<input type="password" name="pw">
			<button type="button"><a href="./join">회원가입</a></button>		
			<button type="submit">로그인</button>		
		</form>
	</div>
</c:when><c:otherwise>
	<div class="doneLogin">
		<form action="./logout">
			${sessionScope.mname}님<br>
			<button type="button"><a href="./myInfo">마이페이지</a></button>
			<button type="submit">로그아웃</button>
		</form>					
	</div>
</c:otherwise></c:choose>
<div class="add" id="add2">
	<img alt="광고2" src="./img/adv.gif" width="100%">
</div>