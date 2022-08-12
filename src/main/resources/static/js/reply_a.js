$(function() {//페이지가 로딩될때
	showList();
	//showPage();
});//page loading function end  

let replyUL = $(".chat");
let replyPageFooter = $(".panel-footer");

   

function showList() {
	getList({ board_no: board_no, sno: sno, eno: eno })
		.then(list => {
			let str = ""
			let replyList = new Array();
			let reReplyList = new Array();

			for (var i = 0; i < list.length; i++) {
				if(list[i].ansnum == 0){
					replyList.push(list[i]);
				}
				else{
					reReplyList.push(list[i]);
				}
			}
			
			for (var i = 0; i < replyList.length; i++) {
				str += "<li class='list-group-item' data-reply_no='" + replyList[i].reply_no + "'>";
				str += "<div><div class='header'><strong class='primary-font'>" + replyList[i].username + "</strong>";
				str += "<small class='pull-right text-muted'>" + replyList[i].create_date + "</small></div>";
				str += replaceAll(replyList[i].content, '\n', '<br>') + "</div></li>";
				for(var j = 0; j<reReplyList.length;j++){
					if(reReplyList[j].indent == replyList[i].reply_no){
						str += "<li class='list-group-item' data-reply_no='" + reReplyList[j].reply_no + "'>";
						str += "<div><div class='header'><strong class='primary-font'>" + "&emsp;&ensp;" + reReplyList[j].username + "</strong>";
						str += "<small class='pull-right text-muted'>" + reReplyList[j].create_date + "</small></div>";
						str += "&emsp;&ensp;"+replaceAll(reReplyList[j].content, '\n', '<br>') + "</div></li>";
					}
				}
			}

			replyUL.html(str);
		});

}//showList() end

function replaceAll(str, searchStr, replaceStr) {
	return str.split(searchStr).join(replaceStr);
}
let param = '';
param = "nPage=" + nPage;
param += "&nowPage=" + nowPage;
param += "&board_no=" + board_no;
param += "&col=" + colx;
param += "&word=" + wordx;


//function showPage() {
//	getPage(param)
//		.then(paging => {
//			console.log(paging);
//			let str = "<div><small class='text-muted'>" + paging + "</small></div>";
//
//			replyPageFooter.html(str);
//		});
//}
let modal = $(".modal");
let modalInputContent = modal.find("textarea[name='content']");

let modalModBtn = $("#modalModBtn");
let modalRemoveBtn = $("#modalRemoveBtn");
let modalRegisterBtn = $("#modalRegisterBtn");
let modalRecommentBtn = $("#modalRecommentBtn");
let modalRecoRegisterBtn = $("#modalRecoRegisterBtn");


$("#modalCloseBtn").on("click", function(e) {
	modal.modal('hide');
});

// 페이지 속 댓글 쓰기 버튼
$("#addReplyBtn").on("click", function(e) {
	

		if(username == null || username == ""){
		if(confirm("로그인이 필요합니다. ")){
			return;
		}
	}else{
	modalInputContent.val("");
	modal.find("button[username !='modalCloseBtn']").hide();

	modalRegisterBtn.show();

	$(".modal").modal("show");
 }
});

//댓글 입력
modalRegisterBtn.on("click", function(e) {


	if (modalInputContent.val() == '') {
		alert("댓글을 입력하세요")
		return;
	}

	let reply = {
		content: modalInputContent.val(),
		username: username,
		board_no: board_no,
		user_no : user_no
	};
	add(reply)
		.then(result => {
			modal.find("input").val("");
			modal.modal("hide");

			showList();
			//showPage();

		});

}); // add

//댓글 클릭
$(".chat").on("click", "li", function (e) {
 
 
  let reply_no = $(this).data("reply_no");
  indent = reply_no;
   get(reply_no)
    .then(reply => {
 
      modalInputContent.val(reply.content);
      modal.data("reply_no", reply.reply_no);
      modal.find("button[username !='modalCloseBtn']").hide();
	
	// 로그인을 했다면 답글쓰기 버튼이 보인다
	if(username != null || username != ""){
    modalRecommentBtn.show();
	}  
	
	// 로그인 한 사람이 댓글을 쓴 사람이라면 수정/삭제 버튼이 보인다.
 	if(user_no==reply.user_no){
	modalModBtn.show();
    modalRemoveBtn.show();  
}
      $(".modal").modal("show");
 
    });
}); //click

 //댓글 수정
modalModBtn.on("click", function (e) {
  alert("댓글이 수정되었습니다.");
  let reply = { reply_no: modal.data("reply_no"), content: modalInputContent.val() };
  update(reply)
    .then(result => {
      modal.modal("hide");
      showList();
      //showPage();
    });
 
});//modify
 
//댓글 삭제
modalRemoveBtn.on("click", function (e) {
 
 alert("댓글이 삭제되었습니다.");
  let reply_no = modal.data("reply_no"); 
  remove(reply_no)
    .then(result => {
      modal.modal("hide");
      showList();
      //showPage();
    });
 
});//remove

//답글 쓰기
$("#modalRecommentBtn").on("click", function(e) {
	
		if(username == null || username == ""){
		if(confirm("로그인이 필요합니다. ")){
			return;
		}
	}else{
	modalInputContent.val("");
	modal.find("button[username !='modalCloseBtn']").hide();

	modalRecoRegisterBtn.show();

	$(".modal").modal("show");
 }
});

// 답글 생성
modalRecoRegisterBtn.on("click", function (e) {
	if (modalInputContent.val() == '') {
		alert("답글을 입력하세요")
		return;
	}

	let reply = {
		content: modalInputContent.val(),
		username: username,
		board_no: board_no,
		user_no : user_no,
		reply_no : indent
	};
	add2(reply)
		.then(result => {
			modal.find("input").val("");
			modal.modal("hide");

			showList();
			//showPage();

		}); 

});