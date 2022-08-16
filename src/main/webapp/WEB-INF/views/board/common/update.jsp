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