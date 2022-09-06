function getList() {
	/*         let sno = param.sno;
			 let eno = param.eno;*/
	return fetch(`/mypage/my_friends2`, { method: 'get' })
		.then(response => response.json())
		.catch(console.log)
}

function remove(friends_no) {
        return fetch(`/mypage/my_friends/${friends_no}`,{method: 'delete'})
               .then(response => response.text())
               .catch(console.log);
}

/*function getrequest() {
	return fetch(`/mypage/request_friends/${t_id}`, {method : 'get'} )
		.then(response => response.json())
		.catch(console.log)
}*/

function accept(user_no){
	return fetch('/mypage/request_friends',{ method: 'post'})
                .then(response => response.json())
                .catch(console.log);
}