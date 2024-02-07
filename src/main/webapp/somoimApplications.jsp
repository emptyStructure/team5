<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지함</title>
<script>function url(url) {window.location.href = url;}</script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.7.1.min.js"></script>
<link href="./css/somoimApplications.css" rel="stylesheet"/>
<script type="text/javascript" src="./js/menu.js"></script>
<script type="text/javascript">
$(function(){
	$('.title').click(function(){
		let sno = $(this).prev().children(".sno").val();
		var url = "./soDetail?sno="+sno;
        var name = "detail from admin";
        var option = "width = 600, height = 700, top = 100, left = 200, location = no";
		window.open(url, name, option);
	});
	
	$('.cancel').click(function(){
		let jno = $(this).next().val();
		let select = $(this).parents(".select");
		if(confirm("신청을 취소하시겠습니까?")){
			$.ajax({
				url: './joinerList',
				type:'post',
				dataType:'text',
				data:{'jno':jno,"respon":5 },
				success: function(result){
					alert("신청이 취소되었습니다.");
					select.text("신청 취소");
				}, error: function(request, status, error){
					alert("통신 오류");
				}
			});	
		}
	});
	
	$('.out').click(function(){
		let select = $(this).parents(".select");
		let jno = $(this).next().val();
		let mid1 = $(this).siblings(".mid").val();
		if(mid1=='${sessionScope.mid}'){
			alert("작성자 본인은 탈퇴 할 수 없습니다.");
		} else {
			if(confirm("모임에서 탈퇴하시겠습니까?")){
				$.ajax({
					url: './joinerList',
					type:'post',
					dataType:'text',
					data:{'jno':jno,"respon":3 },
					success: function(result){
						alert("탈퇴되었습니다.");
						select.text("탈퇴");
					}, error: function(request, status, error){
						alert("통신 오류");
					}
				});	
			}
		}
	});
	
	

});
</script>
</head>
<body>
	<div class="wrap">
		<div class="menu">
			<nav>
				<ul>
					<li onclick="location.href='./somoimAdmin'"><i class="xi-home"></i> 신청자 관리</li>
					<li onclick="location.href='./somoimApplications'"><i class="xi-home"></i> 내 신청 목록</li>
				</ul>
			</nav>
		</div>
		<div class="main">
			<article>
				<h2>내 신청 목록</h2>
				<div class="sList">
					<ul>
						<li onclick="url('./somoimApplications')">전체보기</li>
						<li onclick="url('./somoimApplications?status=1')">🟢 승인</li>
						<li onclick="url('./somoimApplications?status=2')">🧾 대기</li>
						<li onclick="url('./somoimApplications?status=0')">❌ 거절</li>
						<li onclick="url('./somoimApplications?status=3')">탈퇴</li>
						<li onclick="url('./somoimApplications?status=4')">추방</li>
						<li onclick="url('./somoimApplications?status=5')">취소</li>
					</ul>
				</div>
				<table border="1">
					<thead>
						<tr>
							<th class="tno">No.</th>
							<th class="ttitle">제목</th>
							<th class="tname">이름</th>
							<th class="tph">연락처</th>
							<th class="tmsg">메세지</th>
							<th class="tdate">신청일</th>
							<th class="tstatus">상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="row">
							<tr>
								<td>${row.no }
								<input value="${row.sno }" type="hidden" class="sno"></td>
								<td class="title">${row.title }</td>
								<td>${row.name }</td>
								<td>${row.ph }</td>
								<td>${row.message }</td>
								<td>${row.joindate }</td>
								<td class="select">
									<c:choose>
										<c:when test = "${row.status eq 0}">
										❌ 거절
										</c:when>
										<c:when test = "${row.status eq 1}">
										🟢 승인
										<button type="button" class="out">탈퇴</button>
										</c:when>
										<c:when test = "${row.status eq 2}">
										🧾 대기중
										<button type="button" class="cancel">신청 취소</button>
										</c:when>
										<c:when test = "${row.status eq 3}">
										탈퇴
										</c:when>
										<c:when test = "${row.status eq 4}">
										추방
										</c:when>
										<c:when test = "${row.status eq 5}">
										신청 취소
										</c:when>
									</c:choose>
									<input value="${row.jno }" type="hidden" class="jno">
									<input value="${row.mid }" type="hidden" class="mid">
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</article>
		</div>
	</div>
</body>
</html>