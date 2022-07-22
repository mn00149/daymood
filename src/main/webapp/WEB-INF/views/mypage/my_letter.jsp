<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지함</title>
<link rel="stylesheet" href="/css/member.css">
</head>
<body>
<div id="content" class="ink_content" role="main">
    <%@ include file="profile1.jsp" %>
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
    <div class="letter">
        쪽지 없음
    </div>
    </div>
  </div>
</body>
</html>