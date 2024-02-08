<%@page import="com.team5.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.team5.dao.BoardDAO"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>글쓰기</title>
<link href="./css/index.css" rel="stylesheet"/>
<link href="./css/menu.css" rel="stylesheet"/>
<script type="text/javascript" src="./js/menu.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<style type="text/css">
#title{
	width: 100%;
	height: 30px;
	margin-bottom: 10px;	
}
</style>
</head>
<body>
	<div class="container1">
		<div class="main">
			<div class="mainStyle">
				<article>
				<!-- 	<form id="myForm" method="post" action="YourServlet" enctype="multipart/form-data">
      				  <textarea id="summernote" name="content"></textarea>
        			 <input type="file" name="image" id="image">
       				 <button type="submit">Submit</button>
    	 </form> -->
				
				
				
					<h1>글쓰기</h1>
					<div class="writeFORM">
						<form action="./jwrite" method="post" enctype="multipart/form-data">
							<input type="text" id="title" name="title">
							<textarea id="summernote" name="content"></textarea>
							<input type="file" name="image" id="image">
							<button type="submit">저장하기</button>
						</form>
					</div>
					
				</article>
			</div>
		</div>
	</div>
	<script>
    $(document).ready(function() {
        $('#summernote').summernote({
        	height: 500
        });
    });
  </script>
</body>
</html>