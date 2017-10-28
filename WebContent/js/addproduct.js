function aa(e) {
	var file = e.files[0];
	console.log(e.id.replace("xx", "yy"));

	if (file) {
		// 讀取檔案
		var fileReader = new FileReader();
		fileReader.onload = function(event) {// 讀取完後執行的動作
			console.dir(event);
			document.getElementById(e.id.replace("xx", "ss")).src = event.target.result;
		};
		fileReader.readAsDataURL(file);// 讀取檔案內容,以DataURL格式回傳結果
	}
}
