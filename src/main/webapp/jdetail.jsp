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
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script type="text/javascript" src="./js/menu.js"></script>
<c:set var="jQueryURL"
	value="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" />
	
	
<script src="${jQueryURL}"
	integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script type="text/javascript">
	function del() {
		var ch = confirm("글을 삭제하시겠습니까?");
		if (ch) {
			location.href = `./jdelete?no=${jdetail.jno}`;
		}
	}
	function update() {
		if (confirm("수정하시겠습니까?")) {
			location.href = "./jupdate?no=${jdetail.jno}";
		}
	}
	
	 function removeUnnecessaryTags(content) {
	        // <p> 태그 제거
	        content = content.replace(/<p>/gi, '');
	        content = content.replace(/<\/p>/gi, '');
	        
	        // <br> 태그 제거
	        content = content.replace(/<br>/gi, '');
	        
	        return content;
	    }
	
	
	function extractImages() {
        // detailBCONTENT 요소 내의 모든 이미지 태그 가져오기
        var content = document.getElementsByClassName('detailBCONTENT')[0];
        if (content) {
            var images = content.getElementsByTagName('img');

            // 이미지를 담을 컨테이너 요소
            var imageContainer = document.getElementById('imageContainer');
            if (!imageContainer) {
                // 이미지 컨테이너 요소가 존재하지 않으면 생성
                imageContainer = document.createElement('div');
                imageContainer.id = 'imageContainer';
                content.appendChild(imageContainer); // detailBCONTENT 요소에 추가
            }

            // 이미지를 표시
            for (var i = 0; i < images.length; i++) {
                var imageSrc = images[i].getAttribute('src');
                var image = document.createElement('img');
                image.src = imageSrc;
                imageContainer.appendChild(image);
            }
        }
    }
    
    // 페이지 로드 후 extractImages 함수 호출
    window.onload = function() {
        extractImages();
    };
	 
	$(document)
			.ready(
					function() {
						$("#comment-btn").click(function() {
							let content = $("#commentcontent").val();
							let jno = ${jdetail.jno};
							if (content.length < 5) {
								alert("댓글은 다섯글자 이상으로 적어주세요.");
								$("#commentcontent").focus();
							} else {
								let form = $('<form></form>');
								form.attr('name', 'form');
								form.attr('method', 'post');
								form.attr('action', './jcomment');
								form.append($('<input/>', {
									type : 'hidden',
									name : 'commentcontent',
									value : content
								}));//json
								form.append($('<input/>', {
									type : 'hidden',
									name : 'jno',
									value : jno
								}));
								form.appendTo("body");
								form.submit();
							}
						});

						$(".commentDelete").click(function() {
							if (confirm("삭제 하시겠습니까?")) {
								let cno = $(this).prev().val();
								//ajax
								let point = $(this).closest(".comment");
								$.ajax({
									url : './jcommentdel', //주소
									type : 'post', //get, post
									dataType : 'text', //수신타입 json
									data : {
										no : cno
									}, //보낼 값
									success : function(result) {// 0, 1
										if (result == 1) {
											point.remove();
										} else {
											alert("삭제할 수 없습니다. 관리자에게 문의하세요.");
										}
									},
									error : function(request, status, error) {//통신 오류
										alert("문제가 발생했습니다.");
									}
								});
							}
						});

						$(".commentEdit")
								.click(
										function() {
											if (confirm('수정하시겠습니까?')) {
												let cno = $(this).siblings(
														".cno").val();
												let comment = $(this).parents(
														".chead").next();
												$(this).prev().hide();
												$(this).hide();
												comment.css('height', '110');
												comment.css('padding-top',
														'10px');
												comment.css('backgroundColor',
														'#c1c1c1');
												let recommentBox = '<div class="recommentBox">';
												recommentBox += '<textarea class="commentcontent">'
														+ (comment.html()
																.replaceAll(
																		"<br>",
																		"\r\n"))
														+ '</textarea>';
												recommentBox += '<input type="hidden" name="cno" value="' + cno + '">';
												recommentBox += '<button class="comment-btn">댓글 수정</button>';
												recommentBox += '</div>';
												comment.html(recommentBox);
											}
										});

						$(document)
								.on(
										'click',
										".comment-btn",
										function() {
											if (confirm('수정하시겠습니까?')) {
												let cno = $(this).prev().val();
												let recomment = $(this)
														.parents('.comment')
														.find('.commentcontent')
														.val();
												let comment = $(this).parents(
														".ccomment");//댓글 위치

												$
														.ajax({
															url : './jrecomment',
															type : 'post',
															dataType : 'text',
															data : {
																'cno' : cno,
																'comment' : recomment
															},
															success : function(
																	result) {
																if (result == 1) {
																	$(this)
																			.parent(
																					".recommentBox")
																			.remove();
																	comment
																			.css(
																					'backgroundColor',
																					'#ffffff');
																	comment
																			.html(recomment
																					.replace(
																							/(?:\r\n|\r|\n)/g,
																							'<br>'));
																	$(
																			".commentDelete")
																			.show();
																	$(
																			".commentEdit")
																			.show();
																} else {
																	alert("문제가 발생했습니다. 화면을 갱신합니다.");
																	location.href = './jdetail?page=${param.page}&no=${jdetail.jno}';
																}
															},
															error : function(
																	request,
																	status,
																	error) {
																alert('김치문제가 발생했습니다. : '
																		+ error);
															}
														});
											}
										});
						
						/* extractImages(); */
					}); // 여기서 닫는 괄호를 추가해주었습니다.

					
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
						<div>판매여부 ${jdetail.jsell == 1 ? '*판매 미완료*' : '*판매 완료*'}</div>
						<hr>
						<!-- 수평선 추가 -->
						<div class="detailBWRITECOUNT">
							<div class="detailBWRITE">작성자: ${jdetail.jwrite}</div>
							<div class="detailBCOUNT">${jdetail.jip }/${jdetail.jcount }</div>
						</div>
						<hr>
						<!-- 수평선 추가 -->
							
						<div class="detailBCONTENT"> ${jdetail.jcontent }</div>
						<!-- 이미지를 표시할 컨테이너 -->
						


					</div>

					<c:if test="${sessionScope.mname != null && jdetail.jmid eq sessionScope.mid}">
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
									<div class="cname">${co.jcmname }님<c:if
											test="${sessionScope.mname ne null && co.jcmid eq sessionScope.mid }">
											<input type="hidden" class="cno" value="${co.jcno }">
											<img alt="삭제" src="./img/delete.png" class="commentDelete">
											<img alt="수정" src="./img/edit.png" class="commentEdit">
										</c:if>
									</div>
									<div class="cdate">${co.jcip}/${co.jcdate }</div>
								</div>
								<div class="ccomment">${co.jccontent }</div>
							</div>
						</c:forEach>
					</div>



					<button
						onclick="window.location.href='./jboard?page=${param.page}'">게시판으로</button>
				</article>



			</div>
		</div>
	</div>

</body>

</html>


