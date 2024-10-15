/**
 * 
 */
 
$(document).ready(function() {
    $('#reviewForm').on('submit', function() {
     	
        var formData = new FormData(this); // 폼 데이터 처리를 formdata 형식으로

        $.ajax({
            type:'post',
            url:'/supplement/supplementDetail/{sup.supId}/review',
            data:formData,
            contentType:false, 
            processData:false,
            success:function(response) {
             	alert("리뷰 작성 완료");
                
                // 작성 완료 후 폼 초기화
                $('#reviewForm')[0].reset();
            },
            error:function() {
            	alert('리뷰 작성 실패');
            }
        });
    });
});