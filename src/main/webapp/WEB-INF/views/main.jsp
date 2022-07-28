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

<link rel="stylesheet" href="css/index_style.css" />
<script type="text/javascript">
	function Show(){
		document.getElementById("#service-menu-list").style.display="";
	}
	function Hide(){
		document.getElementById("service-menu-list").style.display = "none";
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
									<h2><a href="#" style="text-decoration : none;">인기 게시글</a></h2>
								</header>
                	<c:choose>
						<c:when test="${empty list}">
	 						<tr><td colspan='6'>등록된 글이 없습니다.</td></tr>
						</c:when>
						<c:otherwise>
						<c:forEach var="dto" items="${list2}">
								<ul class="libox">
                    			 <li class="title"> 
                    			  <a href="/board/read" style="text-decoration : none;">
                    				<div class=text_img_tool>
       							     <c:choose>
         							  <c:when test = "${dto.weather_category eq '맑음'}">
            							<div class="img1">
            								<img src="/images/sun.png" alt="no image">
            							</div> 
         							  </c:when>

         							  <c:when test = "${dto.weather_category eq '흐림'}">
            						 	<div class="img2">
            						 		<img src="/images/fog.png" alt="no image">
            						 	</div>
							          </c:when>
							
							          <c:when test = "${dto.weather_category eq '비'}">
							             <div class="img3">
							             	<img src="/images/rain.png" alt="no image">
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
									<h2><a href="#" style="text-decoration : none;">최근 게시글</a></h2>
								</header>
                	<c:choose>
						<c:when test="${empty list}">
	 						<tr><td colspan='6'>등록된 글이 없습니다.</td></tr>
						</c:when>
						<c:otherwise>
						<c:forEach var="dto" items="${list}">
								<ul class="libox">
                    			 <li class="title"> 
                    			  <a href="/board/read" style="text-decoration : none;">
                    				<div class=text_img_tool>
       							     <c:choose>
         							  <c:when test = "${dto.weather_category eq '맑음'}">
            							<div class="img1">
            								<img src="/images/sun.png" alt="no image">
            							</div> 
         							  </c:when>

         							  <c:when test = "${dto.weather_category eq '흐림'}">
            						 	<div class="img2">
            						 		<img src="/images/fog.png" alt="no image">
            						 	</div>
							          </c:when>
							
							          <c:when test = "${dto.weather_category eq '비'}">
							             <div class="img3">
							             	<img src="/images/rain.png" alt="no image">
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
									<h2><a href="#" style="text-decoration : none;">이 주의 추천..? 퇴근하고싶다</a></h2>
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
    <label class="quickmenubtn" for="check-btn" ><img class="quickbtn"src="https://user-images.githubusercontent.com/103401972/178628320-ea1e1a62-606d-48f6-aaf2-c590056d6edb.jpg"></label>
      <ul class="menubars">
          <li class="listbar">
          <a class="popup" onclick="window.open('chatbot','window_name','width=440,height=770,scrollbars=yes');">
          <span class="popupimg">
          	<img class="popimg" src="https://www.lge.co.kr/kr/support/images/icon/icon_customer-consultation.svg">
          </span>
          챗봇
          </a>
          </li>
          <li class="listbar">
          <a class="popup" onclick="window.open('letter','window_name','width=440,height=770,scrollbars=yes');">
          <span class="popupimg">
          	<img class="popimg" src="/images/letter.svg">
          </span>
          편지
          </a>
          </li>
      </ul>   


	</div>
</body>
</html>