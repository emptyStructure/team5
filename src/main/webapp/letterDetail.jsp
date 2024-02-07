<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${detail.ltitle }</title>
<link href="./css/letterDetail.css" rel="stylesheet"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript" src="./js/menu.js"></script>
<script type="text/javascript">
$(document).ready(function(){
		
});
</script> 
</head>
<body>
	<article>
		<div class="detail">
			<div class="soheader">
				<div class="title">
					제목 : ${detail.ltitle }
				</div>
			</div>
			<div class="body">
				<div class="info">
					<div class="writer">보낸 사람 : ${detail.writer } | 받는 사람 : ${detail.receiver }</div>
					<div class="date">${detail.date }</div>
				</div>
				<div class="conStyle">
					<div class="content">${detail.msg }</div>
				</div>
			</div>
		</div>
	</article>
</body>
</html>