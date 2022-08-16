<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<title>비밀번호 찾기</title>

</head>
<body>
	<div class="container">
		<form role="form" class="form" id="form">
			<h2>비밀번호 찾기</h2>
			<hr />
			<div class="form-control">
				<label for="username">Username</label> <input name="username" type="text" id="username" placeholder="Enter Username"> 
				<small>ErrorMessage</small>
			</div>
			<div class="form-control">
				<label for="email">Email</label> <input name="email" type="text" id="email" placeholder="Enter Email"> 
				<small>Error Message</small>
			</div>
			<button type="button" id="checkEmail">Register</button>
			<div class="text-center small mt-2" id="checkMsg" style="color: red"></div>
		</form>
		
	</div>

</body>

<script>


    $("#checkEmail").click(function () {
        let email = $("#email").val();
        let username = $("#username").val();

        $.ajax({
            type: "GET",
            url: "/check/findPw",
            data: {
                "email": email,
                "username": username
            },
            success: function (res) {
            	
                if (res['check']) {
                    swal("발송 완료!", "입력하신 이메일로 임시비밀번호가 발송되었습니다.", "success").then((OK) => {
                        if(OK) {
                            $.ajax({
                                type: "POST",
                                url: "/check/findPw/sendEmail",
                                contentType: 'application/json; charset=utf-8',
                                data:JSON.stringify({
                                    "email": email,
                                    "username": username
                                    
                                }),
                               /*  success: function(res){
                                	window.location = "/loginForm";
                                } */
                            })
                             window.location = "/loginForm"; 
                        }


                    }
                )
                    $('#checkMsg').html('<p style="color:darkblue"></p>');
                } else {
                    $('#checkMsg').html('<p style="color:red">일치하는 정보가 없습니다.</p>');
                }
            }
        })
    })
</script>

</html>