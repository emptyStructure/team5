<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고디테일</title>
<link href="./css/index.css" rel="stylesheet" />
<link href="./css/menu.css" rel="stylesheet" />
<link href="./css/detail.css" rel="stylesheet" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script type="text/javascript" src="./js/menu.js"></script>
<c:set var="jQueryURL" value="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" />
<script src="${jQueryURL}" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script type="text/javascript">
	function del() {
		var ch = confirm("글을 삭제하시겠습니까?");
		if (ch) {
			location.href = `./jdelete?no=${jdetail.jno}`;
		}
	}
	function update() {
		if (confirm("수정하시겠습니까?")) {
			location.href = "./jupdate?no=${jdetail.jno }";
		}
	}
	
	$(document).ready(function(){
	$("#comment-btn").click(function(){
		console.log("김치볶음밥");
        let content = $("#commentcontent").val();
        let jno = ${jdetail.jno };
        if(content.length < 5){
            alert("댓글은 다섯글자 이상으로 적어주세요.");
            $("#commentcontent").focus();
        } else {
            let form = $('<form></form>');
            form.attr('name', 'form');
            form.attr('method', 'post');
            form.attr('action', './jcomment');
            form.append($('<input/>', {type:'hidden', name:'commentcontent', value:content}));//json
            form.append($('<input/>', {type:'hidden', name:'jno', value:jno}));
            form.appendTo("body");
            form.submit();
        }
    });
	
	});
	
</script>

</head>
<body>

<div class="container">
	<header>
		<%@ include file="menu.jsp"%>
	</header>
	<div class="main">
		<div class="mainStyle">
			<article>
				<div class="detailDIV">
					<div class="detailBTITLE">${jdetail.jtitle }</div>
					<hr> <!-- 수평선 추가 -->
					<div class="detailBWRITECOUNT">
						<div class="detailBWRITE">
						    작성자: ${jdetail.jwrite}
						</div>
						<div class="detailBCOUNT">${jdetail.jip }/ ${jdetail.jcount }</div>
					</div>
					<hr> <!-- 수평선 추가 -->
					<div class="detailBCONTENT">${jdetail.jcontent }</div>
				</div>
				
				<c:if test="${sessionScope.mname ne null && detail.mid eq sessionScope.mid }">
					<button onclick="update()">수정하기</button>
					<button onclick="del()">삭제하기</button>	
				</c:if>
					
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
				
						<!-- 댓글 출력창 -->
					<div class="comments">
						<c:forEach items="${commentList }" var="co">
							<div class="comment">
								<div class="chead">
									<div class="cname">${co.jcmname }님<c:if test="${sessionScope.mname ne null && co.jcmid eq sessionScope.mid }">
											<input type="hidden" class="cno" value="${co.jcno }">
											<img alt="삭제" src="./img/delete.png" class="commentDelete">
											<img alt="수정" src="./img/edit.png" class="commentEdit">
										</c:if>
									</div>
									<div class="cdate">${co.jcip} / ${co.jcdate }</div>
								</div>
								<div class="ccomment">${co.jccontent }</div>
							</div>
						</c:forEach>
					</div>
				
				

				<button onclick="window.location.href='./jboard?page=${param.page}'">게시판으로</button>
			</article>
			
			
			
		</div>
	</div>
</div>

</body>

</html>



<%-- <div>
	
	
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
				
				
				\
				
				
				
				
				
				
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

	<header>
		
	</header>
	<div>
	
	<article>
	<div>${jdetail.jtitle}</div>
	<div>${jdetail.jip}// ${jdetail.jcount}</div>
	<div>${jdetail.jcontent}</div>
	
	<button>댓글쓰기</button>
	
	<textarea></textarea>
	<button >댓글쓰기</button>
	
	
	<div>
	댓글구현창 
	</div>
	
<button onclick="window.location.href='./jboard?page=${param.page}'">게시판으로</button>
	
	</article>
	
		</div>
	</div>
	
	
	
	
	
	</div>


</div>
 --%>