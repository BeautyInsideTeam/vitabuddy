
$(document).ready(function() {
    // 폼 제출 시 Ajax 호출
    $('#searchForm').on('submit', function(event) {
        event.preventDefault();  // 폼 기본 제출 방지
        var keyword = $('#keyword').val().trim();  // 입력한 키워드 값,양 옆 공백은 지운다


        // Ajax 요청
        $.ajax({
            url: '/search',  // 요청을 보낼 URL (Spring Controller에 매핑된 URL)
            type: 'GET',  
            data: { keyword: keyword },  // 서버에 전달할 데이터 (키워드)
            success: function(response) {
                // 성공 시, 결과를 화면에 표시
                $('.products').empty();
                 
                if(response.length <= 0){
                	 $('.products').append('<h4>검색 결과가 없습니다</h4>');
                }else {
                    response.forEach(function(keywordsup) {  //js 파일에서는 jstl 태그 인식 못하므로, 아래와 같이 supPrice 작성
                        $('.products').append(`
                        	<div class="productItem">
					            <a href="<c:url value='/api/supplement/supplementDetail/${keywordsup.supId}'/>">
					             <img class="prdImg" src="data:image/png;base64,${keywordsup.base64SupImg}" width="300" height="300"> </a>
						        <p>${keywordsup.supName}</p>
						        <p>${new Intl.NumberFormat('ko-KR', { style: 'currency', currency: 'KRW' }).format(keywordsup.supPrice)}</p>
						        <p>${keywordsup.supBrand}</p>
                            </div> 
                        `);
                    });
                } //else 종료
                   
               
            },
            error: function() {
                alert('오류가 발생했습니다');  // 에러 처리
            }
        });
    });
});
