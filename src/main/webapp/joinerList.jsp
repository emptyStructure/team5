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
<link href="./css/joinerList.css" rel="stylesheet"/>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.7.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script type="text/javascript">
$(function(){
	
	$('.accept').click(function(){
		if(confirm("승인하시겠습니까?")){
			let tr = $(this).parents(".select").parents("tr");
			let jno = tr.siblings('.jno').val();
			$(this).parents(".select").text("🟢 승인");
			
			$.ajax({
				url:'./joinerList',
				type:'post',
				dataType:'text',
				data: {'jno':jno,'respon':1},
				success: function(result){
					<c:if test="${param.status ne null}">
						tr.hide();
					</c:if>
				}, error: function(request, status, error){
					alert("통신 오류");
				}
			});
		
		}
	});
	
	$('.refuse').click(function(){
		if(confirm("거절하시겠습니까?")){
			let jno = $(this).parents(".select").siblings('.jno').text();
			let tr = $(this).parents(".select").parents("tr");
			$(this).parents(".select").text("❌ 거절");
		
			$.ajax({
				url:'./joinerList',
				type:'post',
				dataType:'text',
				data: {'jno':jno,'respon':0},
				success: function(result){
					<c:if test="${param.status ne null}">
						tr.hide();
					</c:if>
				}, error: function(request, status, error){
					alert("통신 오류");
				}
			});
		
		}
	});
	
	
});
</script>
</head>
<body>
	<div class="main">
		<article>
			<h2>${sno }번 글 : ${title }</h2>
					<div class="status-list">
						<ul>
							<li onclick="location.href='./joinerList?sno=${sno }'"> 전체</li>
							<li onclick="location.href='./joinerList?sno=${sno }&status=2'"> 대기</li>
							<li onclick="location.href='./joinerList?sno=${sno }&status=1'"> 승인</li>
							<li onclick="location.href='./joinerList?sno=${sno }&status=0'"> 거절</li>
						</ul>
					</div>
					<table border="1">
						<thead>
							<tr>
								<th class="tno">No.</th>
								<th class="tname">이름</th>
								<th class="tph">연락처</th>
								<th class="tmsg">메세지</th>
								<th class="tdate">신청일</th>
								<th class="tstatus">상태</th>
							</tr>
						</thead>
						<c:if test="${fn:length(list) gt 0 }">
							<tbody>
								<c:forEach items="${list }" var="row">
									<input class="jno" value="${row.jno }" type="hidden">
									<tr>
										<td class="no">${row.no }</td>
										<td>${row.name }</td>
										<td>${row.ph }</td>
										<td>${row.message }</td>
										<td>${row.joindate }</td>
										<td class="select">
											<c:choose>
												<c:when test="${row.status eq 2}">
													<button class="accept">수락</button>
													<button class="refuse">거절</button>
												</c:when>
												<c:when test="${row.status eq 0 }">
												<div class="X">❌ 거절</div>
												</c:when>
												<c:otherwise><div class="O">🟢 승인</div></c:otherwise>
											</c:choose>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</c:if>
					</table>
					<c:if test="${fn:length(list) lt 1 }">
						<h1>There is no contents</h1>
					</c:if>
		</article>
	</div>
</body>
</html>