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

body {
  margin: 0;
  padding: 0;
  font-size: 14px;
  height: 1000px;
  color:#28313b;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  font-family: 'Noto Sans KR', sans-serif;
}
.container {
  width: 1400px;

}

header {
  width: 100%;
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


ul {
  list-style: none;
  display: flex;
  font-size: 16px;
  gap: 20px;

}
ul>li {
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
  </style>
</head>
<body>
  <div class="container">
    <header>
    
      <h1>로고</h1>

        <ul id="menu">
          <li><a href="#">게시판1</a></li>
          <li><a href="#">게시판2</a></li>
          <li><a href="#">게시판3</a></li>
          <li><a href="#">게시판4</a></li>
        </ul>

      <div id="login">
        <a href="#">로그인</a>
        <a href="#">회원가입</a>
      </div>
    </header>
  </div>
</div>

</body>
</html>