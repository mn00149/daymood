<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
  display: grid;
  grid-template-columns: 3fr 1fr;
  grid-template-rows: 1fr auto;
  gap: 10px;
}

header {
  
  height: 80px;
  grid-column-start: 1;
  grid-column-end: 3;
  grid-row-start: 1;
  grid-row-end: 2;
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin: 20px 20px;
  background-color: #c14c3d;
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
  line-height: 60px;
}

.logo {
	display:inline-block;
	vertical-align: middle;
}
.logo > img {
	max-width : 150px;
}
  </style>
</head>
<body>
  <div class="container">
    <header>
    <div class="logo">
      <img src="/images/daymood.png" alt="logo">
	</div>
        <ul id="menu">
          <li><a href="#">Mood</a></li>
          <li><a href="#">Info</a></li>
          <li><a href="#">Recommend</a></li>
          <li><a href="#">Live Chat</a></li>
        </ul>

      <div id="login">
        <a href="/mypage/member">로그인</a>
        <a href="#">회원가입</a>
      </div>
    </header>
  </div>

</body>
</html>