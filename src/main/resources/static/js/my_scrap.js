/*let slist = $(".scraplist");
$(function() {
	scrapList();
});


function getscrapList() {
	let user_no = 1;

	return fetch(`/mypage/my_scrap/${user_no}`, { method: 'get' })
		.then(response => response.json())
		.catch(console.log)
}

function scrapList() {
	getscrapList()
		.then(list => {
			let str = "";
			console.log(list)
			for (var i = 0; i < list.length; i++) {
				str += "<tr>";
				str += "<td>" + list[i].weather_category + "</td>";
				str += "<td>" + list[i].author + "</td>";
				str += "<td>" + list[i].title + "</td>";
				str += "<td>" + list[i].nation + "</td>";
				str += "<td>" + list[i].create_date.substr(0, 10) + "</td>";
				str += "<td> <button onclick = rm(" + list[i].scrapno + ")> <i class='fa-solid fa-trash'></i> </button> </td>";
			}
			slist.html(str);
		})
};*/

function remove(scrapno) {
        return fetch(`/mypage/my_scrap/${scrapno}`,{method: 'delete'})
               .then(response => response.text())
               .catch(console.log);
}

function rm(scrapno) {
	if(confirm("정말 삭제하시겠습니까?")){
		remove(scrapno)
		.then(result => {location.reload();})
		}
}