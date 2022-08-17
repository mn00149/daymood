<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  	<script type="text/javascript" src="/js/select.js"></script>
  	<script src="https://cdn.tiny.cloud/1/hupw785197hi8r9eavvyx4pvlvbpeaz420yn216ptuz89q8r/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>
    <link rel="stylesheet" href="/css/board_style.css">
    
  
  <script>
	function changeFn(){
		var city  = document.getElementById("select_board");
		var value = (city.options[city.selectedIndex].value);
		alert("value = "+value);
	};
	
	/* $(function() {
        CKEDITOR.replace('content'); // <TEXTAREA>태그 id 값
   }); */
   
   <%-- tiny editor --%>
	tinymce.init({
	      selector: 'textarea',
	      plugins: 'a11ychecker advcode casechange export formatpainter image editimage linkchecker autolink lists checklist media mediaembed pageembed permanentpen powerpaste table advtable tableofcontents tinycomments tinymcespellchecker',
	      toolbar: 'a11ycheck addcomment showcomments casechange checklist code export formatpainter image editimage pageembed permanentpen table tableofcontents',
	      toolbar_mode: 'floating',
	      language : 'ko_KR',
	      width: 1100,
	      tinycomments_mode: 'embedded',
	      tinycomments_author: 'Author name',
	});
	
  </script>
  
<style>
	.ck.ck-editor {
    	max-width: 1000px;
	}
	.ck-editor__editable {
	    min-height: 600px;
	}
	body {
		background-color: #F2F4F9;
	}
	
	.modal {
		position: fixed;
		width:100%;
		height:100%;
		background: rgba(0,0,0,0.8);
		top:0;
		left:0;
		display:none;
	}
	
	.modal_content{
  		width:400px; 
  		height:400px;
  		background:#F2F4F9; 
  		border-radius:10px;
  		position:relative;
  		top:50%; 
  		left:50%;
  		margin-top:-200px; 
  		margin-left:-200px;
  		text-align:center;
  		box-sizing:border-box; 
  		padding:74px 0;
  		line-height:23px; 
  		cursor:pointer;
}
</style>

</head>
<body>
	<div class="board_wrap">
	
		<p id="p_create">게시물 등록</p>
		
		<form class="create" action="/board/recommend/recommend_create" method="post">		
		
		<div class="board_write">
			<div class="create_title2">
				<dt>제목</dt>
				<input type="text" name="title" id="title_input" placeholder="게시글 제목을 입력해 주세요.">
			</div>
			
			<div class="create_movie">
				<dt>추천 영화</dt>
				<input type="text" name="recommend_name" id="name_input" value="" placeholder="영화 제목을 입력해 주세요." required>
				<input type="hidden" name="recommend_img" id="img_input" value="">
				<input type="hidden" name="recommend_src" id="src_input" value="">
				<input type="button" id="modal_button" value="검색">
				<div class="modal" id='modal'>
					<div class="modal_content" id="modal_content">
					
					</div>
				</div>
			</div>
			
		</div>
		
		<div class="board_write_wrap">
			<div class="select">
				<div class="recommend_select1">
					<label for="board">게시판 선택</label>
					<select class="form-control" id="select_board" name="select_board" onchange="select_boardChange(this)">
						<option>게시판을 선택해 주세요.</option>
						<option value="a">감정게시판</option>
						<option value="b">정보게시판</option>
						<option value="c">추천게시판</option>
					</select>
				</div>
					
				<div class="recommend_select2">
					<label for="category">카테고리 선택</label>
					<select class="form-control" id="select_category" name="select_category">
						<option>카테고리를 선택해 주세요.</option> 
					</select>
				</div>
			</div>
			<input type="hidden" name="select_category" id="select_category" value="">
			<input type="hidden" name="select_category" id="select_category" value="${weather_category}">
			
			<div class="board_content">
				<label class="control-label" for="content">내용</label>
    			<textarea id="content" name="content" class="form-control"></textarea>
    		</div>
				
			
			
		<div class="bt_wrap_create">
			<button class="btn">등록</button>
    		<button type="btn" class="btn" onclick="history.back()">취소</button>
		</div>
		</form>
	</div>
	
</body>
<script type="text/javascript" src="/js/select_movie.js"></script>
</html>