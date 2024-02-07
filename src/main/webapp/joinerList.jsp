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
			let select = $(this).parents(".select");
			let tr = select.parents("tr");
			let jno = tr.prev().val();
			let sno = ${param.sno };
			let total = $('#info').children(".total").children();
			var num = Number(total.text());
			
			$.ajax({
				url:'./joinerList',
				type:'post',
				dataType:'text',
				data: {'jno':jno,'respon':1, 'sno':sno},
				success: function(result){
					if(result==1){
						select.html("🟢 승인 <button class='out'>추방</button>");
						total.text(num+1);
						<c:if test="${param.status ne null}">
							tr.hide();
						</c:if>
					} else {
						alert("이미 정원이 가득찼습니다.");
					}
				}, error: function(request, status, error){
					alert("통신 오류");
				}
			});
		
		}
	});
	
	$('.refuse').click(function(){
		if(confirm("거절하시겠습니까?")){
			let select = $(this).parents(".select");
			let tr = select.parents("tr");
			let jno = tr.prev().val();
			let sno = ${param.sno };
		
			$.ajax({
				url:'./joinerList',
				type:'post',
				dataType:'text',
				data: {'jno':jno,'respon':0 },
				success: function(result){
					select.text("❌ 거절");
					<c:if test="${param.status ne null}">
						tr.hide();
					</c:if>
				}, error: function(request, status, error){
					alert("통신 오류");
				}
			});
		
		}
	});
	
	$('.out').click(function(){
		let select = $(this).parents(".select");
		let mid1 = select.siblings(".mid").text();
		
		if(mid1 == '${sessionScope.mid }'){
			alert("작성자 본인을 추방 할 수 없습니다.");
		} else {
			if(confirm("추방하시겠습니까?")){
				let tr = select.parents("tr");
				let jno = tr.prev().val();		
				let sno = ${param.sno };
				alert(jno);
				$.ajax({
					url:'./joinerList',
					type:'post',
					dataType:'text',
					data: {'jno':jno,'respon':4 },
					success: function(result){
						select.text("추방");
						<c:if test="${param.status ne null}">
							tr.hide();
						</c:if>
					}, error: function(request, status, error){
						alert("통신 오류");
					}
				});
			}
		}
	});
	
	$(".title").click(function(){
		var sno = ${detail.sno};
		var url = "./soDetail?sno="+sno;
        var name = "detail from admin";
        var option = "width = 600, height = 700, top = 100, left = 200, location = no";
		window.open(url, name, option);
	});
	
	
});
</script>
</head>
<body>
	<div class="main">
		<article>
			<h2 class="title">${detail.sno }번 글 : ${detail.stitle }</h2>
				<div class="header">
					<div class="status-list">
						<ul>
							<li onclick="location.href='./joinerList?sno=${sno }'"> 전체</li>
							<li onclick="location.href='./joinerList?sno=${sno }&status=2'">🧾 대기</li>
							<li onclick="location.href='./joinerList?sno=${sno }&status=1'">🟢 승인</li>
							<li onclick="location.href='./joinerList?sno=${sno }&status=0'">❌ 거절</li>
							<li onclick="location.href='./joinerList?sno=${sno }&status=3'">🌀 탈퇴</li>
							<li onclick="location.href='./joinerList?sno=${sno }&status=4'">🏳️ 추방</li>
							<li onclick="location.href='./joinerList?sno=${sno }&status=5'">🚩 취소</li>
						</ul>
					</div>
					<div id="info">
							<div class="emoji">👪</div>
						<ul class="total">
							<li>${detail.total } </li>
						</ul>
						<ul class="personnel">
							<li> / ${detail.personnel}</li>
						</ul>
						<ul class="views">
							<li>❤️ 100</li>
						</ul>
					</div>
				</div>
				<div>
					<table border="1">
						<thead>
							<tr>
								<th class="tno">No.</th>
								<th class="tname">이름</th>
								<th class="tid">ID</th>
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
										<td class="mid">${row.mid }</td>
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
												<c:when test="${row.status eq 1 }">
													<div class="O">🟢 승인
														<button class="out">추방</button>
													</div>
												</c:when>
												<c:when test="${row.status eq 3 }">
													<div class="">탈퇴</div>
												</c:when>
												<c:when test="${row.status eq 4 }">
													<div class="">추방</div>
												</c:when>
												<c:when test="${row.status eq 5 }">
													<div class="">취소</div>
												</c:when>
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
				</div>
		</article>
	</div>
</body>
</html>