$(function(){
    //original field values
    var field_values = {
            //id        :  value
            'm_id'  : 'm_id',
            'm_pass'  : 'm_pass',
            'm_pass2' : 'm_pass2',
            'm_name'  : 'm_name',
            'm_email'  : 'email address',
			'm_phone'  :  'm_phone',
			'm_birthy'  :  'm_birth',
			'm_birthm'  :  'm_birthm',
			'm_birthd'  :  'm_birthd',
			'Zip_code'  : 'Zip_code',
			'm_addr'  : 'm_addr'
    };


    //inputfocus iuput창에 커서가 들어왔을때 표시 소스
    $('input#id').inputfocus({ value: field_values['m_id'] });
    $('input#pass').inputfocus({ value: field_values['m_pass'] });
    $('input#pass2').inputfocus({ value: field_values['m_pass2'] }); 
	$('input#name').inputfocus({ value: field_values['m_name'] });
	$('input#email').inputfocus({ value: field_values['m_email'] }); 
    $('input#phone').inputfocus({ value: field_values['m_phone'] });
	$('input#birthy').inputfocus({ value: field_values['m_birth'] });
	$('input#birthm').inputfocus({ value: field_values['m_birthm'] });
	$('input#birthd').inputfocus({ value: field_values['m_birthd'] });
	$('input#Zip_code').inputfocus({ value: field_values['Zip_code'] }); 
	$('input#addr').inputfocus({ value: field_values['m_addr'] }); 
    




    //reset progress bar
    $('#progress').css('width','0');
    $('#progress_text').html('0% Complete');

    //first_step
    $('form').submit(function(){ return false; });
    $('#submit_first').click(function(){
        //remove classes
        $('#first_step input').removeClass('error').removeClass('valid');

        //ckeck if inputs aren't empty
        var fields = $('#first_step input[type=text], #first_step input[type=password]');
        var error = 0;
        fields.each(function(){
            var value = $(this).val();
            if( value.length<4 || value==field_values[$(this).attr('m_id')] ) {
                $(this).addClass('error');
                $(this).effect("shake", { times:3 }, 50);
                
                error++;
            } else {
                $(this).addClass('valid');
            }
        });        
        
        if(!error) {
            if( $('#m_pass').val() != $('#m_pass2').val() ) {
                    $('#first_step input[type=password]').each(function(){
                        $(this).removeClass('valid').addClass('error');
                        $(this).effect("shake", { times:3 }, 50);
                    });
                    
                    return false;
            } else {   
                //update progress bar
                $('#progress_text').html('33% Complete');
                $('#progress').css('width','113px');
                
                //slide steps
                $('#first_step').slideUp();
                $('#second_step').slideDown();     
            }               
        } else return false;
    });


    $('#submit_second').click(function(){
        //remove classes
        $('#second_step input').removeClass('error').removeClass('valid');

        var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;  
        var fields = $('#second_step input[type=text]');
        var error = 0;
        fields.each(function(){
            var value = $(this).val();
            if( value.length<1 || value==field_values[$(this).attr('m_id')] || ( $(this).attr('m_id')=='email' && !emailPattern.test(value) ) ) {
                $(this).addClass('error');
                $(this).effect("shake", { times:3 }, 50);
                
                error++;
            } else {
                $(this).addClass('valid');
            }
        });

        if(!error) {
                //update progress bar
                $('#progress_text').html('66% Complete');
                $('#progress').css('width','226px');
                
                //slide steps
                $('#second_step').slideUp();
                $('#third_step').slideDown();     
        } else return false;

    });

//우편번호 부분~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    $('#zip_code').click(function ZipCode() {
		browsing_window = window
		.open(
				"checkpost",
				"_zipinput",
				"height=300,width=600, menubar=no,directories=no,resizable=no,status=no,scrollbars=yes");
browsing_window.focus();
    });

    $('#submit_third').click(function(){
        //update progress bar
        $('#progress_text').html('100% Complete');
        $('#progress').css('width','339px');
        
        //prepare the fourth step
        var fields = new Array(
            $('#m_id').val(),
            $('#m_pass').val(),
            $('#m_email').val(),
            $('#m_name').val(),
			$('#m_phone').val(),
            $('#birthy').val() + '-' + $('#birthm').val() + '-' + $('#birthd').val(),
            $('#Zip_code').val(),
            $('#m_addr').val()                       
        );
        var tr = $('#fourth_step tr');
        tr.each(function(){
            //alert( fields[$(this).index()] )
            $(this).children('td:nth-child(2)').html(fields[$(this).index()]);
        });
                
        //slide steps
        $('#third_step').slideUp();
        $('#fourth_step').slideDown();
    });


    $('#submit_fourth').click(function(){
    	alert("회원가입이 완료되었습니다.");
        //send information to server
//    	sign.m_birth.value = sign.birthy.value + sign.birthm.vlaue + sign.birthd.value;
    	sign.m_birth.value = $('#birthy').val() + $('#birthm').val() + $('#birthd').val();
    	//jQuery:submit(); 해당 submit 버튼을 누를시 버튼을 찾아주는 역활을 한다.
    	jQuery:sign.submit();    	
        return true;
        
    });

});