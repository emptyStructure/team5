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
</head>
<body>

<div>
	<header>
		
	</header>
	<div>
	
	<article>
	<div>${jdetail.jtitle}</div>
	<div>${jdetail.jip}//// ${jdetail.jcount}</div>
	<div>${jdetail.jcontent}</div>
	
	<button>댓글쓰기</button>
	
	<textarea></textarea>
	<button >댓글쓰기</button>
	
	
	<div>
	댓글구현창 
	</div>
	
	<button onclick="url('./board?page=${param.page}')">게시판으로</button>
	
	</article>
	
	
	
	
	</div>


</div>

</body>
</html>