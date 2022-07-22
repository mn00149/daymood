function select_boardChange(e) {
	var weather = ["감정을 선택해 주세요.", "맑음", "흐림", "비"];
	var info = ["지역을 선택해 주세요.","미국", "호주", "중국"];
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

