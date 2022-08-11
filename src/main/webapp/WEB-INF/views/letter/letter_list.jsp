<%@ page contentType="text/html; charset=UTF-8" %> 
<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8">
<title>쪽지</title>
<link rel="stylesheet" href="css/letter_list.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet"/>
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js" > 
</script>
<script>
//Enter 처리
   function send() {
        $("#sendbtn").click();
    }


</script>
<head>
</head>
<body>
    <div class="let-container">
            
        <div class="letter">
    <div class="inbox_let">
            <!-- 쪽지 목록 영역-->
                <div class="inbox_people">
                    <div class="headind_srch">
                        <div class="recent_heading">
                            <h4>MoodTalk</h4>
                        </div>
                        <!-- 쪽지 검색-->
                        <div class="srch_bar">
                        	<div class="stylish-input-group">
                                <input type="text" placeholder="Search" name="word" value="${word }">
                                <span class="input-group-addon">
                                <button type="button"> <i class="fa fa-search" aria-hidden="true"></i></button>
                                </span>
                            </div>
                        </div>
                    </div>
                    <!-- 쪽지 리스트-->
                    <div class="inbox_chat">
                    
                    </div>
                </div>
                <!-- 쪽지 내용 영역-->
                <div class="lets">
                
                    <!-- 쪽지 내용 목록-->
                    <div class="let_history" name="contentList">
                    
                    </div>
                    <!-- 쪽지 내용 올 자리-->
                    <div class="send_letter">
                    
                    </div>
                    <!-- 쪽지 입력란 올자리-->
                </div>
            </div>
        </div><!--letter end-->
    </div>
<script>
    const FirstMessageList = function(){
    $.ajax({
        url:"letter_ajax_list",
        method:"get",
        data:{
        },
        success:function(data){
            console.log("메세지 리스트 리로드 성공");

            $('.inbox_chat').html(data);

            //메세지 리스트중 하나를 클릭했을 때
            $('.chat_list').on('click',function(){
                   // alert('room : '+ $(this).attr('room'));

                    let room = $(this).attr('room');
                    let other_name = $(this).attr('other-name');

                    //선택한 메세지 제외 나머지 active 효과 해제하기
                    $('.chat_list_box').not('.chat_list_box.chat_list_box'+room).removeClass('active_chat');
                    //선택한 메세지만 active 효과 주기
                    $('.chat_list_box'+room).addClass('active_chat');

                    let send_msg = "";
                    send_msg += "<div class='type_msg'>";
                    send_msg += "   <div class='input_msg_write row'>";
                    send_msg += "        <div class='col-11' id='sendsend'>";
                    send_msg += "                <textarea autofocus class='write_msg form-control' onkeyup='if(window.event.keyCode==13){send()}' id='enter'  />";
                    send_msg += "                <button class='msg_send_btn' id='sendbtn' type='button'><i class='fa fa-paper-plane-o' aria-hidden='true'></i></button>";
                    send_msg += "        </div>";
                    send_msg += "   </div>";
                    send_msg += "</div>";

                    //메세지 입력, 전송 칸
                    $('.send_letter').html(send_msg);

                    //메세지 전송버튼을 눌렀을 때
                    $('.msg_send_btn').on('click',function(){

                        //메세지 전송 함수 호출
                        SendMessage(room, other_name);

                        //전송버튼을 누르면 메세지 리스트가 리로드 되면서 현재 열린 메세지의 선택됨 표시가 사라짐.
                        //이걸 해결하기 위해 메세지 전송버튼을 누르고 메세지 리스트가 리로드되면 메세지 리스트의 첫번째(현재 열린 메세지)가 선택됨 표시 되도록 한다.
                        //$('.chat_list_box:first').addClass('active_chat');
                    });

                    //메세지 내용을 불러오는 함수 호출
                    MessageContentList(room);
            });
        }
    })
};

//메세지 리스트를 다시 가져온다.
const MessageList = function(){
        $.ajax({
            url:"letter_ajax_list",
            method:"get",
            data:{
            },
            success:function(data){
                console.log("메세지 리스트 리로드 성공");

                $('.inbox_chat').html(data);

                //메세지 리스트중 하나를 클릭했을 때
                $('.chat_list').on('click',function(){
                   // alert('room : '+ $(this).attr('room'));

                        let room = $(this).attr('room');
                        let other_name = $(this).attr('other_name');

                        //선택한 메세지빼고 나머지는 active 효과 해제하기
                        $('.chat_list_box').not('.chat_list_box.chat_list_box'+room).removeClass('active_chat');
                        //선택한 메세지만 active 효과 주기
                        $('.chat_list_box'+room).addClass('active_chat');

                        let send_msg = "";
                        send_msg += "<div class='type_msg'>";
                        send_msg += "   <div class='input_msg_write row'>";
                        send_msg += "        <div class='col-11' id='sendsend'>";
                        send_msg += "                <textarea autofocus class='write_msg form-control' onkeyup='if(window.event.keyCode==13){send()}' id='enter'  />";
                        send_msg += "                <button class='msg_send_btn' id='sendbtn' type='button'><i class='fa fa-paper-plane-o' aria-hidden='true'></i></button>";
                        send_msg += "        </div>";
                        send_msg += "   </div>";
                        send_msg += "</div>";



                        //메세지 입력, 전송 칸
                        $('.send_letter').html(send_msg);

                        //메세지 전송버튼을 눌렀을 때
                        $('.msg_send_btn').on('click',function(){

                        //메세지 전송 함수 호출
                        SendMessage(room, other_name);
                        
                      
                });
                
                //메세지 내용을 불러오는 함수 호출
                MessageContentList(room);

              });
              //전송버튼을 누르면 메세지 리스트 리로드 
              $('.chat_list_box:first').addClass('active_chat');
            }
        })
};

//메세지 내용을 가져온다.
//읽지 않은 메세지들을 읽음으로 바꾼다.
const MessageContentList = function(room){

        $.ajax({
            url:"letter_content_list",
            method:"GET",
            data:{
                    room : room,
            },
            success:function(data){
                console.log("메세지 내용 가져오기 성공");

                //메세지 내용을 html에 넣는다
                $('.let_history').html(data);

                //이 함수로 메세지 내용을 가져올때마다 스크롤을 맨아래로 가게 한다.
                $('.let_history').scrollTop($(".let_history")[0].scrollHeight);
            },
            error : function(){
                alert('메세지 내용 가져오기 실패');
            }
        })
        
        $('.unread'+room).empty();
};

//메세지를 전송하는 함수
const SendMessage = function(room, other_name){

    let content = $('.write_msg').val();

    if(content ==""){
        alert("메세지를 입력하세요!");
    }else{
        $.ajax({
            url:"letter_send_inlist",
            method:"GET",
            data:{
                room : room,
                other_name: other_name,
                content: content
            },
            success:function(data){
                console.log("메세지 전송 성공");

                //메세지 입력칸 비우기
                $('.write_msg').val("");

                //메세지 내용 리로드
                MessageContentList(room);

                //메세지 리스트 리로드
                MessageList();
            },
            error : function(){
                alert('메세지 전송 실패');
            }
        });
    }
};

$(document).ready(function(){
    //메시지 리스트 리로드
    FirstMessageList();
});


</script>
</body>
</html>