<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script type="text/javascript">


$(document).ready(function() {
    // 아이디 입력란의 입력 이벤트 처리
    $('#id').on('input', function() {
        // 입력값이 5글자 이상인 경우에만 자동으로 비활성화
        if ($(this).val().length >= 5) {
            $(this).prop('disabled', true);
        }
    });
});


let openWin;

function openIdCheck() {
    // window.name = "부모창 이름"; 
    window.name = "join";
    
    // window.open("open할 window", "자식창 이름", "팝업창 옵션");
    openWin = window.open("./idCheck", "idCheck", "width=570, height=350, resizable = no, scrollbars = no");
    
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
    
    <form action="./join" method="post" onsubmit="return check()">
    <!-- 마무리 할때 required 쓰기 -->
    	
    	<div>
        <label for="id">아이디:</label>
        <input type="text" id="id" name="id" placeholder="아이디"  onclick="openIdCheck()" required>
        </div>
        
        <div class="name">
		<label class="input-group-text">이&ensp;&ensp;름</label> 
		<input type="text" id="name" name="name" placeholder="이름" required>
		</div>
        
        <div class="password">
        	<label for="password">비밀번호:</label>
       		<input type="password" id="pw1" name="pw1" class="inputPw1" placeholder="비밀번호" required>
        	<i class="xi-eye-off-o"></i>
    	</div>
    	
        <div class="password2">
	        <label for="password2">비밀번호 확인:</label>
	        <input type="password" id="pw2" name="pw2" class="inputPw2" placeholder="비밀번호 확인" required>
        </div>
        
        <label for="email">이메일:</label>
        <input type="email" id="email" name="email" placeholder="이메일주소(비밀번호 찾기 등 본인 확인용)" required><br>
        <div class="email-alert" id="emailMsg" style="display: none">이메일은</div>
        <div class="error_text item_style" id="pw1Msg" style="display: none">비밀번호는 4자리이상 입력해주세요.</div>
        
        <button type="submit">가입하기</button>
    </form>
</body>
</html>
