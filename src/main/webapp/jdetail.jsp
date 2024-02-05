<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고디테일</title>
<script type="text/javascript">
function del() {
    var ch = confirm("글을 삭제하시겠습니까?");
    if (ch) {
        location.href = `./jdelete?no=${jdetail.jno}`;
    }
}
function update(){if(confirm("수정하시겠습니까?")){location.href="./update?no=${detail.no }";}}

</script>


</head>
<body>

<div>
	
	
		<div class="container">
		<header>
			<%@ include file="menu.jsp"%>
		</header>
		<div class="main">
			<div class="mainStyle">
				<article>
					<div class="detailDIV">
						<div class="detailTITLE">${jdetail.jtitle }</div>
						<div class="detailWRITECOUNT">
							<div class="detailWRITE">
								${jdetail.jwrite }
								<c:if test="${sessionScope.mname ne null && jdetail.jmid eq sessionScope.mid }">
									<img alt="삭제" src="./img/delete.png" onclick="del()">
									<img alt="수정" src="./img/edit.png" onclick="update()">
								</c:if>
							</div>
							<div class="detailCOUNT">${jdetail.jip } / ${jdetail.jcount }</div>
						</div>
						<div class="detailCONTENT">${jdetail.jcontent }</div>
					</div>
					<c:if test="${sessionScope.mid ne null }">
						<button class="xi-comment-o">댓글쓰기</button>
						<!-- 댓글쓰는 창을 여기다가 만들어주겠습니다. 댓글내용, 누가, 어느, 2024-01-22 -->
						<div class="comment-write">
							<div class="comment-form">
								<textarea id="commentcontent"></textarea>
								<button id="comment-btn">댓글쓰기</button>
							</div>
						</div>
					</c:if>

	<%-- <header>
		
	</header>
	<div>
	
	<article>
	<div>${jdetail.jtitle}</div>
	<div>${jdetail.jip}// ${jdetail.jcount}</div>
	<div>${jdetail.jcontent}</div>
	
	<button>댓글쓰기</button>
	
	<textarea></textarea>
	<button >댓글쓰기</button>
	 --%>
	
	<div>
	댓글구현창 
	</div>
	
<button onclick="window.location.href='./jboard?page=${param.page}'">게시판으로</button>
	
	</article>
	
		</div>
	</div>
	
	
	
	
	
	</div>


</div>

</body>
</html>