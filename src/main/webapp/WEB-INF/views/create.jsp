<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
  	<script type="text/javascript" src="/js/select.js"></script>
  <link rel="stylesheet" href="/css/board_style.css">
</head>
<body>
	<div class="board_wrap">
		<div class="board_title">
			<strong>게시글 작성</strong>
		</div>
		
		
		<div class="board_write">
			<div class="title">
				<dl>
					<dt>제목</dt>
					<dd><input type="text" placeholder="제목을 입력해 주세요."></dd>
				</dl>
			</div>
		</div>
		
		<div class="board_write_wrap">
			<div class="select">
			<div class="select1">
				<label for="board">게시판 선택</label>
				<select class="form-control" id="select_board" name="select_board" onchange="select_boardChange(this)">
					<option>게시판을 선택해 주세요.</option>
					<option value="a">감정게시판</option>
					<option value="b">정보게시판</option>
					<option value="c">추천게시판</option>
				</select>
			</div>
					
			<div class="select2">
				<label for="category">카테고리 선택</label>
				<select class="form-control" id="select_category" name="select_category">
					<option>카테고리를 선택해 주세요.</option> 
				</select>
			</div>
			</div>
		

			<div id="summernote"></div>
			<script>
				$('#summernote').summernote({
					placeholder: '내용을 작성해 주세요.',
				    tabsize: 2,
				    height: 500
				});
			</script>
		</div>
				
		<div class="bt_wrap">
			<a href="view.html" class="on">등록</a> <a href="list.html">취소</a>
		</div>
	</div>
</body>
</html>