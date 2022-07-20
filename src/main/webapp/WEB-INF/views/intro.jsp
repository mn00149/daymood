<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Intro</title>
<style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@700&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: #252839;
        }

        h2 {
            position: relative;
            font-size: 14vw;
            color: #252839;
            -webkit-text-stroke: 0.3vw #383d52;
            text-transform: uppercase;
        }

        h2::before {
            content: attr(data-text);
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            color: #01fe87;
            -webkit-text-stroke: 0.3vw #383d52;
            border-right: 2px solid #01fe87;
            overflow: hidden;
            animation: animate 4s linear infinite;
        }

        @keyframes animate {

            0%,
            10%,
            100% {
                width: 0;
            }

            70%,
            90% {
                width: 100%;
            }
        }
        
        .container {
        	display:none;
        }
        
        a {
        	text-decoration : none;
        	color : inherit;
        }
    </style>
</head>

<body>
<a href="main"><h2 data-text="DayMood">DayMood</h2></a>
</body>
</html>