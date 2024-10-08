/**
 * 
 */
	var pwd = 0;
		function pwCheck(){
			var pw3 = document.getElementById('pw1').value ;
			if(pw3.length<8){
				document.getElementById('pwLeng').innerHTML="비밀번호는 8자리 이상이어야 합니다.";
		    	document.getElementById('pwLeng').style.color='red';
			}else{
				document.getElementById('pwLeng').innerHTML="";
			}
			if(document.getElementById('pw1').value != '' && document.getElementById('pw2').value!=''){
				if(document.getElementById('pw1').value ==document.getElementById('pw2').value){
				document.getElementById('pwOk').innerHTML="비밀번호가 일치합니다.";
				document.getElementById('pwOk').style.color='green';
				pwd = 1;
				 }else{
		    	document.getElementById('pwOk').innerHTML="비밀번호가 일치하지 않습니다.";
		    	document.getElementById('pwOk').style.color='red';  
		    	pwd = 0;
		    	}
		    }
		}
		
		 
		var eamil = 0;
		
		function emailCheck(){
			if(document.getElementById('email').value.indexOf("@")>0){
				document.getElementById('emOk').innerHTML="";
				email = 1;
			}else{
				document.getElementById('emOk').innerHTML="올바른 이메일 형식이 아닙니다.";
		    	document.getElementById('emOk').style.color='red'; 
				email = 0;
			}
		}
		
		var form = document.getElementById('infomation');
		
		function changeOn(){
			if(email ==1 && pwd==1){
				alert('가입됐습니다.')	;
				form.action = ""/*데이터를 받을 곳 주소*/;
				form.method = "POST";
				form.submit();
				
			}else{
				
				alert('잘못된 데이터 입니다')	;
				return false;
			}
			
		}