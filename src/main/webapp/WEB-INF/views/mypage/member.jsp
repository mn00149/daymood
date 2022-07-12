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
}

.profile2 > .myinfo {
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

.mb_table {
  width: 100%;
  font-size: 13px;
  margin: 0;
  table-layout: auto;
  text-indent: initial;
  border-spacing: 3px;
  border-radius: 10px;
  background: #fff;
  border-collapse: collapse;
}

.mb_table th {
  width: 150px;
  padding: 15px;
  display: inline-block;
  text-align: center;
  border-bottom: 1px solid #eee;
  border-right: 1px solid #ddd;
}

.mb_table td {
  width: 100%;
  padding: 15px;
  color: #666;
  text-align: center;
  border-bottom: 1px solid #eee;
}

.mb_table tr:last-child td, .mb_table tr:last-child th {
  border-bottom: none;
}
  </style>
</head>

<body>
  <div id="content" class="ink_content" role="main">
    <div class="ink_member">
      <h1>
        íìíì´ì§
      </h1>
      <div class="bubble_wrap">
        <a href="header.html" class="bubble">
          <i class="fa-solid fa-backward" style="color: black;"></i>
        </a>
        <div class="ink_bubble">
          <div class="arrow"></div>
          ëìê°ê¸°
        </div>
      </div>
    </div>
    <div class="profile1">
      <div class="aa">
        <div class="imgprofile">ì´ë¯¸ì§</div>
        <div class="nickname">
          <a href="#">kafla</a>
        </div>
      </div>
      <div class="menu">
        <ul>
          <li><a href="#">ë¹ë°ë²í¸ ë³ê²½</a></li>
          <li><a href="#">íìì ë³´ ë³ê²½</a></li>
          <li><a href="#">íí´</a></li>
        </ul>
      </div>
    </div>
    <div class="profile2">
      <div class="myinfo">
        <ul>
          <li><a href="member.html">íìì ë³´</a></li>
          <li><a href="my_posted.html">ìì±ê¸</a></li>
          <li><a href="my_comment.html">ìì±ëê¸</a></li>
          <li><a href="my_scrap.html">ì¤í¬ë©</a></li>
          <li><a href="my_letter.html">ìª½ì§í¨</a></li>
        </ul>
      </div>
      <table class="mb_table">
        <tbody>
          <tr>
            <th>ìì´ë</th>
            <td>kafla1996</td>
          </tr>
          <tr>
            <th>ì´ë¦</th>
            <td>ìµì±ì§</td>
          </tr>
          <tr>
            <th>ëë¤ì</th>
            <td>kafla</td>
          </tr>
          <tr>
            <th>ì´ë©ì¼ ì£¼ì</th>
            <td>lewv1996@naver.com</td>
          </tr>
          <tr>
            <th>ë¸ë¡ê·¸</th>
            <td>â¦</td>
          </tr>
          <tr>
            <th>ì±ë³</th>
            <td>ë¨ì</td>
          </tr>
          <tr>
            <th>ìëª</th>
            <td>â¦</td>
          </tr>
          <tr>
            <th>íë¡í ì¬ì§</th>
            <td>â¦</td>
          </tr>
          <tr>
            <th>ì´ë¯¸ì§ ë§í¬</th>
            <td>â¦</td>
          </tr>
          <tr>
            <th>ê°ìì¼</th>
            <td class="text_en">2022.07.06. 17:37</td>
          </tr>
          <tr class="lastline">
            <th>ìµê·¼ ë¡ê·¸ì¸</th>
            <td class="text_en">2022.07.06. 13:05</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>


</body>

</html>