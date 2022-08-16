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
                    <span class="chat_head Text">
                        <img class="logologo" width="225" height="60"  src="/images/main_logo.png">
                    </span>
                </div>
                </div>
            </div>
         </div>
         <div class="QA">
                <button type="submit" id="connect" class="connect" >
                    <div align="center" name="send-munyi"  class="send-munyi">
                    	문의하기
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
                            <img class="info" width="45" height="45" src="/images/information.png">
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