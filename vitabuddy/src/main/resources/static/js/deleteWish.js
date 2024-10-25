/**
 * 
 */
$(document).ready(function() {
    $('.deleteCartBtn').on('click', function() {
        if (!confirm('삭제하시겠습니까?')) {
            return;
        }

        const supId = $(this).data('sup-id');
        const userId = $(this).data('user-id');
        const self = this;

        $.ajax({
            type: 'POST',
            url: '/supplement/wishList/delete',
            contentType: 'application/json',
            data: JSON.stringify({ "supId": supId, "userId": userId }), // HashMap 형태로 전달
            success: function(response) {
                if (response === 1) {
                    alert('찜 목록에서 삭제되었습니다.');
                    $(self).closest('tr').remove(); // 삭제된 행 제거
                    window.location.reload(); // 페이지 새로고침
                } else {
                    alert('삭제 실패');
                }
            },
            error: function() {
                alert('삭제 요청 처리 중 오류가 발생했습니다.');
            }
        });
    });
});



