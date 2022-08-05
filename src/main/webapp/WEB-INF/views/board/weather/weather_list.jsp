<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="util" uri="/ELFunctions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>sunny</title>
<link rel="stylesheet" href="/css/board_style.css">
<link rel="stylesheet" href="/css/reply_number.css">
<link rel="stylesheet" href="/video/sunny.mp4">
<script src="https://kit.fontawesome.com/6a80a39212.js" crossorigin="anonymous"></script>
<link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
<script type="text/javascript" src="/search.js"></script>

<style>
.video {
	width: 1200px;
	height: 100%;
	content: "";
	background: url("/video/sunny.mp4");
	position: absolute;
	top: 0;
	left: 0;
	z-index: -1;
	opacity: 0.5;
}

.board_wrap, .reply_wrap {
	background-color: rgb(250, 248, 231);
}

.board_wrap .board_list .board_body {
	font-size: 15px;
}
</style>

<script type="text/javascript">
	function read(board_no) {
		let url = 'read/' + board_no;
		url += "?nowPage=${nowPage}";
		url += "&col=${col}";
		url += "&word=${word}";
		location.href = url;
	}
</script>

</head>
<body>
	<div class="video">
		<video muted autoplay loop>
			<source src="/video/sunny.mp4" type="video/mp4">
			<strong>Your browser does not support the video tag.</strong>
		</video>
	</div>

	<div class="board_category">
		<div class="all">
			<a href="/board/weather_list">all</a>
		</div>
		<div class="sunny">
			<a href="/board/weather/sunny"><img src="/image/sun.png"
				alt="no image"></a>
		</div>
		<div class="fog">
			<a href="/board/weather/cloudy"><img src="/image/cloudy.png"
				alt="no image"></a>
		</div>
		<div class="rain">
			<a href="/board/weather/rainy"><img src="/image/rain.png"
				alt="no image"></a>
		</div>
	</div>

	<div class="board_wrap">
		<div class="board_list_wrap">
			<div class="board_list">
				<div class="top">
					<div class="category">
						<i class="fa-solid fa-ellipsis"></i>
					</div>
					<div class="title">제목</div>
					<div class="username">글쓴이</div>
					<div class="date">작성일</div>
					<div class="view_cnt">
						<i class="fa-regular fa-eye"></i>
					</div>
					<div class="like_cnt">
						<i class="fa-solid fa-heart"></i>
					</div>
				</div>
				<%-- top --%>
				<tbody>
					<c:choose>
					
						<%-- 게시판에 글이 없으면 --%>
						<c:when test="${empty list}">
							<tr><td colspan='6'>등록된 글이 없습니다.</td></tr>
						</c:when>

						<%-- 게시판에 글이 있으면 --%>
						<c:otherwise>
							<c:forEach var="dto" items="${list}" varStatus="statusList">
								<div class="body">
								
									<c:choose>
										<%-- role == '회원' --%>
										<c:when test="${dto.udto.role eq 'ROLE_USER'}">
											<div class="category">
												<c:choose>
													<c:when test="${dto.weather_category eq '맑음'}">
														<img src="/image/sun.png" alt="no image">
													</c:when>

													<c:when test="${dto.weather_category eq '흐림'}">
														<img src="/image/cloudy.png" alt="no image">
													</c:when>

													<c:when test="${dto.weather_category eq '비'}">
														<img src="/image/rain.png" alt="no image">
													</c:when>
												</c:choose>
											</div> <%-- category end --%>
											
											<div class="title"><a href="javascript:read('${dto.board_no}')">${dto.title }
											<%-- 댓글 갯수 보이기 시작 --%>
											<c:set var="rcount" value="${util:rcount(dto.board_no,rservice) }"/>
											<c:if test="${rcount>0 }">
											<span class="badge">${rcount}</span>
											</c:if></a></div>
											<%-- 댓글 갯수 보이기 끝 --%>
												
											<div class="username">${dto.udto.username }</div>
											
											<c:forEach var="calc_date" items="${msg2[statusList.index]}"
												varStatus="statusMsg">
												<div class="date">${calc_date}</div>
											</c:forEach>
											
											<div class="view_cnt">${dto.view_cnt }</div>
											
											<div class="like_cnt">${dto.like_cnt }</div>
										</c:when>

										<%-- role == '관리자' --%>
										<c:otherwise>
											<div class="category ad">[공지]</div>
												
											<div class="title ad"><a href="javascript:read('${dto.board_no}')">${dto.title }
											<%-- 댓글 갯수 보이기 시작 --%>
											<c:set var="rcount" value="${util:rcount(dto.board_no,rservice) }"/>
											<c:if test="${rcount>0 }">
											<span class="badge">${rcount}</span>
											</c:if>
											<%-- 댓글 갯수 보이기 끝 --%>
											</a></div>
											<div class="username ad">${dto.udto.username }</div>
											
											<c:forEach var="calc_date" items="${msg2[statusList.index]}"
												varStatus="statusMsg">
												<div class="date ad">${calc_date}</div>
											</c:forEach>
											
											<div class="view_cnt ad">${dto.view_cnt }</div>
											
											<div class="like_cnt ad">${dto.like_cnt }</div>
										</c:otherwise> <%-- role == '관리자' end --%>
										
									</c:choose>
									
								</div> <%-- body end --%>
							</c:forEach>
						</c:otherwise> <%-- 게시판 글이 있으면 end --%>
					</c:choose>
				</tbody>
			</div>
			<%-- board_list --%>
			<div class="bt_wrap">
				<div class="box">
					<form name="search">
						<input type="text" id="ab" class="input" name="word" value="${word }"
							onmouseout="this.value = ''; this.blur();">
					</form>
					<i class="fas fa-search"></i>
				</div>
				<%-- box --%>

				<div class="box2">
					<div class="create2" onclick="location.href='/board/create'">
						<i class="fa-solid fa-pencil"></i>
					</div>
				</div>
				<%-- box2 --%>

			</div>
			<%-- bt_wrap --%>
		</div>
		<%-- board_list_wrap --%>
		${paging }
	</div>
	<%--  board_wrap --%>
</body>
</html>