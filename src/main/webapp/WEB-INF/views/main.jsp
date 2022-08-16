<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="util" uri="/ELFunctions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>DayMood</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />

<link rel="stylesheet" href="/css/index_style.css" />

<script type="text/javascript">
	function Show(){
		document.getElementById("#service-menu-list").style.display="";
	}
	function Hide(){
		document.getElementById("service-menu-list").style.display = "none";
	}
	function read(board_no) {
		let url = 'board/read/' + board_no;
		url += "?nowPage=${nowPage}";
		url += "&col=${col}";
		url += "&word=${word}";
		location.href = url;
	}
</script>
</head>
<body class="is-preload homepage">

	<div id="page-wrapper">


		<!-- Features -->
		<div id="features-wrapper">
			<div class="container">
				<div class="row">
						<div class="col-4 col-12-medium">
						<!-- Box -->
						<div class="box feature">
							<a href="#" class="featured"></a>
							<div class="inner2">
								<header class="innerheader">
									<h2 style="color:#958CC3;">인기 게시글</a></h2>
								</header>
                	<c:choose>
						<c:when test="${empty list}">
	 						<tr><td colspan='6'>등록된 글이 없습니다.</td></tr>
						</c:when>
						<c:otherwise>
						<c:forEach var="dto" items="${list2}">
								<ul class="libox">
                    			 <li class="title"> 
                    			  <a href="/board/read/${dto.board_no}" style="text-decoration : none;">
                    				<div class=text_img_tool>
       							     <c:choose>
         							  <c:when test = "${dto.weather_category eq '맑음'}">
            							<div class="img1">
            								<img class="img1" src="/images/sun.png" alt="no image">
            							</div> 
         							  </c:when>

         							  <c:when test = "${dto.weather_category eq '흐림'}">
            						 	<div class="img2">
            						 		<img class="img2" src="/images/fog.png" alt="no image">
            						 	</div>
							          </c:when>
							
							          <c:when test = "${dto.weather_category eq '비'}">
							             <div class="img3">
							             	<img class="img3" src="/images/rain.png" alt="no image">
							             </div>  
							          </c:when>
							         </c:choose> 
							         <div class="tit">${dto.title }</div>
                    				</div>
                    			  </a>
                    			 </li>
                    			</ul>
							</c:forEach>
						</c:otherwise>
					</c:choose>
						</div>
					</div><!-- box end -->
				</div>
					<div class="col-4 col-12-medium">

						<!-- Box -->
						<div class="box feature">
							<a href="#" class="featured"></a>
							<div class="inner2">
								<header class="innerheader">
									<h2 style="color:#958CC3;">최근 게시글</a></h2>
								</header>
                	<c:choose>
						<c:when test="${empty list}">
	 						<tr><td colspan='6'>등록된 글이 없습니다.</td></tr>
						</c:when>
						<c:otherwise>
						<c:forEach var="dto" items="${list}">
								<ul class="libox">
                    			 <li class="title"> 
                    			  <a href="javascript:read('${dto.board_no}')" style="text-decoration : none;">
                    				<div class=text_img_tool>
       							     <c:choose>
         							  <c:when test = "${dto.weather_category eq '맑음'}">
            							<div class="img1">
            								<img class="img1" src="/images/sun.png" alt="no image">
            							</div> 
         							  </c:when>

         							  <c:when test = "${dto.weather_category eq '흐림'}">
            						 	<div class="img2">
            						 		<img class="img2" src="/images/fog.png" alt="no image">
            						 	</div>
							          </c:when>
							
							          <c:when test = "${dto.weather_category eq '비'}">
							             <div class="img3">
							             	<img class="img3" src="/images/rain.png" alt="no image">
							             </div>  
							          </c:when>
							         </c:choose> 
							         <div class="tit">${dto.title }</div>
                    				</div>
                    			  </a>
                    			 </li>
                    			</ul>
							</c:forEach>
						</c:otherwise>
					</c:choose>
						</div>
					</div><!-- box end -->
				</div>
					<div class="thisweek">
						<!-- Box -->
						<div class="box feature">
							<a href="#" class="featured"></a>
							<div class="inner4">
								<header class="innerheader">
									<h2 style="color:#958CC3;">이 주의 추천</a></h2>
								</header>
							<div class="recolist">

							</div>
							</div>
						</div>
					</div>
			</div>
		</div>
	</div>
    <input id="check-btn" type="checkbox" />
	<label class="quickmenubtn" for="check-btn" ><img class="quickbtn"src="https://cdn.discordapp.com/attachments/991610192431161384/1007543710571057213/logo_pic.png"></label>      
      <ul class="menubars">
          <li class="listbar">
          <a class="popup" onclick="window.open('chatbot','window_name','width=435,height=714,scrollbars=yes');">
          <span class="popupimg">
          	<img class="popimg" src="/images/chatbot.png">
          </span>
          챗봇
          </a>
          </li>
          <li class="listbar">
          <a class="popup" onclick="window.open('letter_list','window_name','width=971,height=624,scrollbars=yes resizable=no location=no');">
          <span class="popupimg2">
          	<img class="popimg" src="/images/letter.svg">
          </span>
          쪽지
          </a>
          </li>
      </ul>   
	

	</div>
</body>
</html>