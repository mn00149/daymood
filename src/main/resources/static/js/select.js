function select_boardChange(e) {
	var weather = ["감정을 선택해 주세요.", "맑음", "흐림", "비"];
	var info = ["지역을 선택해 주세요.","미국", "중국", "일본", "캐나다", "호주", "유럽", "기타"];
	var recommend = ["추천 항목을 선택해 주세요.","영화", "도서", "음악"];
	var target = document.getElementById("select_category");

	if (e.value == "a") var d = weather;
	else if (e.value == "b") var d = info;
	else if (e.value == "c") var d = recommend;

	target.options.length = 0;

	for (x in d) {
		var opt = document.createElement("option");
		opt.value = d[x];
		opt.innerHTML = d[x];
		target.appendChild(opt);
	}
}

window.onload = function(){
		let select1 = document.getElementById("select_board");
		let select2 = document.getElementById("select_category");
		let referrer = document.referrer;
		   if (referrer.includes('weather')){
			   $(select1).val('a').prop("selected", true)
			   var weather = ["감정을 선택해 주세요.", "맑음", "흐림", "비"];
			   var d = weather;
			   select2.options.length = 0;
			   for (x in d) {
					var opt = document.createElement("option");
					opt.value = d[x];
					opt.innerHTML = d[x];
					select2.appendChild(opt);
				}
			   if(referrer.includes('sunny')){
				   $(select2).val("맑음").prop("selected",true);
			   }
			   else if(referrer.includes('cloudy')){
				   $(select2).val("흐림").prop("selected",true);
			   }
			   else if(referrer.includes('rainy')){
				   $(select2).val("비").prop("selected",true);
			   }
		   }
		   else if(referrer.includes('info')){
			   $(select1).val('b').prop("selected", true)
			   var info = ["지역을 선택해 주세요.","미국", "중국", "일본", "캐나다", "호주", "유럽", "기타"];
			   var d = info;
			   select2.options.length = 0;
			   for (x in d) {
					var opt = document.createElement("option");
					opt.value = d[x];
					opt.innerHTML = d[x];
					select2.appendChild(opt);
				}
			   if(referrer.includes('america')){
				   $(select2).val("미국").prop("selected",true);
			   }
			   else if(referrer.includes('australia')){
				   $(select2).val("호주").prop("selected",true);
			   }
			   else if(referrer.includes('canada')){
				   $(select2).val("캐나다").prop("selected",true);
			   }
			   else if(referrer.includes('china')){
				   $(select2).val("중국").prop("selected",true);
			   }
			   else if(referrer.includes('europe')){
				   $(select2).val("유럽").prop("selected",true);
			   }
			   else if(referrer.includes('japan')){
				   $(select2).val("일본").prop("selected",true);
			   }
			   else if(referrer.includes('etc')){
				   $(select2).val("기타").prop("selected",true);
			   }
		}
		   
		   else if(referrer.includes('recommend')){
			   $(select1).val('c').prop("selected", true)
			   var recommend = ["추천 항목을 선택해 주세요.","영화", "도서", "음악"];
			   var d = recommend;
			   select2.options.length = 0;
			   for (x in d) {
					var opt = document.createElement("option");
					opt.value = d[x];
					opt.innerHTML = d[x];
					select2.appendChild(opt);
				}
			   if(referrer.includes('book')){
				   $(select2).val("도서").prop("selected",true);
			   }
			   else if(referrer.includes('movie')){
				   $(select2).val("영화").prop("selected",true);
			   }
			   else if(referrer.includes('music')){
				   $(select2).val("음악").prop("selected",true);
			   }
			   
		}
		   
	}

