$(function() {//페이지가 로딩될때
	showList();
	showPage();
});//page loading function end  

let replyUL = $(".chat");
let replyPageFooter = $(".panel-footer");

function showList() {
	getList({ board_no: board_no, sno: sno, eno: eno })
		.then(list => {
			let str = ""

			for (var i = 0; i < list.length; i++) {
				str += "<li class='list-group-item' data-reply_no='" + list[i].reply_no + "'>";
				str += "<div><div class='header'><strong class='primary-font'>" + list[i].username + "</strong>";
				str += "<small class='pull-right text-muted'>" + list[i].create_date + "</small></div>";
				str += replaceAll(list[i].content, '\n', '<br>') + "</div></li>";
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


function showPage() {
	getPage(param)
		.then(paging => {
			console.log(paging);
			let str = "<div><small class='text-muted'>" + paging + "</small></div>";

			replyPageFooter.html(str);
		});
}
let modal = $(".modal");
let modalInputContent = modal.find("textarea[name='content']");

let modalModBtn = $("#modalModBtn");
let modalRemoveBtn = $("#modalRemoveBtn");
let modalRegisterBtn = $("#modalRegisterBtn");

$("#modalCloseBtn").on("click", function(e) {
	modal.modal('hide');
});

$("#addReplyBtn").on("click", function(e) {
	modalInputContent.val("");
	modal.find("button[username !='modalCloseBtn']").hide();

	modalRegisterBtn.show();

	$(".modal").modal("show");

});

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
			showPage();

		}); //end add

}); //end modalRegisterBtn.on

$(".chat").on("click", "li", function (e) {
 
  let reply_no = $(this).data("reply_no");
 // alert(reply_no);
 
   get(reply_no)
    .then(reply => {
 
      modalInputContent.val(reply.content);
      modal.data("reply_no", reply.reply_no);
 
      modal.find("button[username !='modalCloseBtn']").hide();
 
      modalModBtn.show();
      modalRemoveBtn.show();
 
      $(".modal").modal("show");
 
    });
});

 //댓글 수정
modalModBtn.on("click", function (e) {
 
  let reply = { reply_no: modal.data("reply_no"), content: modalInputContent.val() };
  update(reply)
    .then(result => {
      modal.modal("hide");
      showList();
      showPage();
    });
 
});//modify
 
//댓글 삭제
modalRemoveBtn.on("click", function (e) {
 
  let reply_no = modal.data("reply_no"); 
  remove(reply_no)
    .then(result => {
      modal.modal("hide");
      showList();
      showPage();
    });
 
});//remove

