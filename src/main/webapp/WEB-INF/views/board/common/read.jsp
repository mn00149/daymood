<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="util" uri="/ELFunctions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>read</title>

<link rel="stylesheet" href="/css/board_style.css">
<link rel="stylesheet" href="/css/reply.css">
<script src="https://kit.fontawesome.com/6a80a39212.js"
	crossorigin="anonymous"></script>
<link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap"
	rel="stylesheet">
<script type="text/javascript" src="/search.js"></script>




<script type="text/javascript">
    function update2() {
        var url = "/board/update/${dto.board_no}";
        location.href = url;
    }
    
    const board_no2 = '${board_no}';
    const user_no2 = '<c:out value="${user_no}"/>';
    const username2 = '<c:out value="${username}"/>';
    const word2 = '${word}';
    const col2 = '${col}';
    const nowPage2 = '{nowPage}';

    function updateLike2(){ 

         $.ajax({
                type : "POST",
                url : "/board/read",
                dataType : "json",
                data : {'board_no' : board_no2, 'user_no' : user_no2, 'username' : username2},
                error : function(){
                   alert("board_no : " + board_no2 + " user_no : " + user_no2 + " username : " + username2);
                },
                success : function(likeCheck) {

                        if(likeCheck == 0){
                            alert("게시글에 좋아요를 눌렀습니다.");
                            location.reload();
                        }
                        else if (likeCheck == 1){
                         alert("좋아요를 취소했습니다.");
                            location.reload();
                        }
                }
         });
     }
    
    function scrap(board_no) {
    	
        return fetch(`/board/scrap/${board_no}`, {method: 'get'})
               .then(response => alert("스크랩 되었습니다."))
               .catch(console.log);
    }
</script>

<style>
body {
	background-color: #F2F4F9;
}
</style>
</head>
<body>
	<div class="board_wrap">

		<form class="delete" action="/board/delete" method="post">

			<div class="board_view_wrap">
				<div class="board_view">

					<input type='hidden' name='board_no' id='board_no'
						value="${dto.board_no}">

					<div class="title_info">
						<div class="title">
							<p id="list_title_category">
							
							<c:choose>
								<c:when test="${dto.weather_category eq '맑음'}">
									[Mood][etc]
								</c:when>
								<c:when test="${dto.weather_category eq '흐림'}">
									[Mood][etc]
								</c:when>
								<c:when test="${dto.weather_category eq '비'}">
									[Mood][etc]
								</c:when>
								<c:when test="${dto.info_category eq '미국'}">
									[Info][U.S.A]
								</c:when>
								<c:when test="${dto.info_category eq '캐나다'}">
									[Info][Canada]
								</c:when>
								<c:when test="${dto.info_category eq '중국'}">
									[Info][China]
								</c:when>
								<c:when test="${dto.info_category eq '호주'}">
									[Info][Australia]
								</c:when>
								<c:when test="${dto.info_category eq '유럽'}">
									[Info][Europe]
								</c:when>
								<c:when test="${dto.info_category eq '일본'}">
									[Mood][Japan]
								</c:when>
								<c:when test="${dto.info_category eq '기타'}">
									[Info][etc]
								</c:when>
								<c:when test="${dto.recommend_category eq '영화'}">
									[Recommend][Movie]
								</c:when>
								<c:when test="${dto.recommend_category eq '도서'}">
									[Recommend][Book]
								</c:when>
								<c:when test="${dto.recommend_category eq '음악'}">
									[Recommend][Music]
								</c:when>
							</c:choose>
							</p>
							
							<p id="list_title">${dto.title }</p>
						</div>
						<div class="info">
							<dl class="dl">
								<dt>${dto.username }</dt>
							</dl>
							<dl class="dl">
								<dt>작성일</dt>
								<dd>${dto.create_date }</dd>
							</dl>
							<dl class="dl_2">
								<dt>
									조회수
									<%-- <i class="fa-regular fa-eye"></i>
									<img src="/image/view.png" alt="My Image">--%>
								</dt>
								<dd>${dto.view_cnt }</dd>
							</dl>
							<dl class="dl_2">
								<dt>
									좋아요
									<%--<i class="fa-solid fa-heart"></i>
									<img src="/image/like.png" alt="My Image">--%>
								</dt>
								<dd>${dto.like_cnt }</dd>
							</dl>
						</div>
					</div>
					<div class="cont">${dto.content }</div>
				</div>


				<div class="read_bt_wrap">
					<c:set var="board_username" value="${dto.username }" />
					<c:set var="session_username" value="${username }" />
					<c:choose>
						<%-- 글쓴이(dto.username)와 로그인 된 닉네임(session_username) 일치 시 수정 및 삭제 가능 --%>
						<c:when test="${dto.username eq session_username }">
							<button type="button" class="btn" onclick="history.back()">목록</button>
							<button type="button" class="btn" onclick="update2()">수정</button>
							<button class="btn">삭제</button>
						</c:when>
						<c:otherwise>
							<%-- 본인 게시글에는 좋아요 불가능 --%>
							<button type="button" class="btn" onclick="history.back()">목록</button>
							<button type="button" class="btn" id="like_btn"
								onclick="updateLike2()">좋아요 &nbsp;${dto.like_cnt }</button>
							<button type="button" class="btn"
								onclick="scrap(${dto.board_no})">스크랩</button>
						</c:otherwise>
					</c:choose>
				</div>
				<%-- bt_wrap end --%>

			</div>
	</div>
	</form>
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
									<img src="/images/comment2.png" width="50" height="50"
										alt="comment">
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
		 let indent;
		 
		 let ansnum = "${ansnum}";
		 
		 let user_no ="${user_no}";  
		 let username ="${username}"; 
 
	</script>
	<!-- 댓글처리 관련 Javascript 파일 추가-->
	<script src="/js/reply_a.js"></script>
	<script src="/js/reply_b.js"></script>
	<script>
	
	</script>

</body>


</html>