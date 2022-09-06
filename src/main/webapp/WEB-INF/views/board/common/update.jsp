<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  	<script src="https://cdn.tiny.cloud/1/hupw785197hi8r9eavvyx4pvlvbpeaz420yn216ptuz89q8r/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script> <%-- tiny editor --%>
  	<script type="text/javascript" src="/js/select.js"></script>
    <link rel="stylesheet" href="/css/board_style.css">
    
<script>
	function changeFn(){
		var city  = document.getElementById("select_board");
		var value = (city.options[city.selectedIndex].value);
		alert("value = "+value);
	};
	
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
	body {
		background-color: #F2F4F9;
	}
</style>

</head>
<body>
	<div class="board_wrap_create">
		
		<form class="update" action="/board/update" method="post">	
		
		<p id="p_create">게시물 수정</p>
		
		<input type='hidden' name='board_no' value="${dto.board_no}">
		
		<div class="board_write_wrap">
			<div class="title_div">
				<dl id="update_title_dl">
					<dt id="update_title_dt">제목</dt>
					<dd id="update_title_dd"><input type="text" name="title" id="title" value="${dto.title }"></dd>
				</dl>
			</div>
		</div>
		
		
		<div class="board_write_wrap">

			<input type="hidden" name="select_category" id="select_category" value="">
			
			<div class="board_content">
				<label class="control-label" for="content">내용</label>
    			<textarea id="content" name="content" class="form-control">${dto.content }</textarea>
    		</div>
    	</div> <%-- board_write_wrap end --%>
				
		<div class="bt_wrap_create">
			<button class="btn">등록</button>
    		<button class="btn" onclick="history.go(-1)">취소</button>
		</div>
		</form>
	</div>
	
</body>
</html>