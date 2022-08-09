

$(function() {
	$('body').click(function(e) {
		if (e.target.className !== "username2" && !profile.contains(e.target)) {
			//console.log(e.target);
			profile.classList.add('container__menu--hidden');
		}
	})

})
let id = '';
let user_no = '';
document.addEventListener('DOMContentLoaded', function() {
	const ele = document.querySelectorAll('.username2');
	const profile = document.getElementById('profile');

	ele.forEach(ele => {
		ele.addEventListener('click', function(e) {
			e.preventDefault();

			// const rect = ele.getBoundingClientRect();
			// const x = e.clientX - rect.left;
			// const y = e.clientY - rect.top;
			const x = e.clientX;
			const y = e.clientY;
			// Set the position for menu
			profile.style.zIndex = 9999;
			profile.style.top = `${y}px`;
			profile.style.left = `${x}px`;

			// Show the menu
			id =ele.textContent;
			user_no = e.target.getAttribute("data-value");
			profile.classList.remove('container__menu--hidden');
		});
	})


});

let reqBtn = document.querySelector(".req-btn");
let okbtn = document.querySelector('.ok-btn');
let noBtn = document.querySelector('.no-btn');
let popupBox = document.querySelector('.popup-overlay');
let userid = document.getElementById('userid');

let sendBtn = document.querySelector(".send-btn");
let letterBox = document.querySelector('.popup-overlay-letter');

reqBtn.addEventListener('click', () => {
	popupBox.classList.add('active2')
	userid.innerText = id;
	profile.classList.add('container__menu--hidden');
})

okbtn.addEventListener('click', () => {
	
	add(user_no)
		.then(result => {
			popupBox.classList.remove('active2');
		}); 
	
})

noBtn.addEventListener('click', () => {
	popupBox.classList.remove('active2')
})

$(document).mouseup(function(e) {

	var container = $(popupBox);

	if (container.has(e.target).length === 0) {
		popupBox.classList.remove('active2')
	}

});

/*친구 추가를 위한 fetch*/

function add(user_no) {
        return fetch(`/board/req/${user_no}`,{method: 'get'})
               .then(response => response.text())
               .catch(console.log);
}

/* 작성 글 확인 */

function posted() {
		let url = '/posted/' + user_no;
		location.href = url;
	}
	
/*보드에서 쪽지 보내기 창으로 이동*/
function sendLetter() {
		let url = '/sendLetter?recv_name=' + id;
		window.open(url)
	}