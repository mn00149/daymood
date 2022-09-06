<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<link rel="stylesheet" href="/css/style.css">
<title>Form Validator</title>
</head>
<body>
	<div class="container">
		<form action="/login" id="form" class="form" method="post">
			<h2>Login</h2>
			<hr />

			<div class="form-control">
				<label for="username">Username</label> <input name="username"
					type="text" id="username" placeholder="Enter Username"> <small>Error
					Message</small>
			</div>
			<div class="form-control">
				<label for="password">Password</label> <input name="password"
					type="password" id="password" placeholder="Enter Password">
				<small>Error Message</small>
				<c:if test="${not empty error}">
					<p id="valid" class="alert alert-danger">${exception}</p>
				</c:if>
			</div>

			<button>Login</button>
			<div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark">
				<a href="/oauth2/authorization/google"><img
					src="../image/google.png" alt=""></a>
			</div>
			<div id="my-signin2"></div>

			<button type="button" onclick="location.href='/joinForm';">
				Sign Up</button>
				
			<button type="button" onclick="location.href='/findPassword';">
				Find Password</button>


			<!-- <a href="#"><img src="../image/kakao_login_large_wide.png" alt=""></a> -->
		</form>
	</div>

</body>
</html>