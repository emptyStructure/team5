<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script type="text/javascript">
let openWin;

function openIdCheck() {
    // window.name = "부모창 이름"; 
    window.name = "join";
    
    // window.open("open할 window", "자식창 이름", "팝업창 옵션");
    openWin = window.open("./idCheck", "idCheck", "width=570, height=350, resizable = no, scrollbars = no");
    
    //아이디를 입력받으면 비활성화
    if (document.getElementById("id").value != ""){
		document.getElementById("id").disabled = true;
    } 
}

$(document).ready(function(){
	$('.inputPw1').next().click(function(){
		
		if($('#pw1').attr('type') == 'password'){
			$('#pw1').attr('type', 'text');
			$('.xi-eye-off-o').attr('class', 'xi-eye-o');			
		} else {
			$('#pw1').attr('type', 'password');
			$('.xi-eye-o').attr('class', 'xi-eye-off-o');
		}
		
	});
});
</script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<style type="text/css">

</style>    
</head>
<body>
    <h2>회원가입</h2>
    
    <form action="./join" method="post">
    <!-- 마무리 할때 required 쓰기 -->
    	
    	<div>
        <label for="id">아이디:</label>
        <input type="text" id="id" name="id" placeholder="아이디"  onclick="openIdCheck()">
        </div>
        
        <div class="name">
		<label class="input-group-text">이&ensp;&ensp;름</label> 
		<input type="text" id="name" name="name" placeholder="이름">
		</div>
        
        <div class="password">
        	<label for="password">비밀번호:</label>
       		<input type="password" id="pw1" name="pw1" class="inputPw1" placeholder="비밀번호">
        	<i class="xi-eye-off-o"></i>
    	</div>
    	
        <div class="password2">
	        <label for="password2">비밀번호 확인:</label>
	        <input type="password" id="pw2" name="pw2" class="inputPw2" placeholder="비밀번호 확인">
        </div>
        
        <label for="email">이메일:</label>
        <input type="email" id="email" name="email" placeholder="이메일주소(비밀번호 찾기 등 본인 확인용)" ><br>
        
        <button type="submit">가입하기</button>
    </form>
</body>
</html>
