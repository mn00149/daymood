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
  <script src="https://code.jquery.com/jquery-2.2.4.js" integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI=" crossorigin="anonymous"></script>
  <script type="text/javascript" src="/js/member_img.js" defer></script>
  <link rel="stylesheet" href="/css/member.css">
  <link rel="stylesheet" href="/css/boardProfile.css">
  <style type="text/css">
  .req-btn-container{
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%);
    -webkit-transform: translate(-50%);
    -moz-transform: translate(-50%);
    -ms-transform: translate(-50%);
    -o-transform: translate(-50%);
}

.req-btn {
    background-color: #00bba9;
    border: transparent;
    border-radius: 10px;
    -webkit-border-radius:10px;
    -moz-border-radius:10px;
    -ms-border-radius:10px;
    -o-border-radius:10px;
/*     padding: 15px;
    font-size: 120%;
    width: 300px; */
    color: #fff;
    cursor: pointer;
    transition: 0.3s;
    -webkit-transition: 0.3s;
    -moz-transition: 0.3s;
    -ms-transition: 0.3s;
    -o-transition: 0.3s;
}

.req-btn:hover{
    opacity: 0.6;
}
.liborder {
    border : 1px solid rgb(6, 210, 224);
    border-radius: 5px;
    padding: 2px;
}

.ulimg {
    list-style: none;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 5px;
    flex-wrap: wrap;
}
.ulimg li {
    margin: 10px;
}

#update {

    color: #222327;
    margin-top: 10px;
    background-color: skyblue;

}
  </style>
</head>

<body>

  <div id="content" class="ink_content" role="main">
    <jsp:include page="profile1.jsp"> 
    <jsp:param value="${dto.user_image }" name="user_image"/>
    </jsp:include>
    <input type="hidden" id="user_no" value="${dto.user_no }">
    <input type="hidden" id="user_image" class="user_image" value="${dto.user_image }">
    
    <div class="profile2">
      <div class="myinfo">
        <ul>
          <li><a href="member" style="text-decoration: none;">회원정보</a></li>
          <li><a href="my_posted" style="text-decoration: none;">작성글</a></li>
          <li><a href="my_comment" style="text-decoration: none;">작성댓글</a></li>
          <li><a href="my_scrap" style="text-decoration: none;">스크랩</a></li>
          <li><a href="my_letter" style="text-decoration: none;">쪽지함</a></li>
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
            <td><span name="nation">${dto.nation }</span></td>
          </tr>

          <tr>
            <th>가입일</th>
            <td class="text_en">${dto.createDate }</td>
          </tr>
          <tr>
            <th>
            프로필 사진
            <button type="button" class="req-btn" style="width:auto">
              <span>♣</span>
              </button>
            </th>
            <td id="preivew"><img class="user_image" name="user_image" src="${dto.user_image }" style="width: 50px; height: 50px"></td>
          </tr>


        </tbody>
      </table>
    </div>
    <div style=" justify-content: center; align-items: center; display: flex;">    
      <button id="update">수정</button>
    </div>
      
      
  </div>

   <div class="popup-overlay">
    <div class="popup-box-container" style="overflow-y: auto;">

        <div class="popup-message-container">
            <h1>프로필 사진</h1>
            <ul class="ulimg">
                <li class="my" ><img src="/image/sun.png" style="width: 50px; height: 50px"></li>
                <li class="my"><img src="/image/cloudy.png" style="width: 50px; height: 50px"></li>
                <li class="my"><img src="/image/fog.png" style="width: 50px; height: 50px"></li>
                <li class="my"><img src="/image/recommend/book.png" style="width: 50px; height: 50px"></li>
            </ul>
        </div>
        <button class="ok-btn">
            <span>확인</span>
        </button>
        <button class="no-btn">
            <span>취소</span>
        </button>
    </div>
</div>

</body>

</html>