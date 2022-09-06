let reqBtn = document.querySelector(".req-btn");
let okBtn = document.querySelector('.ok-btn');
let noBtn = document.querySelector('.no-btn');
let popupBox = document.querySelector('.popup-overlay');
let popuplayer = document.querySelector('.popup-box-container');
let preview = document.querySelector('.mb_table').getElementsByTagName('tr')[4].getElementsByTagName('td')[0];
let imgsrc = '';

reqBtn.addEventListener('click',() => {
    popupBox.classList.add('active2')
})

okBtn.addEventListener('click',() => {
    popupBox.classList.remove('active2')
	//document.querySelector('.mb_table').getElementsByTagName('tr')[4].getElementsByTagName('td')[0].innerText = 123;
	$(".user_image").attr("src", imgsrc);
	let findsrc = imgsrc.indexOf('/images');
	$("#user_image").attr("value", imgsrc.substring(findsrc));
	$(".user_image").attr("style", "width: 50px; height: 50px");
})

noBtn.addEventListener('click',() => {
    popupBox.classList.remove('active2')
})

$(document).mouseup(function (e){

	var container = $(popupBox);

	if( container.has(e.target).length === 0){
	popupBox.classList.remove('active2')
	}

});

$(".my").click(function(e){
    var el = $(e.target).closest('li')
    el.siblings('li').removeClass("liborder");
    el.addClass("liborder");
	imgsrc = e.target.src;
});

$("#update").click(function(e){
	
	let data = {
		user_no : $("#user_no").val(),
		user_image : $("#user_image").val()
	}
	console.log(data);
	update(data)
		.then(result =>{
			alert("프로필이 수정되었습니다.");
			window.location.replace("/mypage/member");
		})
});

function update(data){
	
	return fetch('/updateMember',{
                method: 'put',
                body: JSON.stringify(data),
                headers: {'Content-Type': "application/json; charset=utf-8"}
                })
               .then(response => response.text())
               .catch(console.log);	
}


$(document).ready(function(e){
            $('.update').on('mouseenter', function(e){
                x = e.pageX - $(this).offset().left;
                y = e.pageY - $(this).offset().top;
                $(this).find('span').css({top:y, left:x})
            })
        })
        $(document).ready(function(e){
            $('.update').on('mouseout', function(e){
                x = e.pageX - $(this).offset().left;
                y = e.pageY - $(this).offset().top;
                $(this).find('span').css({top:y, left:x})
            })
        })