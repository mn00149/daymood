function functionData2(name) {
	var strArray = name.split(',');
	var title = strArray[0];
	var src = strArray[1];
	var img = strArray[2];
	$('#name_input').val(title);
	$('#src_input').val(src);
	$('#img_input').val(img);
}

$(function() {
	
	$("#modal_button").click(function() {
		let naver_data = $("#name_input").val();
		
		 $.ajax({
         	type : "POST",
         	url : "/naverapi/book",
         	dataType: "json",
         	data : {'naver_data' : naver_data},
         	success : function(data) {
	
				$(data).each(function() {
					let a = document.createElement('a');
					let modal_content = document.getElementById('modal_content');
					a.innerText = "";
					a.innerHTML += this.title + "<br>";
					let link = this.link;
					let image = this.image;
					let title = this.title;
					let ab = title + "," + link + "," + image;
					a.setAttribute('name', ab);
					a.setAttribute('onclick', 'functionData2(name)');
					modal_content.appendChild(a);
					
				});
			},
         	error : function() {
            	alert("도서 제목을 다시 입력해 주세요.");
         	}
     	});
		
		 $(".modal").fadeIn();
	});
	
	$(".modal_content").click(function() {
		$(".modal").fadeOut();
	})
})