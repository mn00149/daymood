<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="util" uri="/ELFunctions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>DayMood</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/css/reply_number.css">
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
	$("#popupletter").on("click",funtion({
		alert("로그인")
	})


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
									<h2>
										<a id="atag" href="#"
											style="color: #958CC3; text-decoration: none;">인기 게시글</a>
									</h2>
								</header>
								<c:choose>
									<c:when test="${empty list}">
										<tr>
											<td colspan='6'>등록된 글이 없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="dto" items="${list2}">
											<ul class="libox">
												<li class="title"><a href="/board/read/${dto.board_no}"
													style="text-decoration: none;">
														<div class=text_img_tool>
															<c:choose>

																<c:when test="${dto.weather_category eq '맑음'}">
																	<div class="img1">
																		<img class="img1" src="/images/sunny.png"
																			alt="no image">
																	</div>
																</c:when>

																<c:when test="${dto.weather_category eq '흐림'}">
																	<div class="img1">
																		<img class="img1" src="/images/cloudy.png"
																			alt="no image">
																	</div>
																</c:when>

																<c:when test="${dto.weather_category eq '비'}">
																	<div class="img1">
																		<img class="img1" src="/images/rainy.png"
																			alt="no image">
																	</div>
																</c:when>

																<c:when test="${dto.info_category eq '미국'}">
																	<div class="img1">
																		<img class="img1" src="/image/nation/america.png"
																			alt="no image">
																	</div>
																</c:when>

																<c:when test="${dto.info_category eq '중국'}">
																	<div class="img1">
																		<img class="img1" src="/image/nation/china.png"
																			alt="no image">
																	</div>
																</c:when>

																<c:when test="${dto.info_category eq '캐나다'}">
																	<div class="img1">
																		<img class="img1" src="/image/nation/canada.png"
																			alt="no image">
																	</div>
																</c:when>

																<c:when test="${dto.info_category eq '호주'}">
																	<div class="img1">
																		<img class="img1" src="/image/nation/australia.png"
																			alt="no image">
																	</div>
																</c:when>

																<c:when test="${dto.info_category eq '일본'}">
																	<div class="img1">
																		<img class="img1" src="/image/nation/japan.png"
																			alt="no image">
																	</div>
																</c:when>

																<c:when test="${dto.info_category eq '유럽'}">
																	<div class="img1">
																		<img class="img1" src="/image/nation/europe.png"
																			alt="no image">
																	</div>
																</c:when>

																<c:when test="${dto.info_category eq '기타'}">
																	<div class="img1">
																		<img class="img1" src="/image/nation/etc.png"
																			alt="no image">
																	</div>
																</c:when>

																<c:when test="${dto.recommend_category eq '영화'}">
																	<img class="img1" src="/image/recommend/video.png"
																		alt="no image">
																</c:when>

																<c:when test="${dto.recommend_category eq '도서'}">
																	<div class="img1">
																		<img class="img1" src="/image/recommend/book.png"
																			alt="no image">
																	</div>
																</c:when>

																<c:when test="${dto.recommend_category eq '음악'}">
																	<div class="img1">
																		<img class="img1" src="/image/recommend/music.png"
																			alt="no image">
																	</div>
																</c:when>

															</c:choose>
															<div class="tit">${dto.title }
																<%-- 댓글 갯수 보이기 시작 --%>
																<c:set var="rcount"
																	value="${util:rcount(dto.board_no,rservice) }" />
																<c:if test="${rcount>0 }">
																	<span class="badge">${rcount}</span>
																</c:if>
																<%-- 댓글 갯수 보이기 끝 --%>
															</div>
														</div>
												</a></li>
											</ul>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<!-- box end -->
					</div>
					<div class="col-4 col-12-medium">

						<!-- Box -->
						<div class="box feature">
							<a href="#" class="featured"></a>
							<div class="inner2">
								<header class="innerheader">
									<h2>
										<a id="atag" href="/board/weather_list"
											style="color: #958CC3; text-decoration: none;">최근 게시글</a>
									</h2>
								</header>
								<c:choose>
									<c:when test="${empty list}">
										<tr>
											<td colspan='6'>등록된 글이 없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="dto" items="${list}">
											<ul class="libox">
												<li class="title"><a href="/board/read/${dto.board_no}"
													style="text-decoration: none;">
														<div class=text_img_tool>
															<c:choose>

																<c:when test="${dto.weather_category eq '맑음'}">
																	<div class="img1">
																		<img class="img1" src="/images/sunny.png"
																			alt="no image">
																	</div>
																</c:when>

																<c:when test="${dto.weather_category eq '흐림'}">
																	<div class="img1">
																		<img class="img1" src="/images/cloudy.png"
																			alt="no image">
																	</div>
																</c:when>

																<c:when test="${dto.weather_category eq '비'}">
																	<div class="img1">
																		<img class="img1" src="/images/rainy.png"
																			alt="no image">
																	</div>
																</c:when>

																<c:when test="${dto.info_category eq '미국'}">
																	<div class="img1">
																		<img class="img1" src="/image/nation/america.png"
																			alt="no image">
																	</div>
																</c:when>

																<c:when test="${dto.info_category eq '중국'}">
																	<div class="img1">
																		<img class="img1" src="/image/nation/china.png"
																			alt="no image">
																	</div>
																</c:when>

																<c:when test="${dto.info_category eq '캐나다'}">
																	<div class="img1">
																		<img class="img1" src="/image/nation/canada.png"
																			alt="no image">
																	</div>
																</c:when>

																<c:when test="${dto.info_category eq '호주'}">
																	<div class="img1">
																		<img class="img1" src="/image/nation/australia.png"
																			alt="no image">
																	</div>
																</c:when>

																<c:when test="${dto.info_category eq '일본'}">
																	<div class="img1">
																		<img class="img1" src="/image/nation/japan.png"
																			alt="no image">
																	</div>
																</c:when>

																<c:when test="${dto.info_category eq '유럽'}">
																	<div class="img1">
																		<img class="img1" src="/image/nation/europe.png"
																			alt="no image">
																	</div>
																</c:when>

																<c:when test="${dto.info_category eq '기타'}">
																	<div class="img1">
																		<img class="img1" src="/image/nation/etc.png"
																			alt="no image">
																	</div>
																</c:when>

																<c:when test="${dto.recommend_category eq '영화'}">
																	<img class="img1" src="/image/recommend/video.png"
																		alt="no image">
																</c:when>

																<c:when test="${dto.recommend_category eq '도서'}">
																	<div class="img1">
																		<img class="img1" src="/image/recommend/book.png"
																			alt="no image">
																	</div>
																</c:when>

																<c:when test="${dto.recommend_category eq '음악'}">
																	<div class="img1">
																		<img class="img1" src="/image/recommend/music.png"
																			alt="no image">
																	</div>
																</c:when>

															</c:choose>
															<div class="tit">${dto.title }
																<%-- 댓글 갯수 보이기 시작 --%>
																<c:set var="rcount"
																	value="${util:rcount(dto.board_no,rservice) }" />
																<c:if test="${rcount>0 }">
																	<span class="badge">${rcount}</span>
																</c:if>
																<%-- 댓글 갯수 보이기 끝 --%>
															</div>

														</div>
												</a></li>
											</ul>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<!-- box end -->
					</div>
					<div class="col-4 col-12-medium">

						<!-- Box -->
						<div class="box feature">
							<a href="#" class="featured"></a>
							<div class="inner2">
								<header class="innerheader">
									<h2>
										<a id="atag" href="/board/weather_list"
											style="color: #958CC3; text-decoration: none;">영화 <%-- 댓글 갯수 보이기 시작 --%>
											<c:set var="rcount"
												value="${util:rcount(dto.board_no,rservice) }" /> <c:if
												test="${rcount>0 }">
												<span class="badge">${rcount}</span>
											</c:if> <%-- 댓글 갯수 보이기 끝 --%></a>
									</h2>
								</header>
								<c:choose>
									<c:when test="${empty movielist}">
										<tr>
											<td colspan='6'>등록된 글이 없습니다.</td>
										</tr>
									</c:when>


								</c:choose>
							</div>
						</div>
						<!-- box end -->
					</div>

					<div class="col-4 col-12-medium">
						<!-- Box -->
						<div class="box feature">
							<a href="#" class="featured"></a>
							<div class="inner2">
								<header class="innerheader">
									<h2>
										<a id="atag" href="/board/weather_list"
											style="color: #958CC3; text-decoration: none;">도서 <%-- 댓글 갯수 보이기 시작 --%>
											<c:set var="rcount"
												value="${util:rcount(dto.board_no,rservice) }" /> <c:if
												test="${rcount>0 }">
												<span class="badge">${rcount}</span>
											</c:if> <%-- 댓글 갯수 보이기 끝 --%></a>
									</h2>
								</header>
								<c:choose>
									<c:when test="${empty booklist}">
										<tr>
											<td colspan='6'>등록된 글이 없습니다.</td>
										</tr>
									</c:when>


								</c:choose>
							</div>
						</div>
						<!-- box end -->
					</div>


				</div>
			</div>
		</div>
		<input id="check-btn" type="checkbox" /> <label class="quickmenubtn"
			for="check-btn"><img class="quickbtn"
			src="https://cdn.discordapp.com/attachments/991610192431161384/1007543710571057213/logo_pic.png"></label>

		<ul class="menubars">
			<li class="listbar"><a class="popup"
				onclick="window.open('chatbot','window_name','width=435,height=714,scrollbars=yes');">
					<span class="popupimg"> <img class="popimg"
						src="https://www.lge.co.kr/kr/support/images/icon/icon_customer-consultation.svg">
				</span> 챗봇
			</a></li>
			<li class="listbar"><a class="popup" id="popupletter"
				onclick="window.open('letter_list','window_name','width=971,height=624,top=300,,scrollbars=yes');">
					<span class="popupimg2"> <img class="popimg"
						src="/images/letter.svg">
				</span> 쪽지
			</a></li>
		</ul>


	</div>
</body>
</html>