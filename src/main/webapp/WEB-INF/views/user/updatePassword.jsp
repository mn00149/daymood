<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="/css/style.css">

<title>updatePassword</title>

</head>
<body>
	<div class="container">
		<form action="/login" id="form" class="form" method="post">
			<h2>Password 변경</h2>
			<h3>${username}</h3>
			<hr />

			<div class="form-control">
				<label for="password">현재 Password</label> <input name="password"
					type="password" id="password" placeholder="Enter Password">
				<small>Error Message</small>
			</div>

			<div class="form-control">
				<label for="password">New Password</label> <input name="password"
					type="password" id="newPassword" placeholder="Enter New Password">
				<small>Error Message</small>
			</div>

			<div class="form-control">
				<label for="password">Password 확인</label> <input name="password"
					type="password" id="confirmPassword" placeholder="Enter Password Again">
				<small>Error Message</small>
			</div>
			
			<button type="button" id="updatePassword">Password 변경</button>


		</form>
	</div>

</body>
 <script src="/js/updatePassword.js"></script>

</html>