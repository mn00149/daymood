$(function () {//페이지가 로딩될때
   showList();
});//page loading function end  


let friend = $(".friendlist");
let reqf = $(".requestlist");

function showList() {
    getList()
    .then(list => {
      let str = ""
      console.log(list);
      for (var i = 0; i < list.length ; i++) {
        str += "<tr>";
        str += "<td><img src='/images/daymood.png'/></td>";
        str += "<td>"+list[i].list[0].username+"</td>";
        str += "<td>"+list[i].list[0].nation+'</td>';
        str += "<td>"+list[i].list[0].email+'</td>';
        str += "<td>"+list[i].list[0].createDate+'</td>';
        str += "<td><button onclick = rm("+list[i].f_no+")><i class='fa-solid fa-trash'></i></button></td>";
        str += "</tr>";
      }
      friend.html(str);
    });

}//showList() end

function rm(friends_no) {
	console.log(friends_no);
	if(confirm("정말 삭제하시겠습니까?")){
		remove(friends_no)
		.then(result => {showList();})
		}
}

function requestlist() {
	getrequest()
    .then(list => {
      let str = ""
      for (var i = 0; i < list.length ; i++) {
        str += "<tr>";
        str += "<td><img src='/images/daymood.png'/></td>";
        str += "<td>"+list[i].f_id+"</td>";
        str += "<td>"+list[i].nation+'</td>';
        str += "<td>"+list[i].email+'</td>';
        str += "<td>"+list[i].createDate+'</td>';
        str += "<td><button><i class='fa-solid fa-check'></i></button>"
        "<button onclick = rm("+list[i].request_no+")><i class='fa-solid fa-x'></i></button></td>";
        str += "</tr>";
      }
      reqf.html(str);
    });
}
