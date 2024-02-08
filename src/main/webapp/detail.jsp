<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세사항</title>
<style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
        }

        #container {
            min-height: 100%;
            position: relative;
        }

        footer {
            position: absolute;
            bottom: 0;
            width: 100%;
        }

        .main {
            padding-bottom: 50px;
        }

        .comment {
            max-height: 400px; 
            overflow-y: auto;
            margin-bottom: 20px; 
        }

       
    </style>
<link href="./css/index.css" rel="stylesheet" />
<link href="./css/header.css" rel="stylesheet" />
<link href="./css/detail.css" rel="stylesheet" />
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script type="text/javascript" src="./js/header.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
	integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript">
function update(){if(confirm("수정하시겠습니까?")){location.href="./update?bno=${detail.bno }";}}
function del(){var ch = confirm("글을 삭제하시겠습니까?");if(ch){location.href="./delete?bno=${detail.bno }";}}
    $(document).ready(function() {
    	$(".bcommentEdit").click(function(){
    		if(confirm('수정하시겠습니까?')){
    			let cno = $(this).siblings(".cno").val();
    			let comment = $(this).parents(".chead").next();
    			$(this).prev().hide();
    			$(this).hide();
    			comment.css('height','110');
    			comment.css('padding-top','10px');
    			comment.css('backgroundColor','#c1c1c1');
    			let recommentBox = '<div class="recommentBox">';
    			recommentBox += '<textarea class="commentcontent">' + (comment.html().replaceAll("<br>", "\r\n")) + '</textarea>';
    			recommentBox += '<input type="hidden" name="cno" value="' + cno + '">';
    			recommentBox += '<button class="comment-btn">댓글 수정</button>';
    			recommentBox += '</div>';
    			comment.html(recommentBox);
    		}
    	});
    	
    	$(document).on('click',".comment-btn", function (){
    		if(confirm('수정하시겠습니까?')){
    			let cno = $(this).prev().val();
    			let recomment = $('.commentcontent').val();
    			let comment = $(this).parents(".ccontent");
    			
    			$.ajax({
    				url : './bcommentEdit',
    				type : 'post',
    				dataType : 'text',
    				data : {'cno': cno, 'ccontent': recomment},
    				success : function(result){
    					if(result == 1){
    						$(this).parent(".recommentBox").remove();
    						comment.css('backgroundColor','#ffffff');
    						comment.css('min-height','100px');
    						comment.css('height', 'auto');
    						comment.html(recomment.replace(/(?:\r\n|\r|\n)/g, '<br>'));
    						$(".bcommentDel").show();
    						$(".bcommentEdit").show();
    					} else {
    						alert("문제가 발생했습니다. 화면을 갱신합니다.");
    						location.href='./detail?page=${param.page}&bno=${detail.bno}';
    					}
    				},
    				error : function(error){
    					alert('문제가 발생했습니다. : ' + error);
    				}
    			});
    		}
    		
    	});
    	
    	$(".bcommentDel").click(function(){
    		if(confirm("삭제 하시겠습니까?")) {
    			let cno = $(this).siblings(".cno").val();
    			let point = $(this).closest(".bcomment");
    			$.ajax({
    				url : './bcommentDel',   
    				type : 'post',          
    				dataType : 'text',	
    				data: {cno : cno},      
    				success:function(result){
    					if(result == 1){
    						point.remove();
    						location.reload();//삭제했을때 화면에서 자동 새로고침
    					} else {
    						alert("삭제할 수 없습니다.");
    					}
    				},
    				error:function(request, status, error){
    					alert("문제가 발생했습니다.");
    				}
    			});
    		}
    	});
    		
    	
    	
        $("#comment-close-btn").click(function() {
            $("#comment-write-area").slideUp('slow');
            $("#comment-close-btn").hide();
            $("#comment-open-btn").show();
        });

        $(".xi-comment-o").click(function() {
            $(".xi-comment-o").hide();
            $(".comment-write").slideDown('slow');
            $("#comment-close-btn").show();
            $("#commentcontent").val(""); 
            $("#comment-btn").text("댓글쓰기 0/100"); 
        });

        $("#comment-btn").click(function(){
            let content = $("#commentcontent").val();
            let bno = ${detail.bno };
            if(content.length < 1){
                alert("댓글은 한글자 이상으로 적어주세요.");
                $("#commentcontent").focus();
            } else {
                let form = $('<form></form>');
                form.attr('name', 'form');
                form.attr('method', 'post');
                form.attr('action', './bcomment');
                form.append($('<input/>', {type:'hidden', name:'commentcontent', value:content}));
                form.append($('<input/>', {type:'hidden', name:'bno', value:bno}));
                form.appendTo("body");
                form.submit();
            }
        });

        $("#commentcontent").keyup(function() {
            let text = $(this).val();
            if (text.length > 100) {
                alert("100자를 초과했습니다.");
                $(this).val(text.substr(0, 100));
            }
            $("#comment-btn").text("댓글쓰기 " + text.length + "/100");
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
		<div class="main">
			<div class="mainStyle">
				<article>
					<div class="detailDIV">
						<div class="detailBTITLE">${detail.btitle }</div>
						<div class="detailBWRITECOUNT">
							<div class="detailBWRITE">작성자: ${detail.bwrite}</div>
							<div class="detailBCOUNT">${detail.bip }/${detail.bcount }</div>
						</div>
						<div class="detailBCONTENT">${detail.bcontent }</div>
					</div>
					<c:if test="${sessionScope.mname ne null && detail.mid eq sessionScope.mid }">
						<button onclick="update()">수정</button>
						<button onclick="del()">삭제</button>
					</c:if>

					<c:if test="${sessionScope.mid ne null }">
						<button class="xi-comment-o" id="comment-open-btn">댓글쓰기</button>
						<div class="comment-write" id="comment-write-area" style="display: none;">
							<div class="comment-form">
								<textarea id="commentcontent"></textarea>
								<button id="comment-btn">댓글쓰기</button>
							</div>
						</div>
						<button id="comment-close-btn" style="display: none;">댓글닫기</button>
					</c:if>
					
					<div class="comment">
					    <c:forEach items="${bcommentList }" var="co">
					        <div class="comment">
					            <div class="chead">
					                <div class="cname">${co.mname }님<c:if test="${sessionScope.mname ne null && co.mid eq sessionScope.mid }">
					                    <input type="hidden" class="cno" value="${co.cno }">
					                    <button class="bcommentEdit">수정</button>
						                <button class="bcommentDel">삭제</button>
						            </c:if>
					            </div>
					            <div class="cdate">${co.cip} / ${co.cdate }</div>
					        </div>
					        <div class="ccontent">${co.ccontent }</div>
					    </div>
					    </c:forEach>
					</div>
					<button onclick="location.href='./board?page=${param.page}'">게시판으로</button>
				</article>
			</div>
		</div>
		</div>
		<footer>
		<%@ include file="footer.jsp"%>
	</footer>
		<c:import url="footer.jsp"/>
		</footer>
	</div>
</body>
</html>