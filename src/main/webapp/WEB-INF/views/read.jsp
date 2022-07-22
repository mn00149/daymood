<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>read page</title>

<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/reply.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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

.pagination {
	display: flex;
}

.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover,
	.pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover
	{
	z-index: 3;
	color: #fff;
	cursor: default;
	background-color: #c3423f;
	border-color: #c3423f;
}

.panel-footer {
	padding: 10px 15px;
	background-color: #ffffff;
	border-top: 1px solid #ddd;
	border-bottom-right-radius: 3px;
	border-bottom-left-radius: 3px;
}

.pagination>li>a, .pagination>li>span {
	position: relative;
	float: left;
	padding: 6px 12px;
	margin-left: -1px;
	line-height: 1.42857143;
	color: #000000;
	text-decoration: none;
	background-color: #fff;
	border: 1px solid #ddd;
}

.list-group-item {
    position: static;
    display: block;
    padding: 5px 14px;
    margin-bottom: -1px;
    background-color: #F8F7F7;
    border: 1px solid #fff;
}
.panel-default>.panel-heading {
    color: #c3423f;
    background-color: #fff;
    border-color: #fff;
}

.card {
    width: 1200px;
    margin: 0 auto;
    border-radius: 10px;
    padding: 0px 0;
    position: relative;
    display: flex;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: rgb(250,248,231);
    background-clip: border-box;
}

.board_wrap {
    width: 1200px;
    margin: 25px auto;
    border-radius: 5px;
    padding-top: 20px;
    padding-bottom: 60px;
}
</style>
</head>
<body>
	<div class="board_wrap">

		<div class="video">
			<video muted autoplay loop>
				<source src="/video/sunny.mp4" type="video/mp4">
				<strong>Your browser does not support the video tag.</strong>
			</video>
		</div>
		<div class="board_title">
			<strong>#맑음</strong>
		</div>

		<div class="board_view_wrap">
			<div class="board_view">
				<div class="title">Title</div>
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
						<dd>${dto.recommend_cnt }</dd>
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
			<div class="bt_wrap">

				<a href="/board/list" class="on"><i class="fa-solid fa-list"></i>목록</a>
				<a href="create.html"><i class="fa-solid fa-pen"></i> 수정</a>
			</div>
		</div>
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
										class='btn btn-danger btn-2x pull-right'>댓글 쓰기</button>
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
					<button id='modalCloseBtn' type="button" class="btn btn-light">닫기</button>
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
		 
		 let user_no ="${sessionScope.user_no}"; //나중에 확인 
		 let username ="${sessionScope.username}"; //나중에 확인 
	</script>
	<!-- 댓글처리 관련 Javascript 파일 추가-->
	<script src="/js/producer.js"></script>
	<script src="/js/consumer.js"></script>


</body>
</html>