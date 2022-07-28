<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <title>Document</title>
  <style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
@media (max-width: 1400px) {
	body {
    font-size: 1rem;
	}

  .container {
    width: 100%;
    margin: 0 auto;
  }
}

body {
  margin: 0;
  padding: 0;
  font-size: 14px;
  height: 100%;
  color:#28313b;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  font-family: 'Noto Sans KR', sans-serif;
}

.container {
  width: 1400px;
  margin: 0 auto;
  grid-template-columns: 3fr 1fr;
  grid-template-rows: 1fr auto;
  gap: 10px;
}

header {
  
  width: 1400;
  height: 80px;
  grid-column-start: 1;
  grid-column-end: 3;
  grid-row-start: 1;
  grid-row-end: 2;
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin: 20px 20px;
  backgorund-color:rgba(255, 55, 59, 0.7);
  background: radial-gradient(circle, rgba(238,174,202,1) 0%, rgba(148,187,233,1) 100%);
  border-bottom: 1px solid #c1c4c7;
  border-radius: 10px;
  box-sizing: border-box;
  padding: 0 70px;
}


#menu {
  list-style: none;
  display: flex;
  font-size: 16px;
  gap: 100px;
}

#menu>ul>li {
  padding-left: 5em;
}

#menu>li>a, #login>a{
  text-decoration: none;
  width: auto;
  color: rgb(0, 0, 0);
}

#menu>li>a:hover {
  transition: color 0.3s;
  color:#eee2de;
}

#login>a {
  padding-right: 15px;
  margin-right: 5px;
}

.footer {
  width: 100vw;
  height: 100px;
  background-color: #838383;
  position: absolute;
  bottom: 0;
  left: 0;
  padding: 0 25px;
  line-height: 60px;}
.container img {
	width : 200px;
	height : 58px;
	display: flex; 
	justify-content:center;
	flex-direction: column;
}

.logo {
	display:inline-block;
	vertical-align: middle;
}
.logo > a > img {
	max-width : 150px;
}
a {
	text-decoration:none;
	color: none;
}
  </style>

</head>
<body>
  <div class="container">
    <header>
    <div class="logo">
      <a href="/main"><img src="/images/daymood.png" alt="logo"></a>
	</div>
        <ul id="menu">
          <li><a href="#">Mood</a></li>
          <li><a href="#">Info</a></li>
          <li><a href="#">Recommend</a></li>
          <li><a href="#">Live Chat</a></li>
        </ul>

      <div id="login">
        <a href="loginForm">로그인</a>
        <a href="joinForm">회원가입</a>
      </div>
    </header>
  </div>

</body>
</html>