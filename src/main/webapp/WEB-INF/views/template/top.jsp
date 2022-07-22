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
  gap: 20px;
}

header {
<<<<<<< HEAD
  
=======
  width: 1400;
>>>>>>> b45528184596309a701a8733f701432ea53d727e
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
  margin-left: -120px;

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

<<<<<<< HEAD
.footer {
  width: 100vw;
  height: 100px;
  background-color: #838383;
  position: absolute;
  bottom: 0;
  left: 0;
  padding: 0 25px;
  line-height: 60px;
=======
.container img {
	width : 200px;
	height : 58px;
	display: flex; 
	justify-content:center;
	flex-direction: column;
>>>>>>> b45528184596309a701a8733f701432ea53d727e
}
  </style>
<!--     <script>
    $(function(){
        $.ajax({
            url: "/board/getAll",
            type: "GET",
            //data: JSON.stringify(),
            //contentType: "application/json; charset=utf-8;",
            dataType: "json",
            success: function(data){
            for (var i = 0; i < data.length; i++) {
            		$('#pmenu').append("<li><a href='/board/read/"+data[i].board_no+"'>"+ "</a></li>");
            }                  

            },
            error: function(request,status,error){
               alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
            }                
        });//ajax end
  });//페이지로딩
</script> -->
</head>
<body>
  <div class="container">
    <header>
    
      <h1><a href="/"><img src="/image/daymood_logo.png" alt="no image"></a></h1>

        <ul id="menu">
          <li><a href="/board/weather_list">mood</a></li>
          <li><a href="#">info</a></li>
          <li><a href="/board/recommend_list">recommend</a></li>
          <li><a href="#">chatting</a></li>
        </ul>

      <div id="login">
        <a href="#">로그인</a>
        <a href="#">회원가입</a>
      </div>
    </header>
  </div>

</body>
</html>