document.addEventListener("DOMContentLoaded", function () {
    const loginForm = document.getElementById("loginForm");

    loginForm.addEventListener("submit", function (event) {
        event.preventDefault(); // 폼의 기본 제출 동작 방지

        // (1) 폼에서 입력값 추출
        const username = document.getElementById("id").value;
        const password = document.getElementById("pwd").value;

        // (2) 서버 쪽 LoginFilter(혹은 인증 로직)에서
        //     "username", "password"로 받도록 구현했다면 그대로 사용.
        //     만약 서버가 "email", "pwd" 필드를 기대한다면
        //     body를 JSON.stringify({ email: username, pwd: password }) 등으로 맞춤.

        // (3) fetch로 로그인 요청
        fetch('/login', {
            method: 'POST',
            // 쿠키 자동 전송을 위해 추가
            credentials: 'include',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ username, password })
        })
        .then(response => {
            if (response.ok) {
                // ★ 서버가 HttpOnly 쿠키로 토큰을 내려주므로,
                //    JS에서 더 이상 토큰을 읽을 필요 없음.
                alert("로그인 성공!");
                // 로그인 성공 시 메인 페이지(또는 원하는 경로)로 이동
                window.location.href = "/";
            } else {
                // 401 등 실패 응답이 오면 여기로
                throw new Error("로그인 실패: 아이디 또는 비밀번호를 확인하세요.");
            }
        })
        .catch(error => {
            console.error(error);
            alert(error.message);
        });
    });
});

// 로그아웃 기능
document.querySelector('#logoutButton').addEventListener('click', function (event) {
    event.preventDefault(); // 기본 동작 방지

    fetch('/logout', {
        method: 'POST',
        credentials: 'include', // 쿠키 포함
        headers: {
            'Content-Type': 'application/json',
        },
    })
    .then((response) => {
        if (response.ok) {
            window.location.href = '/'; // 메인 페이지로 리다이렉트
        } else {
            response.text().then((message) => alert('로그아웃 실패: ' + message));
        }
    })
    .catch((error) => {
        console.error('Error:', error);
        alert('로그아웃 요청 중 문제가 발생했습니다.');
    });
});
