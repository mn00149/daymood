let reqf = $(".requestlist");
$(function () {//페이지가 로딩될때
	requestlist();
	});//page loading function end  
	
function getrequest() {
	return fetch(`/mypage/request_friends2`, {method : 'get'} )
		.then(response => response.json())
		.catch(console.log)
}

function requestlist() {
	getrequest()
    .then(list => {
      let str = ""
      //console.log(list);
      for (var i = 0; i < list.length; i++) {
        str += "<tr>";
        str += "<td><img src='/images/daymood.png'/></td>";
        str += "<td>"+list[i].username+"</td>";
        str += "<td>"+list[i].nation+'</td>';
        str += "<td>"+list[i].email+'</td>';
        str += "<td>"+list[i].createDate+'</td>';
        str += "<td><button onclick = addfriend("+list[i].rlist[0].request_no+ ',' + list[i].rlist[0].f_id+','+list[i].rlist[0].t_id+")><i class='fa-solid fa-check'></i></button>"+
        "<button onclick = rm("+list[i].rlist[0].request_no+")><i class='fa-solid fa-x'></i></button></td>";
        str += "</tr>";
      }
      reqf.html(str);
    });
}

function remove(request_no) {
        return fetch(`/mypage/request_friends/${request_no}`,{method: 'delete'})
               .then(response => response.text())
               .catch(console.log);
}

function add(f_id, t_id) {
	return fetch(`/mypage/request_friends/${f_id}/${t_id}`, {method: 'post'})
			.then(response => response.text())
			.catch(alert("이미 친구 목록에 있습니다."))
}


function rm(request_no) {
	if(confirm("정말 삭제하시겠습니까?")){
		remove(request_no)
		.then(result => {requestlist();})
		}
}

function addfriend(request_no,f_id,t_id) {
	if(confirm("수락하시겠습니까?")) {
		//console.log(f_id + t_id);
		add(f_id, t_id)
		.then (result => remove(request_no))
		.then (result => requestlist());
	}
}