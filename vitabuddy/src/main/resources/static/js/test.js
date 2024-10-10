var pwd = 0;
var email = 0;

function pwCheck() {
    var pw3 = document.getElementById('userPwd').value;
    if (pw3.length < 8) {
        document.getElementById('pwLeng').innerHTML = "비밀번호는 8자리 이상이어야 합니다.";
        document.getElementById('pwLeng').style.color = 'red';
    } else {
        document.getElementById('pwLeng').innerHTML = "";
    }
    if (document.getElementById('userPwd').value !== '' && document.getElementById('confirmPwd').value !== '') {
        if (document.getElementById('userPwd').value === document.getElementById('confirmPwd').value) {
            document.getElementById('pwOk').innerHTML = "비밀번호가 일치합니다.";
            document.getElementById('pwOk').style.color = 'green';
            pwd = 1;
        } else {
            document.getElementById('pwOk').innerHTML = "비밀번호가 일치하지 않습니다.";
            document.getElementById('pwOk').style.color = 'red';
            pwd = 0;
        }
    }
}

function emailCheck() {
    if (document.getElementById('userEmail').value.indexOf("@") > 0) {
        document.getElementById('emOk').innerHTML = "";
        email = 1;
    } else {
        document.getElementById('emOk').innerHTML = "올바른 이메일 형식이 아닙니다.";
        document.getElementById('emOk').style.color = 'red';
        email = 0;
    }
}

// 아이디 중복 체크
function fnDbCheckId() {
    var userId = document.getElementById("userId").value;
    
    fetch(`/member/checkId?userId=${userId}`)
        .then(response => response.json())
        .then(data => {
            if (data.available) {
                alert("사용 가능한 아이디입니다.");
            } else {
                alert("이미 사용 중인 아이디입니다.");
            }
        })
        .catch(error => console.error("Error:", error));
}



function registerMember() {
    if (email === 0 || pwd === 0) {
        alert("올바른 정보를 입력해 주세요.");
        return;
    }

    var memberData = {
        userName: document.getElementById("userName").value,
        userId: document.getElementById("userId").value,
        userPwd: document.getElementById("userPwd").value,
        userEmail: document.getElementById("userEmail").value,
        userPh: document.getElementById("userPh1").value + "-" +
                document.getElementById("userPh2").value + "-" +
                document.getElementById("userPh3").value,
        userZipcode: document.getElementById("userZipcode").value,
        userAddress1: document.getElementById("userAddress1").value,
        userAddress2: document.getElementById("userAddress2").value
    };

    console.log("memberData:", memberData);  // 확인용 로그 (콘솔에 출력)

    fetch("/member/register", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(memberData)
    })
    .then(response => response.text())
    .then(data => {
        if (data.includes("successful")) {
            alert("회원가입이 완료되었습니다.");
            window.location.href = "/login";  // 성공 시 로그인 페이지로 이동
        } else {
            alert(data);  // 실패 시 에러 메시지 출력
        }
    })
    .catch(error => console.error("Error:", error));
}
