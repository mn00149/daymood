function functionData(data, name) {
	var strArray = name.split(',');
	var name = $(data).text();
	var src = strArray[0];
	var img = strArray[1];
	$('#name_input').val(name);
	$('#src_input').val(src);
	$('#img_input').val(img);
}

$(function() {
	
	$("#modal_button").click(function() {
		let naver_data = $("#name_input").val();
		
		 $.ajax({
         	type : "POST",
         	url : "/naverapi",
         	dataType: "json",
         	data : {'naver_data' : naver_data},
         	success : function(data) {
	
				$(data).each(function() {
					let a = document.createElement('a');
					let modal_content = document.getElementById('modal_content');
					a.innerText = "";
					a.innerHTML += this.title + "<br>";
					let link = this.link;
					let image = this.image
					let ab = link + "," + image;
					a.setAttribute('name', ab);
					a.setAttribute('onclick', 'functionData(innerHTML, name)');
					modal_content.appendChild(a);
					
				});
			},
         	error : function() {
            	alert("영화 제목을 다시 입력해 주세요.");
         	}
     	});
		
		 $(".modal").fadeIn();
	});
	
	$(".modal_content").click(function() {
		$(".modal").fadeOut();
	})
})