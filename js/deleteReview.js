/**
 * 
 */
$(document).ready(function() {
    $('.deleteReview').on('click', function() {
 		let answer = confirm("리뷰를 삭제하시겠습니까?");//T/F
 		if(answer){
        const reviewNo = $(this).data('review-id');

        $.ajax({
            type: 'post',
            url: '/supplement/supplementDetail/{sup.supId}/review/{review.reviewNo}/delete',
            data: JSON.stringify({
                reviewNo: reviewNo  //리뷰 ID 서버로 전송
            }),
            contentType: 'application/json',
            success: function(response) {
                alert('리뷰가 삭제되었습니다');
                location.reload();  //페이지 새로고침
            },
            error: function() {
                alert('리뷰 삭제 실패');
            }
        });
        }
    });
});
