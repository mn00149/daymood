<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>DayMood</title>
    <link rel="stylesheet" href="css/intro.css" />
  </head>
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link
    href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&family=Hi+Melody&family=Nanum+Brush+Script&family=Nanum+Pen+Script&display=swap"
    rel="stylesheet"
  />
  <style>
    * {
      /* font-family: 'East Sea Dokdo', cursive; */
      /* font-family: 'Nanum Brush Script', cursive; */
      /* font-family: 'Nanum Pen Script', cursive; */
      font-family: "Hi Melody", cursive;
    }
  </style>
  <body>
    <div id="aa">
      <header>
        <a href="/main" target="">
          <img width="170" height="48" src="images/main_logo.png" align="right" style="margin-right:30px" />
        </a>
        <div>
          <!-- <h3 align="right">메인으로 가기　</h3> -->
        </div>
      </header>
      <nav>
        <br />
        <h1 style="font-size: 34px" align="center">
          오늘 하루도 고생했어요<br />You've been through a lot today,
          <br /><br />
          감정을 선택해 주세요<br />Please select your mood
        </h1>
        <!-- <div>
          <img width="694" height="246" src="letter2.png" align="center" />
        </div> -->
        <br />
        <br />
        <br />
        <div id="nav_div_box">
          <div class="sunny">
            <a href="/board/weather/sunny" target="">
              <img width="210" height="210" src="images/sunny.png" />
            </a>
          </div>
          <div class="cloudy">
            <a href="/board/weather/cloudy" target="">
              <img width="210" height="210" src="images/cloudy.png" />
            </a>
          </div>
          <div class="rainy">
            <a href="/board/weather/rainy" target="">
              <img width="210" height="210" src="images/rainy.png" />
            </a>
          </div>
        </div>
      </nav>
      <footer></footer>
    </div>
  </body>
</html>