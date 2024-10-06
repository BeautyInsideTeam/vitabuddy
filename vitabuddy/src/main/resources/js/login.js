/**
 *  로그인 기능
 */

$(document).ready(function () {
  $(".loginForm").on("submit", function (event) {
    event.preventDefault();

    $.ajax({
      type: "post",
      url: "/users/login",
      data: { id: $("#id").val(), pwd: $("#pwd").val() },
      dataType: "text",
      success: function (result) {
        if (result == "success") {
          // 로그인 성공 시
          alert("로그인 성공");
          location.href = "/home";
        } else {
          // 로그인 실패 시
          alert("아이디 또는 비밀번호가 일치하지 않습니다.");
        }
      },
      error: function () {
        alert("요청 처리 중 오류가 발생했습니다. 로그를 확인하세요.");
      },
    });
  });
});
