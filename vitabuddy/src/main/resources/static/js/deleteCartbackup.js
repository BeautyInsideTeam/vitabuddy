/**
 * 
 */
$(document).ready(function() {
    $('.deleteCartBtn').on('click', function() {
        // 삭제 확인 메시지 추가
        if (!confirm('장바구니에서 삭제하시겠습니까?')) {
            return; 
        }

        const supId = $(this).data('sup-id');
        const cartId = $(this).data('cart-id');  // cartId 추가
        const userId = $(this).data('user-id');  // userId 추가
        const self = this; // this 값 저장

        $.ajax({
            type: 'post',
            url: '/api/deleteCart',
            data: JSON.stringify({
                supId: supId,
                cartId: cartId,   // cartId 추가
                userId: userId    // userId 추가
            }),
            contentType: 'application/json',  //데이터 형식이 json 형식임을 명시
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

