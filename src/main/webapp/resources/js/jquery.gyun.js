
// JavaScript Document
	var values = [];
	var repeat;
	var sot = 0;
	// 검색 //
	function ch(ss){
		$("#list2 tr:not(:first)").remove();
		var pc_code = ss;
		var p_socket = $("input[name=socket]").val();
		var p_power = $("input[name=power]").val();
		$.ajax({
			url : "gyun_search", //컨트롤러에서 받을 url 적자
			type : "post",
			data : {pc_code: pc_code, p_socket: p_socket, p_power: p_power},
			dataType : "json",
			cache : false,
			success : function(retVal){
				values = retVal.gyun_parts_list;
				repeat = retVal.crepeat;
				for(sot=0 ; sot<repeat ; sot++){
					$("#list2").append(
							"<tr class='odd' onmouseover='cont("+sot+")' onclick='gyun_rename(" + sot + "," + pc_code + ")'>"
							+ "<th scope='row'>"
								+ "<font size='-1'>"
									+ "<span id='p_code"+sot+"' name='p_code"+sot+"'>p_code</span>"
								+ "</font>"
							+ "</th>"
							+ "<td>"
								+ "<font size='-1'>"
									+ "<span id='p_name"+sot+"' name='p_name"+sot+"'>p_name</span>"
								+ "</font>"
							+ "</td>"
							+ "<td>"
								+ "<font size='-1'>"
									+ "￦ <span id='p_fixed"+sot+"' name='p_fixed"+sot+"'>p_fixed</span>"
								+ "</font>"
								+ "<input type='hidden' id='p_num"+sot+"' name='p_num"+sot+"' value='' />"
								+ "<input type='hidden' id='p_img"+sot+"' name='p_img"+sot+"'value='' />"
								+ "<input type='hidden' id='sot"+sot+"' name='sot"+sot+"' value='"+sot+"' />"
							+ "</td>"
						+ "<tr>"
					);
				$("input[name=p_num"+sot+"]").val(retVal.gyun_parts_list[sot].P_NUM);
				$("input[name=p_img"+sot+"]").val(retVal.gyun_parts_list[sot].P_IMG);
				$("span[name=p_code"+sot+"]").text(retVal.gyun_parts_list[sot].PC_CODE);
				$("span[name=p_name"+sot+"]").text(retVal.gyun_parts_list[sot].P_NAME);
				$("span[name=p_fixed"+sot+"]").text(retVal.gyun_parts_list[sot].P_FIXED);
				}
			},
			error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       }			
		})
	}