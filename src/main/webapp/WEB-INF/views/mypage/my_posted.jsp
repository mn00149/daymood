<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="/css/member.css">

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
          <li><a href="member">회원정보</a></li>
          <li><a href="my_posted">작성글</a></li>
          <li><a href="my_comment">작성댓글</a></li>
          <li><a href="my_scrap">스크랩</a></li>
          <li><a href="my_letter">쪽지함</a></li>
        </ul>
    </div>
    <div class="posted">
        등록된 글이 없습니다.
    </div>
    </div>
  </div>


</body>

</html>