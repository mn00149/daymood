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
  	<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script> --%>
  	 <script src="https://cdn.tiny.cloud/1/hupw785197hi8r9eavvyx4pvlvbpeaz420yn216ptuz89q8r/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script> <%-- tiny editor --%>
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
</style>

</head>
<body>
	<div class="board_wrap_create">
		
		<form class="create" action="create" method="post">	
		
		<p id="p_create">게시물 등록</p>
		
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
			
			<div class="board_write">
				<div class="create_title">
					<dt>제목</dt>
					<input type="text" name="title" id="title_input" placeholder="제목을 입력해 주세요.">
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
    			<button class="btn" onclick="history.go(-1)">취소</button>
			</div>
		</div>
		
		</form>
	</div>
	
</body>
</html>