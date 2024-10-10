/**
 * 
 */
 
$(document).ready(function() {
    $('#searchForm').on('submit', function(event) {
        event.preventDefault();

        const keyword = $('#keyword').val();
        applyFilters(keyword);
    });

    // 하위 카테고리
    $('#subCtg .subCtgMenu li a').on('click', function(event) {
        event.preventDefault();
        
        const categoryType = $(this).text();  // 선택한 하위 카테고리 값

        applyFilters(null, categoryType);
    });

    // 정렬
    $('#order').on('change', function() {
        const selectedOrder = $(this).val();  // 정렬 선택
        applyFilters(null, null, selectedOrder);
    });

    function applyFilters(keyword, categoryType, sortOrder) {
        const url = new URL(window.location.href);

        // 필터링 파라미터
        if (keyword !== null) {
            url.searchParams.set('keyword', keyword);
        }
        if (categoryType !== null) {
            url.searchParams.set('ctg', categoryType);
        }
        if (sortOrder !== null) {
            url.searchParams.set('order', sortOrder);
        }

        // ajax 요청
        $.ajax({
            type: 'get',
            url: '/api/products?' + url.searchParams.toString(),
            success: function(result) {
                $('.products').empty(); // 기존 태그 삭제
                
                if (result.length == 0) { // 검색 결과 없는 경우
                    $('.products').append('<h4>검색 결과가 없습니다</h4>');
                } else { // 검색 결과 있는 경우
                    for (let i = 0; i < result.length; i++) {
                        $('.products').append('<div class="productItem"><a href="/product/detailView/' + result[i].supNo + '">' +
                            '<img src="/image/' + result[i].supImg + '.png"></a>' +
                            '<p>' + result[i].supName + '</p>' +
                            '<p>' + result[i].supPrice + '</p>' +
                            '<p>' + result[i].supBrand + '</p></div>';
                    } // for
                } // else
            },
            error: function() {
                alert("요청 실패");
            }
        });
    } // applyFilters
});