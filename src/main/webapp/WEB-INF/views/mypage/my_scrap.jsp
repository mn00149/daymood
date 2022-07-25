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
					<li><a href="member">회원정보</a></li>
					<li><a href="my_posted">작성글</a></li>
					<li><a href="my_comment">작성댓글</a></li>
					<li><a href="my_scrap">스크랩</a></li>
					<li><a href="my_letter">쪽지함</a></li>
				</ul>
			</div>
			<div class="friends">

				<div class="friends_section">
					<table>
						<thead>
							<tr>
								<th>카테고리</th>
								<th>아이디</th>
								<th style="width:35%;">제목</th>
								<th>국가</th>
								<th>날짜</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody class="scraplist">
							
							<c:choose>
								<c:when test="${not empty scraplist}">
									<c:forEach var="dto" items="${scraplist}">
										<tr>
											<td>${dto.weather_category}</td>
											<td>${dto.username}</td>
											<td>${dto.title }</td>
											<td>${dto.nation }</td>
											<td><c:out value="${fn:substring(dto.create_date, 0, 10)}"/></td>
											<td>
												<button onclick="javascript:rm(${dto.scrapno})">
													<i class="fa-solid fa-trash"></i>
												</button>
											</td>
										</tr>
									</c:forEach>
								</c:when>
								
							</c:choose>

						</tbody>
					</table>
				</div>
				<div class="friends_header">
					<form action="./my_scrap">
						${paging }
						<br>
						<div class="Select">
							<select name="col" class="form-control" name="col">
								<option value="title"
									<c:if test="${col=='title' }">selected</c:if>>제목</option>
								<option value="content"
									<c:if test="${col=='contents' }">selected</c:if>>내용</option>
								<option value="title_content"
									<c:if test="${col=='title_contents' }">selected</c:if>>제목+내용</option>
								<option value="total"
									<c:if test="${col=='total' }">selected</c:if>>전체출력</option>
							</select> <input placeholder="Find Scrap" name="word" value="${word}" />
							<button class="Search">검색</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
let sno = "${sno}";
let eno = "${eno}";
</script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="/js/my_scrap.js" defer></script>

</html>