<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script>
</head>
<body>
<div class="ink_member">
      <h1>
        회원페이지
      </h1>
      <div class="bubble_wrap">
        <a href="/" class="bubble">
          <i class="fa-solid fa-backward" style="color: black;"></i>
        </a>
        <div class="ink_bubble">
          <div class="arrow"></div>
          돌아가기
        </div>
      </div>
    </div>
    <div class="profile1">
      <div class="aa">
        <div class="imgprofile">이미지</div>
        <div class="nickname">
          <a href="#">${dto.username}</a>
        </div>
      </div>
      
      <ul class="tmenu">
                <div class="toggle"><ion-icon name="add"></ion-icon></div>
                <li style="--i:0;" class="active"><a href="#"><ion-icon name="contact"></ion-icon></a></li>
                <li style="--i:1;"><a href="#"><ion-icon name="paper"></ion-icon></a></li>
                <li style="--i:2;"><a href="#"><i class="fa-solid fa-comment-dots"></i></a></li>
                <li style="--i:3;"><a href="#"><i class="fa-solid fa-star"></i></a></li>
                <li style="--i:4;"><a href="#"><i class="fa-solid fa-square-envelope"></i></a></li>
                <li style="--i:5;"><a href="#"><i class="fa-solid fa-user-group"></i></a></li>
                <li style="--i:6;"><a href="#"><i class="fa-solid fa-handshake"></i></a></li>
                
                <div class="indicator">

                </div>
            
            </ul>
      
      <div class="menu">
        <ul>
          <li><a href="#">비밀번호 변경</a></li>
          <li><a href="#">회원정보 변경</a></li>
          <li><a href="#">탈퇴</a></li>
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
    const list = document.querySelectorAll('li');
    function activeLink(){
        list.forEach( (item) =>
        item.classList.remove('active'));
        this.classList.add('active')
    }
    list.forEach((item)=>
    item.addEventListener('click',activeLink))
</script>

</html>