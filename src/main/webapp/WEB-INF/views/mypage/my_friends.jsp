<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Friends</title>
<link rel="stylesheet" href="/css/member.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
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
								<th>프로필 사진</th>
								<th>아이디</th>
								<th>국가</th>
								<th>이메일</th>
								<th>가입일</th>
								<th>관리</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><img src="/images/daymood.png" /></td>
								<td>HGD1996</td>
								<td>대한민국</td>
								<td>hgd1996@naver.com</td>
								<td>2022-07-13</td>
								<td>
									<button>
										<i class="fa-solid fa-trash"></i>
									</button>
								</td>
							</tr>
							<c:choose>

								<c:when test="${not empty list}">
									<c:forEach var="dto" items="${list}">
										<tr>
											<td><img src="/images/daymood.png" /></td>
											<td>${dto.friendname}</td>
											<td>${dto.nation }</td>
											<td>${dto.email}</td>
											<td>${dto.createDate}</td>
											<td>
												<button>
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
					<form action="post" action="my_friends">
						<div class="page">
							<div>
								<i class="fa-solid fa-angles-left"></i>
							</div>
							<div>
								<i class="fa-solid fa-chevron-left"></i>
							</div>
							<div>1</div>
							<div>2</div>
							<div>
								<i class="fa-solid fa-chevron-right"></i>
							</div>
							<div>
								<i class="fa-solid fa-angles-right"></i>
							</div>
						</div>
						<div class="Select">
							<select name="col" class="form-control">
								<option value="아이디"
									<c:if test="${col=='username' }">selected</c:if>>아이디</option>
								<option value="국가"
									<c:if test="${col=='nation' }">selected</c:if>>국가</option>
								<option value="total"
									<c:if test="${col=='total' }">selected</c:if>>전체출력</option>
							</select> <input placeholder="Find Friend" />
							<button class="Search">검색</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		
	</div>
</body>
</html>