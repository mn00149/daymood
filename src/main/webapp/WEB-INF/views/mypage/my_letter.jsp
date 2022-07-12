<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  
  <style>
    @keyframes bubbleMovement {
  from { top: 50px ; }
  to   { top: 40px; }
}

* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

body {
  background-color: rgb(243, 241, 241);;
}

a:visited {text-decoration: none;}

a{
  color:black;
  text-decoration: none;
}

ul {
  list-style: none;
}

.ink_content {
  width: 930px;
  margin: 0 auto;
}

.ink_member {
  width: 100%;
  height: 50px;
  display: flex;
  align-items: center;
  gap: 30px;
}

.ink_member>h1 {
  font-size: 20px;
}

h1 {
  font-weight: normal;
  height: 40px;
  line-height: 40px;
}

.bubble_wrap {
  position: relative;
  width: 26px;
}

.bubble {
  background-color: #FFF;
  width: 26px;
  height: 26px;
  line-height: 30px;
  border-radius: 50%;
  text-align: center;
  border: 1px solid black;
  display: flex;
  justify-content: center;
  align-items: center;
}

.ink_bubble {
  background-color: #222;
  width: 100px;
  height: 20px;
  border-radius: 5px;
  color: #fff;
  text-align: center;
  line-height: 20px;
  position: absolute;
  left: -37px;
  top: 40px;
  animation: bubbleMovement 1s;
  display: none;
}

.arrow {
  width: 0;
  height: 0;
  border: 10px solid #222;
  border-color: transparent transparent #222 transparent;
  position: absolute;
  top: -20px;
  left: 40px;
}

.profile1 {
  display: flex;
  width: 100%;
  height: 100px;
  justify-content: space-between;
  align-items: center;
}

.profile1 > div{
  display: flex;
  width: 33.33%;
  padding: 20px;
  vertical-align: middle;
}

.aa > div {
  width: 60px;
  height: 60px;
  display: flex;
  justify-content: center;
  align-items: center;
}

.imgprofile {
  background-color: #d4e9df;
  position: relative;
  border-radius: 50%;
  overflow: hidden;
}

.menu {
  text-align: justify;
  justify-content: flex-end;
}

.profile2 {
  border-radius: 20px;
  background-color: #FFF;
  display: flex;
  flex-wrap: wrap;
  margin-top: 10px;
}

.myinfo {
  width: 100%;
  background-color: #f7f7f7;
  border-radius: 15px 15px 0 0;
  font-size: 15px;
  padding: 10px;
}

.myinfo > ul {
  display: flex;
  width: 100%;
  font-size: 20px;
  justify-content: space-around;
}


.letter {
    width: 100%;
    padding: 50px 0;
    text-align: center;
    background-color: #FFF;
    border-radius: 0px 0px 15px 15px;
}
  </style>
</head>

<body>
  <div id="content" class="ink_content" role="main">
    <div class="ink_member">
      <h1>
        회원페이지
      </h1>
      <div class="bubble_wrap">
        <a href="header.html" class="bubble">
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
          <a href="#">kafla</a>
        </div>
      </div>
      <div class="menu">
        <ul>
          <li>비밀번호 변경</li>
          <li>회원정보 변경</li>
          <li>탈퇴</li>
        </ul>
      </div>
    </div>
    <div class="profile2">
      <div class="myinfo">
        <ul>
          <li><a href="member.html">회원정보</a></li>
          <li><a href="my_posted.html">작성글</a></li>
          <li><a href="my_comment.html">작성댓글</a></li>
          <li><a href="my_scrap.html">스크랩</a></li>
          <li><a href="my_letter.html">쪽지함</a></li>
        </ul>
    </div>
    <div class="letter">
        쪽지 없음
    </div>
    </div>
  </div>


</body>

</html>