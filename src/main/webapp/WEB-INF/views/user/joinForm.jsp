<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/style.css">
    <title>Form Validator</title>
    
</head>
<body>
    <div class="container">
        <form action="/join" method="post" class="form" id="form">
            <h2>Sign Up</h2>
            <hr/>
            <div class="form-control">
                <label for="username">Username</label>
                <input name="username" type="text" id="username" placeholder="Enter Username">
                <input type="button" value="Username Check" class="btn btn-default col-sm-2" id="checkUsername" >
                <small>Error Message</small>
            </div>
            <div class="form-control">
                <label for="email">Email</label>
                <input name="email" type="text" id="email" placeholder="Enter Email">
				<input type="button" value="Email Check" class="btn btn-default col-sm-2" id="checkEmail" >
                <small>Error Message</small>
            </div>
            <div class="form-control">
                <label for="password">Password</label>
                <input name="password" type="password" id="password" placeholder="Enter Password">
                <small>Error Message</small>
            </div>
            <div class="form-control">
                <label for="password2">Confirm Password</label>
                <input type="password" id="confirmpassword" placeholder="Enter Password again">
                <small>Error Message</small>
            </div>
            <div class="form-control">
                <label for="exampleFormControlSelect1">nation</label>
                <select name="nation"  id="exampleFormControlSelect1">
                  <option>기타</option>
                  <option>미국</option>
                  <option>일본</option>
                  <option>중국</option>
                  <option>캐나다</option>
                  <option>호주</option>
                  <option>유럽</option>
                </select>
              </div>
            <button>Register</button>
            <a href="/loginForm">로그인창으로 이동</a>
        </form>
        
    </div>
 <script src="/js/script.js"></script>
</body>
   
</html>