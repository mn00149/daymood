<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#gd {
 max-width: 110px;
 height: 156px;
}

.gdgdgd {
	margin: 100px;
}
</style>

</head>
<body>
	
	<div class="gdgdgd">
	<img src="${movie_list.get(0).image }"/><br>

	
	영화제목 : <a href="${movie_list.get(0).link }">${movie_list.get(0).title }</a><br>
	감   독 : ${movie_list.get(0).director }<br>
	출연배우 : ${movie_list.get(0).actor }<br>
	제작년도 : ${movie_list.get(0).pubDate }<br>
	평   점 : ${movie_list.get(0).userRating }
	</div>
</body>
</html>