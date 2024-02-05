<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 체크</title>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.7.1.min.js"></script>
</head>
<body>
 <h1>아이디 중복 체크</h1>
 	<div class="input-group mb-2" >
	    <label for="id">아이디:</label>
	    <input type="text" id="id" name="id" placeholder="아이디">
	    <button type="button" onclick="checkId()">중복 확인</button>
    </div>
    <div class="input-group mb-2 id-alert">
		<p class="alert">아이디: 사용할 수 없는 아이디입니다. 다른 아이디를 입력해 주세요.</p>
	</div>
	
<script type="text/javascript">
$(function (){
	$('.id-alert, .name-alert, .pw-alert').hide();
	
	$('#id').on("change keyup paste", function(){
		//alert("아이디입력창 값이 변경되었습니다.");
		$('.id-alert').show();
		$('.id-alert').html('<p class="alert">당신이 입력한 ID는 ' + $('#id').val() +  '</p>');
		if($('#id').val().length > 5){
			idCheck();
		}
	});
</script>	
</body>
</html>