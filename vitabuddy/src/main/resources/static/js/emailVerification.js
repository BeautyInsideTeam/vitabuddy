/*
1. 버튼 클릭 시, 이메일 인증 바로 밑에 인증번호 입력 칸 추가
2. 버튼 클릭 시, 사용자가 입력한 이메일을 서버로 넘겨서 해당 주소로 인증번호 전송
*/

$(function(){
    $("#verificationEmail").on("click", function(event){
        event.preventDefault();

        var userEmail = $('#userEmail').val();

        if(validateEmail(userEmail)){  // true, false값
            //유효성 검사에 통과했다면 == true라면

                $.ajax({
                    type: "POST",
                    url: "/member/emailverify",
                    //contentType: "application/json",
                    data: {"userEmail": userEmail},
                    success: function(data){
                        console.log("서버에서 받은 인증코드입니다" + data);  //data 찍어보기 -> 성공
                        alert("해당 이메일 주소로 인증코드가 전송되었습니다.");

                        // 인증번호 입력 필드 추가
                        $('#verificationEmailCode').html(`
                            <label>인증코드 입력</label>
                            <input type="text" name="verificationEmailCode" id="verificationEmailCode" onchange="emailCheck()" required/>
                            <button type="button" id="verificationEmailCode">인증하기</button><br>
                        `);

                    },
                    error: function(){
                        alert("오류가 발생했습니다. 다시 시도해주세요");

                    }

                });  //ajax 종료

        }else{
            alert("올바른 이메일 형식이 아닙니다. 다시 입력해주세요");
        }

    });

});



function validateEmail(email){
    var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
}



/*25/01/05 이메일 중복체크 구현*/
//이메일 중복체크
var email = 0;
function emailCheckfromDB() {
    var userEmail = document.getElementById("userEmail").value;

    //ajax 코드
    $.ajax({
        type: "GET",
        url: "/member/checkEmail",
        data : {"userEmail" : userEmail},
        dataType: "text",
        success: function(data){
            console.log(data);

            var verificationBtn = document.getElementById('verificationEmail');
            var emOK = document.getElementById('emOk');

            if(data=="0"){
                emOK.innerHTML = "중복된 이메일입니다. 다른 이메일을 입력해주세요.";
                emOK.style.color = 'red';
                email = 0;

                //버튼 비활성화
                verificationBtn.disabled=true;
                verificationButton.style.backgroundColor = '#cccccc';
                verificationButton.style.cursor = 'not-allowed';

            }else{
                document.getElementById('emOk').innerHTML = "사용 가능한 이메일입니다.";
                document.getElementById('emOk').style.color = 'green';
                email = 1;

                //버튼 활성화
                verificationBtn.disabled=false;
                verificationButton.style.backgroundColor = '';
                verificationButton.style.cursor = '';
            }


        },
        error: function(error){
            alert("오류가 발생했습니다. 다시 시도해주세요");
        }


    });  //ajax 종료


}



