<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>챗봇</title>
<link rel="stylesheet" href="css/chatbot1_style.css">
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>
<%-- WebSocket 관련 설정 --%>
<script src="/js/sockjs.min.js"></script>  <%--/static 폴더 기준 --%>
<script src="/js/stomp.min.js"></script>  <%--/static 폴더 기준 --%>
<script type="text/JavaScript" src="/js/app.js"></script>  <%--/static 폴더 기준 --%>
<script type="text/javascript">

	function Show(){
		document.getElementById("#conversation").style.display= "";
	}
	function Hide(){
		document.getElementById("#conversation").style.display = "none";
	}
	
</script>
</head>
<body>
    <div id="ch-chatbot">
      <div class="Backgroundstyle">
        <div class="chattool">
         <div class="chatdetail">
         <div class="chat_head">
            <div class="content">
                <div class="chat_head_content con">
                    <div class="chat_head_content_con con2">
                    <div class="chat_img" size="30">
                       <!--  <img width="30" height="30" src="https://cdn.discordapp.com/attachments/988657663237828618/1002810088538513428/Untitled-1.png"> -->
                    </div>
                    <span class="chat_head Text">
                        <img width="225" height="60"  src="https://cdn.discordapp.com/attachments/988657663237828618/1003489454138343454/logo_daymood.png">
                    </span>
                </div>
                </div>
                <div class="head_right">
                    <button class="back" onclick="location.href='http://localhost:8080'">
                        <svg width="20" height="20" viewBox="0 0 13 20" fill="none" xmlns="http://www.w3.org/2000/svg" foundation="[object Object]" class="cancel" defaultopacity="1" hoveredopacity="1" magintop="0" marginright="0" maginbottom="0" marginleft="0" withtheme="true" >
                            <path fill="currentColor" fill-rule="evenodd" clip-rule="evenodd" d="M9.17255 16.4226C8.84711 16.748 8.31947 16.748 7.99404 16.4226L2.1607 10.5893C1.83527 10.2638 1.83527 9.73619 2.1607 9.41075L7.99404 3.57742C8.31947 3.25198 8.84711 3.25198 9.17255 3.57742C9.49799 3.90285 9.49799 4.43049 9.17255 4.75593L3.92847 10L9.17255 15.2441C9.49799 15.5695 9.49799 16.0972 9.17255 16.4226Z"></path>
                        </svg>
                    </button>
                </div>
            </div>
         </div>
         <div class="QA">
                <button type="submit" id="connect" class="connect" >
                    <div name="send-munyi"  class="send-munyi">
                    	<img width="23px" height="23px" src="/images/bubble.png"> 문의하기
                    </div>
                </button>
          </div>
 <!--           <div class="End">
          	<button type="submit" id="disconnect" class="disconnect" >
          		<div name="end-munyi" width="20" height="20" size="20" class="end-munyi">
          			문의종료
          		</div>
          	</button>
          </div> -->
         
            <div class="Content-ch-front maintool" id="conversation">
                     <div class="Content-ch-front imgtexttool" >
                        <div class="Content-ch-front imges" size="36">
                            <img width="38" height="45" src="https://cdn.discordapp.com/attachments/988657663237828618/1003489493136974016/logo.png">
                        </div>
                        <div class="Content-ch-front texttool">
                          <div class="Content-ch-front nickname">   
                                <div class="Content-ch-front text1">
                                <form class="munyihagitool">
                                   <select id="msg">
                                   		<option>DayMood란?</option>
                                   		<option>하남자는</option>
                                   		<option>오이눙은</option>
                                   		<option>최욱진은</option>
                                   		<option>이승찬은</option>
                                   		<option>이청우는</option>
                                   		<option>우영우</option>
                                   </select>
                                   <button type="button" id="send"></button>
                                </form>
                                </div> 
                            </div> 
                        </div>
              	</div>
              	    <div class="row">
        <div class="col-md-12">
            <table id="conversation" class="table table-striped">
                <thead>

                </thead>
                <tbody id="communicate">
                </tbody>
            </table>
        </div>
    </div>
            </div> <!-- conversation 종료 -->

         </div> <!-- chatdetail 종료 -->
        </div>
     </div>
    </div>
</body>
</html>