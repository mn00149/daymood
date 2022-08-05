console.log("*****Reply Module........");
function getList(param) {
	     let board_no = param.board_no;
         let sno = param.sno;
         let eno = param.eno;
        return fetch(`/reply/list/${board_no}/${sno}/${eno}`,{method:'get'}) 
              .then(response => response.json())
              .catch(console.log)
}

function getPage(param) {
	    let url = `/reply/page?${param}`;
		console.log(url);
        return fetch(url,{method : 'get'})
              .then(response => response.text())
              .catch(console.log)

}
    
function add(reply) {
        return fetch('/reply/create',{
                method: 'post',
                body: JSON.stringify(reply),
                headers: {'Content-Type': "application/json; charset=utf-8"}
                })
                .then(response => response.json())
                .catch(console.log);
}
 
function get(reply_no) {
        return fetch(`/reply/${reply_no}`,{method: 'get'})
               .then(response => response.json())
               .catch(console.log);
}
    
function update(reply) {
        return fetch('/reply/',{
                method: 'put',
                body: JSON.stringify(reply),
                headers: {'Content-Type': "application/json; charset=utf-8"}
                })
               .then(response => response.text())
               .catch(console.log);
}

function remove(reply_no) {
        return fetch(`/reply/${reply_no}`,{method: 'delete'})
               .then(response => response.text())
               .catch(console.log);
}

function add2(reply) {
        return fetch('/reply/re_create',{
                method: 'post',
                body: JSON.stringify(reply),
                headers: {'Content-Type': "application/json; charset=utf-8"}
                })
                .then(response => response.json())
                .catch(console.log);
}
