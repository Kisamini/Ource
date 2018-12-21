;(function(window) {
	var dateUtil = function (data){
		var sec = 60;
		var mins = 60;
		var hours = 24;
		var days = 31;
		var month =12;
		 
		 // 현재시간
		var tday = new Date();
		var cday = new Date(data);
		var difftime = Math.floor((tday - cday)/1000);
		var msg="";
		
		if (data == "0000-00-00 00:00:00") {
			msg = 0;
		} else if (difftime < sec) {
			msg="방금";
		} else if ((difftime /= sec) < mins) {
			msg=Math.floor(difftime) + "분";
		} else if ((difftime /= mins) < hours) {
			msg=Math.floor(difftime) + "시간";
		} else if ((difftime /= hours) < days) {
			msg=Math.floor(difftime) + "일";
		} else if ((difftime /= days) < month) {
			msg=Math.floor(difftime) + "달";
		} else {
			msg=Math.floor(difftime / 12) + "년";
		}

		return msg;
	}
	
	window.dateUtil = dateUtil;
} )(window);
