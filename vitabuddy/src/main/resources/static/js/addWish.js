/**
 *
 */
$(document).ready(function () {
  // 로그인 상태를 가져옴
  var isLoggedIn = $("#loginStatus").data("login");

  $("#addWish").on("click", function (event) {
    if (!isLoggedIn) {
      // 로그인 되지 않은 상태
      alert("로그인이 필요한 서비스입니다.");
      window.location.href = "/intro";
    } else {
      event.preventDefault();
      const supId = $(this).data("sup-id");
      const userId = $(this).data("user-id");

      // ajax 요청
      $.ajax({
        type: "post",
        url: "/supplement/wishList/insert",
        data: JSON.stringify({
          supId: supId,
          userId: userId,
        }),
        contentType: "application/json",
        success: function (response) {
          alert("찜목록에 추가되었습니다.");
          // 찜 목록 페이지로 리디렉션
          window.location.href = "/supplement/wishList";
        },
        error: function () {
          alert("찜목록 추가 실패");
        },
      });
    }
  });
});