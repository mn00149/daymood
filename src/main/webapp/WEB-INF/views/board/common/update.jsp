<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  	
  	<script type="text/javascript" src="/js/select.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
    <link rel="stylesheet" href="/css/board_style.css">
    
  
  <script>
	function changeFn(){
		var city  = document.getElementById("select_board");
		var value = (city.options[city.selectedIndex].value);
		alert("value = "+value);
	};
	
	$(function() {
        CKEDITOR.replace('content'); // <TEXTAREA>태그 id 값
   });
</script>
<style>
	.ck.ck-editor {
    	max-width: 1000px;
	}
	.ck-editor__editable {
	    min-height: 600px;
	}
</style>

</head>
<body>
	<div class="board_wrap">
		<div class="board_title">
			<strong>게시글 수정</strong>
		</div>
		
		<form class="update" action="/board/update" method="post">	
		
		<input type='hidden' name='board_no' value="${dto.board_no}">
		
		<div class="board_write">
			<div class="title">
				<dl>
					<dt>제목</dt>
					<dd><input type="text" name="title" id="title" placeholder="제목을 입력해 주세요."></dd>
				</dl>
			</div>
		</div>
		
		
		<div class="board_write_wrap">
			<%-- 
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
			--%>
			<input type="hidden" name="select_category" id="select_category" value="">
			
			<div class="board_content">
				<label class="control-label" for="content">내용</label>
    			<textarea id="content" name="content" class="form-control"></textarea>
    		</div>
    	</div> <%-- board_write_wrap end --%>
				
		<div class="bt_wrap">
			<button class="btn">등록</button>
    		<button type="btn" class="btn" onclick="history.back()">취소</button>
		</div>
		</form>
	</div>
	
</body>
</html>