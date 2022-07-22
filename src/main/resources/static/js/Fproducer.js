function getList() {
	let user_no = 1;
	/*         let sno = param.sno;
			 let eno = param.eno;*/
	return fetch(`/mypage/my_friends/${user_no}`, { method: 'get' })
		.then(response => response.json())
		.catch(console.log)
}

function remove(f_no) {
        return fetch(`/mypage/my_friends/${f_no}`,{method: 'delete'})
               .then(response => response.text())
               .catch(console.log);
}

function getrequest() {
	let t_id = 1;
	
	return fetch(`/mypage/request_friends/${t_id}`, {method : 'get'} )
		.then(response => response.json())
		.catch(console.log)
}

function accept(user_no){
	return fetch('/mypage/request_friends',{ method: 'post'})
                .then(response => response.json())
                .catch(console.log);
}