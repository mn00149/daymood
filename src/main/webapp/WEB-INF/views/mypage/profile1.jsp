<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
</head>
<body>
<div class="ink_member">
      <h1>
        회원페이지
      </h1>

    </div>
    <div class="profile1">
      <div class="aa">
        <div class="imgprofile"><img src="/images/daymood.png" /></div>
<%--         <div class="nickname">
          <a href="#">${dto.username}</a>
        </div> --%>
      </div>
      
      <ul class="tmenu">
      
                <div class="toggle"><ion-icon name="add"></ion-icon></div>
                <li style="--i:0;"><a href="my_posted"><ion-icon name="paper"></ion-icon></a></li>
                <li style="--i:1;"><a href="my_comment"><i class="fa-solid fa-comment-dots"></i></a></li>
                <li style="--i:2;"><a href="my_scrap"><i class="fa-solid fa-star"></i></a></li>
                <li style="--i:3;"><a href="my_letter"><i class="fa-solid fa-square-envelope"></i></a></li>
                <li style="--i:4;"><a href="my_friends"><i class="fa-solid fa-user-group"></i></a></li>
                <li style="--i:5;"><a href="request_friends"><i class="fa-solid fa-handshake"></i></a></li>
                
                <div class="indicator">

                </div>
            
            </ul>
      
      <div class="menu">
        <ul>
          <li><a href="#" style="text-decoration: none;">비밀번호 변경</a></li>
          <li><a href="#" style="text-decoration: none;">회원정보 변경</a></li>
          <li><a href="#" style="text-decoration: none;">탈퇴</a></li>
        </ul>
      </div>
    </div>
</body>

<script>
    let tmenuToggle = document.querySelector('.toggle');
    let tmenu = document.querySelector('.tmenu');
    tmenuToggle.onclick = function() {
        tmenu.classList.toggle('active')
        tmenuToggle.classList.toggle('active')
    }
    const list = document.querySelectorAll('.tmenu > li');
    function activeLink(){
        list.forEach( (item) =>
        item.classList.remove('active'));
        this.classList.add('active')
    }
    list.forEach((item)=>
    item.addEventListener('mouseover',activeLink))
</script>

</html>