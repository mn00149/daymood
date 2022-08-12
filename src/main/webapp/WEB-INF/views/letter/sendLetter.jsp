<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>to:${recv_name}</h1>
<form action="/sendLetter" method="post">
<div class="content">
<input name="letterContent" type="text" id="letterContent" placeholder="Enter letter"></div>
<input name="recv_name" value="${recv_name}"  id="recv_name" hidden></div>
<button>Register</button>
</form>
</body>
</html>