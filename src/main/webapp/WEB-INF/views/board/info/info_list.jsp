<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="util" uri="/ELFunctions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>info</title>
<link rel="stylesheet" href="/css/board_style.css">
<link rel="stylesheet" href="/css/boardProfile.css">
<link rel="stylesheet" href="/css/reply_number.css">
<link rel="stylesheet" href="/css/letter_modal.css">
<script type="text/javascript" src="/js/boardProfile.js" defer></script>
<script type="text/javascript" src="/js/search.js"></script>
<script src="https://kit.fontawesome.com/6a80a39212.js"	crossorigin="anonymous"></script>
<link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap"	rel="stylesheet">

<style>
body {
	background-color: #F2F4F9;
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

	<!-- 친구 요청 팝업 -->
	<div class="popup-overlay">
		<div class="popup-box-container">
			<div class="check-container">
				<i class="fa-solid fa-handshake"></i>
			</div>
			<div class="popup-message-container">
				<h1 id="userid"></h1>
				<p>친구 추가 하시겠습니까?</p>
			</div>
			<button class="ok-btn">
				<span>확인</span>
			</button>
			<button class="no-btn">
				<span>취소</span>
			</button>
		</div>
	</div>
	
	<!-- 클릭 시 친구 요청 등 메뉴 뜸 -->
	<ul id="profile" class="container__menu container__menu--hidden">
		<sec:authorize access="isAuthenticated()">
                <li class="container__item"><span class="req-btn">친구요청</span></li>
                <li class="container__item"><span class="btn-open-popup" data-backdrop="static">쪽지 보내기</span></li>
    	</sec:authorize>
                <li class="container__item"><a href="javascript:posted()" style="text-decoration:none">작성 글 보기</a></li>
	</ul>

	<!-- 쪽지보내기 모달 -->
	<c:forEach var="tmp" items="${list}">
	   <form class="modal" action="/letter_send_profile" method="post">
        <div class="modal_body" >
          <div class="modal_title">쪽지 보내기</div>
       <!--    <div class="profile_area">
             <div class="receiver">
                  <span class="recvname" value="${tmp.ldto.recv_name }">to.</span>
            </div>
            <div class="sender">
                <span class="sendname" value="${tmp.ldto.other_name }"></span>
            </div> 
          </div> -->
          <textarea class="let content" id="content" name="content" placeholder="내용"></textarea>
          <div class="bt_duo">
          <button  type="button" class="mes mes_send" id="msg_submit" >전송</button>
          <button  type="button" class="mes mes_close" id="modal_close">취소</button>
          </div>
        </div>
        </form>
       </c:forEach>
	
	<div class="board_category">
		<div class="all">
			<a href="/board/info_list">all</a>
		</div>
		<div class="america">
			<a href="/board/info/america"><img src="/image/nation/america.png"
				alt="no image"></a>
		</div>
		<div class="china">
			<a href="/board/info/china"><img src="/image/nation/china.png"
				alt="no image"></a>
		</div>
		<div class="canada">
			<a href="/board/info/canada"><img src="/image/nation/canada.png"
				alt="no image"></a>
		</div>
		<div class="australia">
			<a href="/board/info/australia"><img src="/image/nation/australia.png"
				alt="no image"></a>
		</div>
		<div class="japan">
			<a href="/board/info/japan"><img src="/image/nation/japan.png"
				alt="no image"></a>
		</div>
		<div class="europe">
			<a href="/board/info/europe"><img src="/image/nation/europe.png"
				alt="no image"></a>
		</div>
		<div class="etc">
			<a href="/board/info/etc"><img src="/image/nation/etc.png"
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
							<tr>
								<td colspan='6'>등록된 글이 없습니다.</td>
							</tr>
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
														<c:when test="${dto.info_category eq '미국'}">
															<img src="/image/nation/america.png" alt="no image">
														</c:when>

														<c:when test="${dto.info_category eq '중국'}">
															<img src="/image/nation/china.png" alt="no image">
														</c:when>

														<c:when test="${dto.info_category eq '캐나다'}">
															<img src="/image/nation/canada.png" alt="no image">
														</c:when>
													
														<c:when test="${dto.info_category eq '호주'}">
															<img src="/image/nation/australia.png" alt="no image">
														</c:when>
													
														<c:when test="${dto.info_category eq '일본'}">
															<img src="/image/nation/japan.png" alt="no image">
														</c:when>
													
														<c:when test="${dto.info_category eq '유럽'}">
															<img src="/image/nation/europe.png" alt="no image">
														</c:when>
													
														<c:when test="${dto.info_category eq '기타'}">
															<img src="/image/nation/etc.png" alt="no image">
														</c:when>
													</c:choose>
											</div>
											<%-- category end --%>

											<div class="title">
												<a href="javascript:read('${dto.board_no}')">${dto.title }
													<%-- 댓글 갯수 보이기 시작 --%> <c:set var="rcount"
														value="${util:rcount(dto.board_no,rservice) }" /> <c:if
														test="${rcount>0 }">
														<span class="badge">${rcount}</span>
													</c:if>
													<%-- 댓글 갯수 보이기 끝 --%>
												</a>
											</div>

											<!-- user_no를 받아오기 위해 data-value에 삽입, board_weather.xml 리스트 항목에 user_no 추가 -->
											<div class="username">
												<a class="username2" style="text-decoration: none"
													data-value="${dto.udto.user_no }">
													<img class="userimage" src="${dto.udto.user_image}">
													${dto.udto.username }</a>
											</div>

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

											<div class="title ad">
												<a href="javascript:read('${dto.board_no}')">${dto.title }
													<%-- 댓글 갯수 보이기 시작 --%> <c:set var="rcount"
														value="${util:rcount(dto.board_no,rservice) }" /> <c:if
														test="${rcount>0 }">
														<span class="badge">${rcount}</span>
													</c:if> <%-- 댓글 갯수 보이기 끝 --%>
												</a>
											</div>
											<div class="username ad">${dto.udto.username }</div>

											<c:forEach var="calc_date" items="${msg2[statusList.index]}"
												varStatus="statusMsg">
												<div class="date ad">${calc_date}</div>
											</c:forEach>

											<div class="view_cnt ad">${dto.view_cnt }</div>

											<div class="like_cnt ad">${dto.like_cnt }</div>
										</c:otherwise>
										<%-- role == '관리자' end --%>

									</c:choose>

								</div>
								<%-- body end --%>
							</c:forEach>
						</c:otherwise>
						<%-- 게시판 글이 있으면 end --%>
					</c:choose>
				</tbody>
			</div>
			<%-- board_list --%>
			
			<div class="list_bt_wrap">
				<div class="list_search_box">
					<form name="search">
						<input type="text" id="list_search_text" class="list_search_icon" name="word"
							value="${word }" onmouseout="this.value = ''; this.blur();">
					</form>
					<i class="fas fa-search"></i>
				</div>

				<sec:authorize access="isAuthenticated()">
				<div class="list_create_box">
					<div class="list_create_icon" onclick="location.href='/board/create'">
						<i class="fa-solid fa-pencil"></i>
					</div>
				</div>
				</sec:authorize>
			</div> <%-- list_bt_wrap --%>
			
		</div> <%-- board_list_wrap --%>
		${paging }
	</div> <%--  board_wrap --%>
	

</body>

</html>