<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세사항</title>
<link href="./css/index.css" rel="stylesheet" />
<link href="./css/menu.css" rel="stylesheet" />
<link href="./css/detail.css" rel="stylesheet" />
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script type="text/javascript" src="./js/menu.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
	integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript">
function update(){if(confirm("수정하시겠습니까?")){location.href="./update?bno=${detail.bno }";}}
function del(){var ch = confirm("삭제하시겠습니까?");if(ch){location.href="./delete?bno=${detail.bno }";}}

</script>
<body>
	<div class="container">
		<header>
			<%@ include file="menu.jsp"%>
		</header>
		<div class="main">
			<div class="mainStyle">
				<article>
					<div class="detailDIV">
						<div class="detailBTITLE">${detail.btitle }</div>
						<div class="detailBWRITECOUNT">
							<div class="detailBWRITE">
							    작성자: ${detail.bwrite}
							    
							</div>
							<div class="detailBCOUNT">${detail.bip }/ ${detail.bcount }</div>
						</div>
						<div class="detailBCONTENT">${detail.bcontent }</div>
						
					</div>
					<c:if test="${sessionScope.mname ne null && detail.mid eq sessionScope.mid }">
							        <button onclick="update()">수정하기</button>
					                <button onclick="del()">삭제하기</button>	
							    </c:if>
					
					<c:if test="${sessionScope.mid ne null }">
						
					</c:if>

					<button onclick="url('./board?page=${param.page}')">게시판으로</button>
				</article>
			</div>
		</div>
	</div>
</body>
</html>