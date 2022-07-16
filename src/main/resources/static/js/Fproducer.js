function getList() {
	let username = '홍길동';
	/*         let sno = param.sno;
			 let eno = param.eno;*/
	return fetch(`/mypage/my_friends/${username}`, { method: 'get' })
		.then(response => response.json())
		.catch(console.log)
}

function remove(friend_no) {
        return fetch(`/mypage/my_friends/${friend_no}`,{method: 'delete'})
               .then(response => response.text())
               .catch(console.log);
}

function getrequest() {
	let username = '홍길동';
	
	return fetch(`/mypage/request_friends/${username}`, {method : 'get'} )
		.then(response => response.json())
		.catch(console.log)
}

function accept(user_no){
	return fetch('/mypage/request_friends',{ method: 'post'})
                .then(response => response.json())
                .catch(console.log);
}