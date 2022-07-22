<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Friends</title>
	<link rel="stylesheet" href="/css/member.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
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
                                <th>이름</th>
                                <th>국가</th>
                                <th>이메일</th>
                                <th>가입일</th>
                                <th>수락여부</th>
                            </tr>
                        </thead>
                        <tbody class="requestlist">
                            <!-- <tr>
                                <td><img src="/images/daymood.png" /></td>
                                <td>홍길동</td>
                                <td>hgd1996@naver.com</td>
                                <td>2022-07-13</td>
                                <td>
                                    <button><i class="fa-solid fa-check"></i></button>
                                    <button><i class="fa-solid fa-x"></i></button>
                                </td>
                            </tr> -->
                        </tbody>
                    </table>
                </div>
				<div class="friends_header">
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
					<div>
						<input placeholder="Find Friend" />
						<button class="Search">검색</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="/js/reqFriends.js" defer></script>
</html>