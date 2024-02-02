<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
function idCheck(){
	
	 $(document).ready(function() {
	        $(".btn_show").click(function() {
	            var passwordInput = $(this).parents(".form_item").find(".input");

	            if (passwordInput.attr("type") === "password") {
	                // 비밀번호 표시
	                passwordInput.attr("type", "text");
	            } else {
	                // 비밀번호 숨김
	                passwordInput.attr("type", "password");
	            }

	            // 버튼 텍스트 업데이트
	            var buttonText = ($(".").hasClass("hide")) ? "비밀번호 보기" : "비밀번호 숨기기";
	            $(this).children(".blind").text(buttonText);

	            // 버튼 상태 토글
	            $(this).toggleClass("hide");
	        });
	    });
	
	
	
	//alert('id검사를 눌렀습니다');
	let id = $('#id').val();
	const regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"\sㄱ-ㅎㅏ-ㅣ가-힣]/g;//한글+공백
	//alert(regExp.test(id)); // 한글,공백 포함여부 검사하는 정규식
	//나중에는 영어 소문자, 숫자만
	/* const regExp = /^[a-z0-9]{5,15}$/; */
	if(id.length < 5 || regExp.test(id)){
		alert("아이디는 영문자 5글자 이상이고 특수문자가 없어야합니다.");
		$('.id-alert').html('<p class="alert">아이디는 영문자 5글자 이상이고 특수문자가 없어야합니다.</p>')
		$('#id').focus();
	} else {
		//AJAX = 1페이징, 2AJAX, 3파일업로드
		$.ajax({
			url : './idCheck',			//이동할 주소
			type : 'post',				//post / get
			dataType : 'text',			//수신 타입
			data : {'id' : id},			//보낼 값
			success : function(result){	//성공시
				//alert("통신에 성공했습니다");
				if(result == 1){
					//alert("이미 가입되어있습니다.");
					$('.id-alert').append('<p class="alert">이미 가입되어있습니다.</p>');
					idCheckBool = false;
					$("#joinBtn").attr("disabled", "disabled");//비활성화 시키기
					$('#id').focus();
				} else {
					//alert("가입할 수 있습니다. 다음을 계속 진행하세요.");
					$('.id-alert').append('<p class="alert">가입할 수 있습니다.</p>');
					$('.id-alert .alert').css("color","green");
					idCheckBool = true;
					$("#joinBtn").removeAttr("disabled");//비활성화 제거하기 = 활성화 시키기
					//$('#name').focus();
				}
			},
			error : function(request, status, error){//접속불가, 문제발생 등
				alert("문제가 발생했습니다");
			}
		});
	}
	return false;
}
</script>    
</head>
<body>
    <h2>회원가입</h2>
    
    <form action="./join" method="post">
    <!-- 마무리 할때 required 쓰기 -->
        <label for="username">아이디:</label>
        <input type="text" id="id" name="id" placeholder="아이디" ><br>
        
        <div class="input-group mb-2">
		<label class="input-group-text">이&ensp;&ensp;름</label> 
		<input type="text" id="name" name="name" class="form-control" placeholder="이름">
		</div>
        
        <div class="form_password">
        	<label for="password">비밀번호:</label>
       		<input type="password" id="password" name="password" class="inputpw" placeholder="비밀번호">
        	<button class="btn_show"><span class="blind">비밀번호 보기</span></button>
    	</div>
        
        <label for="confirmPassword">비밀번호 확인:</label>
        <input type="password" id="password2" name="pw2" placeholder="비밀번호 확인"><br>
        
        <label for="email">이메일:</label>
        <input type="email" id="email" name="email" placeholder="이메일주소(비밀번호 찾기 등 본인 확인용)" ><br>
        
        <button type="submit">가입하기</button>
    </form>
</body>
</html>
