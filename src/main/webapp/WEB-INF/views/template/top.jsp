<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="root" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>Document</title>
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');

@media ( max-width : 1400px) {
	body {
		font-size: 1rem;
	}
	.container {
		width: 100%;
		margin: 0 auto;
	}
}

body {
	margin: 0;
	padding: 0;
	font-size: 16px;
	height: 100%;
	color: #28313b;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	font-family: 'Jua', sans-serif;
}
/* XLarge */

	@media screen and (max-width: 1680px) {

		/* Basic */

			body, input, select, textarea {
				font-size: 12pt;
			}

	}

/* Large */

	@media screen and (max-width: 1280px) {

		/* Basic */

			body, input, select, textarea {
				font-size: 11pt;
			}

	}
.container {
	width: 1400px;
	margin: 0 auto;
	grid-template-columns: 3fr 1fr;
	grid-template-rows: 1fr auto;
	gap: 10px;
}

#main_header {
	width: 98%;
	height: 80px;
	grid-column-start: 1;
	grid-column-end: 3;
	grid-row-start: 1;
	grid-row-end: 2;
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin: 20px 0;
	/* backgorund-color: rgba(255, 55, 59, 0.7); */
    /* background: radial-gradient(circle, rgba(238, 174, 202, 1) 0%,
				rgba(148, 187, 233, 1) 100%);  */
	background : #FEECE1;
	border: 2px solid;
	border-radius: 10px;
	border-color : #E2E2E8;
	box-sizing: border-box;
	padding: 0 70px;
}

#menu {
	list-style: none;
	display: flex;
	font-size: 16px;
	gap: 100px;
	padding-top : 10px;
}

#menu > * {
font-family: 'Jua', sans-serif;
}

#menu>ul>li {
	padding-left: 5em;
	
}

#menu>li>a, #login>a {
	text-decoration: none;
	width: auto;
	color: rgb(0, 0, 0);
}

#menu>li>a:hover {
	transition: color 0.3s;
	color: #958CC3;
}

#menu > li > a {
	font-size : 1.4em;
}

#login>a {
	padding-right: 15px;
	margin-right: 5px;
}

.footer {
	width: 100vw;
	height: 100px;
	background-color: #838383;
	position: absolute;
	bottom: 0;
	left: 0;
	padding: 0 25px;
	line-height: 60px;
}

.container img {
	width: 200px;
	height: 58px;
	display: flex;
	justify-content: center;
	flex-direction: column;
<<<<<<< HEAD
	margin: 5px 10px 0 10px;
=======
	margin: 0.5px 0px 0px 0px;
>>>>>>> 6eb0454c20a8535dcf3325a82090619262696c66
}

.logo {
	display: inline-block;
	vertical-align: middle;
}

.logo>a>img {
	max-width: 150px;
	padding-bottom : 10px;
	padding-top : 5px;
}

a {
	text-decoration: none;
	color: none;
}
/* Container */

	.container {
		margin: 0 auto;
		max-width: 100%;
		width: 1400px;
	}

		@media screen and (max-width: 1680px) {

			.container {
				width: 1200px;
			}

		}

		@media screen and (max-width: 1280px) {

			.container {
				width: 960px;
			}

		}

		@media screen and (max-width: 980px) {

			.container {
				width: 90%;
			}

		}

		@media screen and (max-width: 736px) {

			.container {
				width: 100%;
			}

		}
</style>

</head>
<body>
	<div class="container">
		<header id="main_header">
			<div class="logo">
				<a href="/main"><img class="logo" src="/images/main_logo.png" alt="logo"></a>
			</div>
			<ul id="menu">
				<li><a href="/board/weather_list">Mood</a></li>
				<li><a href="/board/info_list">Info</a></li>

				<li><a href="/board/recommend/movie">Recommend</a></li>


			</ul>

			<sec:authorize access="isAnonymous()">
				<div id="login">
					<a href="/loginForm">로그인</a> <a href="/joinForm">회원가입</a>
				</div>
			</sec:authorize>
			
			<sec:authorize access="isAuthenticated()">
				<div id="login">
					<a href="/mypage/member"><sec:authentication property="principal.username"/></a> <a href="/logout">로그아웃</a>
				</div>
			</sec:authorize>


		</header>
	</div>

</body>
</html>