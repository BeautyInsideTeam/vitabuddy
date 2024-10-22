/**
 * 
 */
$(document).ready(function() {
    $('.deleteCartBtn').on('click', function() {
        const supId = $(this).data('sup-id');
        const self = this; // this 값 저장

        $.ajax({
            type: 'post',
            url: '/api/deleteCart',
            data: JSON.stringify({
                supId: supId
            }),
            contentType: 'application/json',
            success: function(response) {
                alert('삭제되었습니다');
                $(self).closest('tbody').remove();  // 삭제 버튼이 포함된 가장 가까운 tbody 삭제
            },
            error: function() {
                alert('삭제 실패');
            }
        });
    });
});
