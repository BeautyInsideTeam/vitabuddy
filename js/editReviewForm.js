/**
 * 
 */

$(document).ready(function() {
    $('.correctReview').on('click', function() {
        event.preventDefault(); 
        
        // 팝업 창 생성
        window.open('/supplement/supplementDetail/editReview', 'editReviewPopup', 'width=1000,height=500,left=100,top=50');
    });
});


