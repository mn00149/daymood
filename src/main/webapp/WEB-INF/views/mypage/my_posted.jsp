<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="/css/member.css">

</head>

<body>
	<div id="content" class="ink_content" role="main">
		<%@ include file="profile1.jsp"%>
		<div class="profile2">
			<div class="myinfo">
				<ul>
					<li><a href="member" style="text-decoration: none;">회원정보</a></li>
					<li><a href="my_posted" style="text-decoration: none;">작성글</a></li>
					<li><a href="my_comment" style="text-decoration: none;">작성댓글</a></li>
					<li><a href="my_scrap" style="text-decoration: none;">스크랩</a></li>
					<li><a href="my_letter" style="text-decoration: none;">쪽지함</a></li>
				</ul>
			</div>
			<div class="friends">

				<div class="friends_section">
					<table>
						<thead>
							<tr>
								<th>카테고리</th>
								<th style="width:35%;">제목</th>
								<th>조회</th>
								<th>추천</th>
								<th>국가</th>
								<th>날짜</th>
							</tr>
						</thead>
						<tbody class="friendlist">
							
							<c:choose>
								<c:when test="${not empty plist}">
									<c:forEach var="dto" items="${plist}">
										<tr>
											<td>

											<c:choose>
												<c:when test="${dto.weather_category eq '맑음' || dto.weather_category eq '흐림' || dto.weather_category eq '비' }">
												${dto.weather_category }
												</c:when>
												<c:when test="${dto.recommend_category eq '도서' || dto.recommend_category eq '영화' || dto.recommend_category eq '음악' }">
												${dto.recommend_category}
												</c:when>
												
												<c:otherwise>
												${dto.info_category }
												</c:otherwise>
											</c:choose>
											
											</td>
											<td><a href="/board/read/${dto.board_no }/?nowPage=1&col=&word=" style="text-decoration: none;">${dto.title }</a></td>
											<td>${dto.view_cnt }</td>
											<td>${dto.like_cnt}</td>
											<td>${dto.nation}</td>
											<td><c:out value="${fn:substring(dto.create_date, 0, 10)}"/></td>
										</tr>
									</c:forEach>
								</c:when>
								
							</c:choose>

						</tbody>
					</table>
				</div>
				<div class="friends_header">
					<form action="./my_posted">
						${paging }
						<div class="Select">
							<select name="col" class="form-control">
								<option value="title"
									<c:if test="${col=='title' }">selected</c:if>>제목</option>
								<option value="content"
									<c:if test="${col=='contents' }">selected</c:if>>내용</option>
								<option value="title_content"
									<c:if test="${col=='title_contents' }">selected</c:if>>제목+내용</option>
								<option value="total"
									<c:if test="${col=='total' }">selected</c:if>>전체출력</option>
							</select> <input placeholder="Find Friend" name="word" value="${word}" />
							<button class="Search">검색</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


</body>

</html>