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

let sBtn = document.querySelector(".btn-open-popup")
/*let sendok = document.getElementById('msg_submit');
let sendno = document.getElementById('modal_close');*/
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

sBtn.addEventListener('click', () => {
	profile.classList.add('container__menu--hidden');
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
	

/* 쪽지보내기 */
    const body = document.querySelector('body');
    const modal = document.querySelector('.modal');
    const btnOpenPopup = document.querySelector('.btn-open-popup');
	const close = document.querySelector('#modal_close');
	const msg_submit = document.querySelector('#msg_submit');


    btnOpenPopup.addEventListener('click', () => {
	
      modal.classList.add('show');
     
    });
	close.addEventListener('click', () =>{
		modal.classList.remove('show')
	})
	msg_submit.addEventListener('click', () =>{
		modal.classList.remove('show')
	})
	
	
    modal.addEventListener('click', (event) => {
      if (event.target === modal) {
        modal.classList.toggle('show');

        if (!modal.classList.contains('show')) {
          body.style.overflow = 'auto';
        }
      }
    });


   $("#msg_submit").click(function(){
        let msg= "쪽지를 보내시겠습니까?";
		let content = $("#content").val()
		
        if(!confirm(msg))
            return false;
	
        $.ajax({
            url : "/letter_send_profile",
            dataType : "json",
            type : "post",
            data : {"other_name":id,
            		"content":content},
        })
        	alert ("전송");
      
    });
    