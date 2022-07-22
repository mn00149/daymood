<%@ page contentType="text/html; charset=UTF-8" %> 

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>read page</title>
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/reply.css">
<script src="https://kit.fontawesome.com/6a80a39212.js" crossorigin="anonymous"></script>

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
			<strong>제목</strong>
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
						<dd>${dto.like_cnt }</dd>
					</dl>
					<dl>
						<dt>
							<i class="fa-solid fa-comment-dots"></i>
						</dt>
						<dd>댓글수</dd>
					</dl>
				</div>
				<div class="cont">
					${dto.content }
				</div>
			</div>
			<div class="bt_wrap">

				<a href="/board/list" class="on"><i class="fa-solid fa-list"></i>목록</a>
				<a href="create.html"><i class="fa-solid fa-pen"></i> 수정</a>
			</div>
		</div>
	</div>

	<!-- Comments section-->
	<section class="mb-5">
		<div class="card bg-light">
			<div class="card-body">
				<!-- Comment form-->
				<form class="mb-4">
					<textarea class="form-control" rows="3" placeholder="댓글을 작성해 보세요!"></textarea>
				</form>
				<!-- Comment with nested comments-->
				<div class="d-flex mb-4">
					<!-- Parent comment-->
					<div class="flex-shrink-0">
						<img class="rounded-circle"
							src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
					</div>
					<div class="ms-3">
						<div class="fw-bold">이승찬</div>
						대댓글은 border 처리
						<!-- Child comment 1-->
						<div class="d-flex mt-4">
							<div class="flex-shrink-0">
								<img class="rounded-circle"
									src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
							</div>
							<div class="ms-3">
								<div class="fw-bold">유효선</div>
								돈그리아
							</div>
						</div>
						<!-- Child comment 2-->
						<div class="d-flex mt-4">
							<div class="flex-shrink-0">
								<img class="rounded-circle"
									src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
							</div>
							<div class="ms-3">
								<div class="fw-bold">이청우</div>
								대댓글
							</div>
						</div>
					</div>
				</div>
				<!-- Single comment-->
				<div class="d-flex">
					<div class="flex-shrink-0">
						<img class="rounded-circle"
							src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
					</div>
					<div class="ms-3">
						<div class="fw-bold">최욱진</div>
						댓글
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>