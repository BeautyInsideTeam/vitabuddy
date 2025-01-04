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






