<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="util" uri="/ELFunctions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>read page</title>

<link rel="stylesheet" href="/css/board_style.css">
<link rel="stylesheet" href="/css/reply.css">
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

.board_wrap, .card-body {
background-color: rgb(250, 248, 231);
}
</style>

<script type="text/javascript">
function update2() {
var url = "/board/update/${dto.board_no}";
location.href = url;
}

function scrap(board_no) {
    return fetch(`/board/scrap/${board_no}`,{method: 'get'})
           .then(response => alert("스크랩 되었습니다."))
           .catch(console.log);
}
</script>
</head>
<body>
<div class="board_wrap">

<div class="video">
<video muted autoplay loop>
<source src="/video/sunny.mp4" type="video/mp4">
<strong>Your browser does not support the video tag.</strong>
</video>
</div>

<form class="delete" action="/board/delete" method="post">
<div class="board_title">
<strong>#맑음</strong>
<p> 글쓴이 : ${dto.username}</p>

<sec:authorize access="isAuthenticated()">
	<p> 로그인된 사람 : ${username}</p>
</sec:authorize>

<!-- 로그인 됐을 때만 '로그인 된 사람'이라는 말이 뜨도록 바꿨습니다. -->
</div>

<div class="board_view_wrap">
<div class="board_view">

<input type='hidden' name='board_no' value="${dto.board_no}">

<div class="title">${dto.title }</div>
<div class="info">
<dl>
<dt>글쓴이</dt>
<dd>${dto.username }</dd>
</dl>
<dl>
<dt>작성일</dt>
<dd>${dto.create_date }</dd>
</dl>
<dl>
<dt>
<i class="fa-regular fa-eye"></i>
</dt>
<dd>${dto.view_cnt }</dd>
</dl>
<dl>
<dt>
<i class="fa-solid fa-heart"></i>
</dt>
<dd>${dto.like_cnt }</dd>
</dl>
<dl>
<dt>
<i class="fa-solid fa-comment-dots"></i>
</dt>
<dd>댓글수</dd>
</dl>
</div>
<div class="cont">${dto.content }</div>
</div>


<div class="bt_wrap" style="display:flex;justify-content:flex-end;">
<c:set var="board_username" value="${dto.username }"/>
<c:set var="session_username" value="${username }"/>
<%-- 글쓴이(dto.username)와 로그인 된 닉네임(session_username) 일치 시 수정 및 삭제 가능 --%>
<!-- 스크랩 버튼 추가 및 스타일 조정(bt_wrap flex, flex-end, width) -->
<c:choose>

<c:when test="${dto.username eq session_username }">
<button style="margin:auto" type="button" class="btn" onclick="history.back()">목록</button>
<button type="button" class="btn" onclick="update2()">수정</button>
<button class="btn">삭제</button>
<button type="button" class="btn" onclick="scrap(${dto.board_no})">스크랩</button>
</c:when>

<c:otherwise>
<div class="bt_wrap" style="display:flex;justify-content:flex-end;width:100%">
<button type="button" class="btn" onclick="history.back()">목록</button>
<button type="button" class="btn" onclick="scrap(${dto.board_no})">스크랩</button>
</div>
</c:otherwise>
</c:choose>
</div> <%-- bt_wrap end --%>

</div>
</form>
<!-- 닫는 form태그 위치 안맞아서 계속 에러떠서 한칸 위로 올렸습니다. -->
</div>
	<!---------------------------------------------------->
	<!-- Comments section-->
	<section class="mb-5">
		<div class="card bg-white">
			<div class='row'>

				<div class="col-lg-12">

					<div class='row'>

						<div class="col-lg-12">

							<!-- panel start-->
							<div class="panel panel-default">

								<div class="panel-heading">
									<i class="fa fa-comments fa-3x" aria-hidden="true"></i>
									<button id='addReplyBtn'
										class='btn btn-light btn-2x pull-right'>댓글 쓰기</button>
								</div>


								<div class="panel-body">

									<ul class="chat list-group">
										<li class="left clearfix" data-rno="20">
											<div></div>
										</li>
									</ul>
									<!-- ul end  -->
								</div>

								<div class="panel-footer"></div>

							</div>
							<!-- panel end-->
						</div>
						<!--  col-lg-12 end -->
					</div>
					<!-- row end -->
				</div>
			</div>
		</div>
	</section>

	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 align="center" class="modal-title" id="myModalLabel">댓글</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>내용</label>
						<textarea cols="50" rows="10" class="form-control" name='content'>New Reply!!!!</textarea>
					</div>
				</div>

				<div class="modal-footer">
					<button id='modalModBtn' type="button" class="btn btn-light">수정하기</button>
					<button id='modalRemoveBtn' type="button" class="btn btn-light">삭제하기</button>
					<button id='modalRegisterBtn' type="button" class="btn btn-light">등록하기</button>
					<button id='modalRecommentBtn' type="button" class="btn btn-light">답글쓰기</button>
					<button id='modalRecoRegisterBtn' type="button" class="btn btn-light">답글등록</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->


	<script>
		 let board_no = "${dto.board_no}"; 
		 let sno = "${sno}";
		 let eno = "${eno}";
		<!-- 댓글용 paging, 게시판 검색 -->
		 let nPage = "${nPage}";
		 let nowPage = "${param.nowPage}";
		 let colx = "${param.col}";
		 let wordx = "${param.word}";
		 
		 let user_no ="${user_no}";  
		 let username ="${username}"; 
		 //let indent ="${vo.indent}"; 
		 //let ansnum ="${vo.ansnum}"; 
	</script>
	<!-- 댓글처리 관련 Javascript 파일 추가-->
	<script src="/js/producer.js"></script>
	<script src="/js/consumer.js"></script>


</body>
</html>