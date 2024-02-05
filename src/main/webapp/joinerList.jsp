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
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link href="./css/joinerList.css" rel="stylesheet"/>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(function(){
	
	$('.accept').click(function(){
		if(confirm("승인하시겠습니까?")){
			let jno = $(this).parents(".select").siblings('.jno').text();
			$(this).parents(".select").text("🟢 승인");
		
			$.ajax({
				url:'./joinerList',
				type:'post',
				dataType:'text',
				data: {'jno':jno,'respon':1},
				success: function(result){
					
				}, error: function(request, status, error){
					alert("통신 오류");
				}
			});
		
		}
	});
	
	$('.refuse').click(function(){
		if(confirm("거절하시겠습니까?")){
			let jno = $(this).parents(".select").siblings('.jno').text();
			$(this).parents(".select").text("❌ 거절");
		
			$.ajax({
				url:'./joinerList',
				type:'post',
				dataType:'text',
				data: {'jno':jno,'respon':0},
				success: function(result){

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
			<h2>${sno } : ${title }</h2>
			<table border="1">
				<thead>
					<tr>
						<td>jno</td>
						<td>mno</td>
						<td>sno</td>
						<td>name</td>
						<td>ph</td>
						<td>message</td>
						<td>joindate</td>
						<td>status</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="row">
						<tr>
							<td class="jno">${row.jno }</td>
							<td>${row.mno }</td>
							<td>${row.sno }</td>
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
			</table>
		</article>
	</div>
</body>
</html>