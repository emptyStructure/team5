<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<link href="./css/index.css" rel="stylesheet"/>
<link href="./css/header.css" rel="stylesheet"/>
<script type="text/javascript" src="./js/header.js"></script>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(function () {
	$('.showPw').hide();
	$('button').click(function() {
        var code = $('#checkpw').val(); // 입력된 코드 가져오기
        $.ajax({
            url: './pwCheck',
            type: 'post',
            data: { 'code' : code }, // 서버에 전달할 데이터
            success: function(result) {
                if (result == 1) {
                    $('.showPw').show(); // 비밀번호가 유효한 경우 결과를 표시
                } else {
                    alert('올바른 코드를 입력하세요.'); // 잘못된 코드인 경우 알림
                }
            },
            error: function(xhr, status, error) {
                alert('에러 : ' + error);
            }
        });
    });
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
			<h2>&ensp;</h2>
			<h2>코드로 비밀번호 찾기</h2><br>
				<div id="infoContents">
					<div class="idfinder">
						<label class="checkpw">발송된 코드</label>
		    			<input type="text" id="checkpw" name="checkpw" placeholder="코드를 입력해주세요" required>
		    			<button>코드확인</button>
	    			</div>
				</div>
			 <div class="showPw">
			 	<h3>${pwList[0].mname }님의 비밀번호는</h3>
			 	<table>
					<thead>
						<tr>
							<td>아이디</td>
							<td>비밀번호</td>
						</tr>
					</thead>
				<c:forEach items="${pwList }" var="row">
					<tbody>
						<tr>
							<td>${row.mid }</td>
							<td>${row.mpw }</td>
						</tr>
					</tbody>	
				</c:forEach>
				</table>
			 </div>	
		</div>
	</div>
	<footer>
		<%@ include file="footer.jsp"%>
	</footer>
</body>
</html>