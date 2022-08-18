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

<title>회원 탈퇴</title>

</head>
<body>
	<div class="container">
		<form role="form" class="form" id="form">
			<h2>회원 탈퇴</h2>
			<h3>${username}님 </h3>
			<hr />
			<div class="form-control">
				<label for="username">Password</label> <input name="username" type="password" id="password" placeholder="Enter Password"> 
			</div>

			<button type="button" id="deleteUser">회원 탈퇴</button>
			<div class="text-center small mt-2" id="checkMsg" style="color: red"></div>
		</form>
		
	</div>

</body>

<script>


    $("#deleteUser").click(function () {
        let password = $("#password").val();

        $.ajax({
            type: "POST",
            url: "/user/deleteUser",
            data: {
                "password": password
            },
            success: function (res) {
            	if(res.result == "ok"){
            		alert(res.str)
            		location.href = "/logout"
            	}else{
            		alert(res.str)
            	}
            }
        })
    })
    
/*          $('#checkMsg').html('<p style="color:darkblue"></p>');
                } else {
                    $('#checkMsg').html('<p style="color:red">일치하는 정보가 없습니다.</p>'); */
</script>

</html>