/**
 *
 */

$(document).ready(function () {
  $(".loginForm").on("submit", function () {
    event.preventDefault();
    $.ajax({
      type: "post",
      url: "/intro/login",
      data: { id: $("#id").val(), pwd: $("#pwd").val() },
      dataType: "text",
      success: function (result) {
        if (result == "success") {
          window.location.href = "/home";
        } else {
          alert("회원정보가 일치하지 않습니다.");
        }
      },
      error: function () {
        alert("요청실패");
      },
    });
  });
});
