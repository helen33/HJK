$(function(){
	
	var note = $('#note'),
		ts = new Date(2015, 0, 1), //이게 뭔지 몰라
		newYear = true;
	
	if((new Date()) > ts){
		// The new year is here! Count towards something else.
		// Notice the *1000 at the end - time must be in milliseconds
		// 1d - 86400000 ms
		// 1h - 3600000 ms  
		// 1m - 60000 ms
		// 1s - 1000 ms
		day = parseInt($("input[name=aday]").val()) * 86400000; 
		hour = parseInt($("input[name=ahour]").val()) * 3600000; 
		minute = parseInt($("input[name=aminute]").val()) * 60000;
		a_num = $("input[name=a_num]").val();
		
		all = parseInt(day) +  parseInt(hour) +  parseInt(minute);
		
		ts = (new Date()).getTime() + parseInt(all);
		newYear = false;
	}
		
	$('#countdown').countdown({
		timestamp	: ts,
		callback	: function(days, hours, minutes, seconds, a_num){
			if(days == 0 && hours ==0 && minutes == 0 && seconds == 0){
				var message = "";
				
				message += days + " day" + ( days==1 ? '':'s' ) + ", ";
				message += hours + " hour" + ( hours==1 ? '':'s' ) + ", ";
				message += minutes + " minute" + ( minutes==1 ? '':'s' ) + " and ";
				message += seconds + " second" + ( seconds==1 ? '':'s' ) + " <br />";
				
				alert("경매가 종료되었습니다.");
				
				a_num = $("input[name=a_num]").val();
				location.href="./aumain.do?au_page=/bidend?a_num="+a_num;
				return false;				
		}else{
			var message = "";
			
			message += days + " day" + ( days==1 ? '':'s' ) + ", ";
			message += hours + " hour" + ( hours==1 ? '':'s' ) + ", ";
			message += minutes + " minute" + ( minutes==1 ? '':'s' ) + " and ";
			message += seconds + " second" + ( seconds==1 ? '':'s' ) + " <br />";
		}
		}
	});
	
});
