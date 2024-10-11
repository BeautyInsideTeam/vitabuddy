/**
 * 
 */
 
 $(document).ready(function() {
    // 검색 폼 submit
    $('#searchForm').on('submit', function() {
        event.preventDefault();

        const keyword = $('#keyword').val(); //검색 키워드
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
        }

        // ajax 요청
        $.ajax({
            type: 'get',
            url: '/api/supplement?' + url.searchParams.toString(),
            success: function(result) {
                $('.products').empty();  // 기존 상품 목록 삭제

                if (result.length == 0) {
                    $('.products').append('<h4>검색 결과가 없습니다</h4>');
                } else {
                    result.forEach(function(product) {
                        $('.products').append(`
                            <div class="productItem">
					            <a href="<c:url value='/api/supplement/supplementDetail/${sup.supId}'/>">
					            <img src="${sup.supImg}" alt="${sup.supName}">
						        </a>
						        <p>${sup.supName}</p>
						        <p>${sup.supPrice}</p>
						        <p>${sup.supBrand}</p>
                            </div>
                        `);
                    });
                }
            },
            error: function() {
                console.error("error");
            }
        });
    }
});
