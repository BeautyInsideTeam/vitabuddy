/**
 * 
 */
 
 $(document).ready(function() {
    // 검색 폼 submit
    $('#searchForm').on('submit', function() {
        event.preventDefault();

        const keyword = $('#keyword').val().trim(); //검색 키워드
        // .trim() 추가 입력한 키워드 값,양 옆 공백 제거
        
        /*검색 이외 부분 제외
        
        applyFilters(keyword, null, null);
    });


    // 하위 카테고리 클릭
    $('#subCtg').on('click', '.subCtgMenu li a', function() {
        event.preventDefault();

        const categoryType = $(this).text();  // 선택한 하위 카테고리
        applyFilters(null, categoryType, null);
    });

    // 정렬 선택
    $('#order').on('change', function() {
        const selectedOrder = $(this).val();  // 정렬 값
        applyFilters(null, null, selectedOrder);
    });

    // 필터링
    function applyFilters(keyword, categoryType, sortOrder) {
        const url = new URL(window.location.href);

        // 기존 파라미터 삭제/추가
        if (keyword !== null) { 
            url.searchParams.set('keyword', keyword);
        } else {
            url.searchParams.delete('keyword');
        }

        if (categoryType !== null) {
            url.searchParams.set('ctg', categoryType);
        } else {
            url.searchParams.delete('ctg');
        }

        if (sortOrder !== null) {
            url.searchParams.set('order', sortOrder);
        } else {
            url.searchParams.delete('order');
        }*/

        // ajax 요청
        $.ajax({
            type: 'get',
            url: '/search',  // 요청을 보낼 URL (Spring Controller에 매핑된 URL)
            //url: '/api/supplement?' + url.searchParams.toString(),
            // result->response 수정
            success: function(response) {
                $('.products').empty();  // 기존 상품 목록 삭제

                if (response.length == 0) {
                    $('.products').append('<h4>검색 결과가 없습니다</h4>');
                } else {
                    result.forEach(function(keywordsup) {// js 파일에서 jstl 태그 인식 못하므로, 아래와 같이 supPrice 작성
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
                }
            },
            error: function() {
                //console.error("error");
                alert('오류가 발생했습니다');  // 에러 처리
            }
        });
    }
});