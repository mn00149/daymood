<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
    
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
          <li><a href="#">비밀번호 변경</a></li>
          <li><a href="#">회원정보 변경</a></li>
          <li><a href="#">탈퇴</a></li>
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
      <table class="mb_table">
        <tbody>
          <tr>
            <th>아이디</th>
            <td>${dto.email}</td>
          </tr>
          <tr>
            <th>이름</th>
            <td>${dto.username}</td>
          </tr>
          <tr>
            <th>국가</th>
            <td>${dto.nation }</td>
          </tr>
          <tr>
            <th>ROLE</th>
            <td>${dto.role }</td>
          </tr>
          <tr>
            <th>블로그</th>
            <td>…</td>
          </tr>
          <tr>
            <th>성별</th>
            <td>남자</td>
          </tr>
          <tr>
            <th>서명</th>
            <td>…</td>
          </tr>
          <tr>
            <th>프로필 사진</th>
            <td>…</td>
          </tr>
          <tr>
            <th>이미지 마크</th>
            <td>…</td>
          </tr>
          <tr>
            <th>가입일</th>
            <td class="text_en">${dto.createDate }</td>
          </tr>
          <tr class="lastline">
            <th>최근 로그인</th>
            <td class="text_en">2022.07.06. 13:05</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>


</body>

</html>