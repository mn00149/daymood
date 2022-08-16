<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<c:choose>
		<c:when test="${not empty movie_list}">
			<c:forEach var="dto" items="${movie_list}">
				<img src="${dto.image}" style="width:300px">
			</c:forEach>
		</c:when>

	</c:choose>
</body>
</html>