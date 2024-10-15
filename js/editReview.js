/**
 * 
 */
 
 $(document).ready(function() {
    $('#editForm').on('submit', function() {
        event.preventDefault();  

        // FormData 객체 생성
        let formData = new FormData(this);
        
        $.ajax({
            url: '/supplement/supplementDetail/{sup.supId}/review',  
            method: 'POST',
            data: formData,
            contentType: false,  
            processData: false,  
            success: function(response) {
                alert('리뷰 수정 완료');
                
                if (window.opener) {
                    window.opener.location.reload();  // 부모 창 새로고침
                }
                window.close();  // 팝업 창 닫기
                
            },
            error: function() {
                alert('리뷰 수정 실패');
            }
        });
    });
});
 