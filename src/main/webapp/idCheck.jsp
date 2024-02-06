<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 체크</title>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
function setIdText(){
	opener.document.getElementById("id").value = document.getElementById("idCheck").value;
	window.close();
}

$(document).ready(function () {
    var idCheckBool = false;

    $(".alert").hide();

    $("#idConfirm").click(function () { 
        var idCheck = $('#idCheck').val();
        if (idCheck.length < 5) {
            $('.alert').show();
        } else {
            $.ajax({
                url: './idCheck',
                type: 'post',
                dataType: 'text',
                data: {'idCheck': idCheck},
                success: function (result) {
                    if (result == 1) {
                        idCheckBool = false;
                        $("#idSelect").attr("disabled", "disabled");
                        $('.alert').html('<p class="alert">이미 만들어진 아이디입니다.</p>').show();
                        $('#idCheck').focus();
                    } else {
                        idCheckBool = true;
                        $("#idSelect").removeAttr("disabled");
                    }
                },
                error: function (request, status, error) {
                    alert("문제가 발생했습니다. 다시 접속해 주세요");
                }
            });
        }
    });
});
</script>
</head>
<body>
<h1>아이디 중복 체크</h1>
<div>
    <label for="idCheck">아이디:</label>
    <input type="text" id="idCheck" name="idCheck" placeholder="아이디">
    <button type="button" id="idConfirm">중복확인</button>
    <button type="button" id="idSelect" value="전달" onclick="setIdText()" disabled="disabled">아이디사용</button>
</div>
<div class="id-alert">
    <p class="alert">아이디: 사용할 수 없는 아이디입니다. 다른 아이디를 입력해 주세요.</p>
</div>
</body>
</html>
