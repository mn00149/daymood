<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>추천게시판</title>
<script src="https://kit.fontawesome.com/6a80a39212.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="/css/recommend_style.css">

<style>
body {
	background-color: #F8ECD1;
}
</style>

<script type="text/javascript">
	function read(board_no) {
		let url = 'read/' + board_no;
		url += "?nowPage=${nowPage}";
		url += "&col=${col}";
		url += "&word=${word}";
		location.href = url;
	}
</script>

<body>

	<div class="board_category">
		<div class="all"><a href="/board/recommend_list">all</a></div>
		
		<div class="video"><a href="/board/list/movie">
		<img src="/image/recommend/video.png" alt="no image"></a></div>
		
		<div class="book"><a href="/board/list/book">
		<img src="/image/recommend/book.png" alt="no image"></a></div>
		
		<div class="music"><a href="/board/list/music">
		<img src="/image/recommend/music.png" alt="no image"></a></div>
	</div> <%-- board_category end --%>	

	<div class="wrap">	
		<h1>영화게시판</h1>	
	
	<c:choose>
		<%-- 게시판에 글이 없으면 --%>
		<c:when test="${empty list }">
			<tr><td colspan='6'>등록된 글이 없습니다.</td></tr>
		</c:when>		
		
		<%-- 게시판에 글이 있으면 --%>
		<c:otherwise>
			<div class="fixed_img_col">
				<c:forEach var="dto" items="${list }" varStatus="statusList">
				
					<div class="movie_table">
						<div class="poster"></div>
						
						<div class="explanation">
							<span class="title"><a href="javascript:read('${dto.board_no}')">${dto.title }</a></span>
							<a>[40]</a>
							<p>${dto.content }</p>
							<span>${dto.udto.username }</span>
							<c:forEach var="calc_date" items="${msg2[statusList.index]}"
							varStatus="statusMsg">
								<span class="date">${calc_date}</span>
							</c:forEach>
						</div>
					</div> <%-- movie_table end --%>
					
				</c:forEach>
			</div> <%-- fixed_img_col end --%>
		</c:otherwise>
	</c:choose>
		
	</div> <%-- wrap end --%>
	
	<div class="down">
		<div class="board_page"></div>
		<div class="bt_wrap"></div>
	</div>
</body>
</html>