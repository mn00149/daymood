$(function () {//페이지가 로딩될때
   showList();
});//page loading function end  


let friend = $(".friendlist");

function showList() {
    getList()
    .then(list => {
      let str = ""
      for (var i = 0; i < list.length ; i++) {
        str += "<tr>";
        str += "<td><img src='/images/daymood.png'/></td>";
        str += "<td>"+list[i].friendname+"</td>";
        str += "<td>"+list[i].nation+'</td>';
        str += "<td>"+list[i].email+'</td>';
        str += "<td>"+list[i].createDate+'</td>';
        str += "<td><button onclick = rm("+list[i].friend_no+")><i class='fa-solid fa-trash'></i></button></td>";
        str += "</tr>";
      }
      friend.html(str);
    });

}//showList() end

function rm(friend_no) {
	console.log(friend_no);
	if(confirm("정말 삭제하시겠습니까?")){
		remove(friend_no)
		.then(result => {showList();})
		}
}

function request() {
}
