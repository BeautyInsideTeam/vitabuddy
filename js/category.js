/**
 * 
 */
 
$(function() {
    // 상위 카테고리 클릭 시 하위 카테고리 표시
    $('#category ul li a').on('click', function(e) {
        e.preventDefault(); // 기본 링크 동작 방지

        // 클릭한 카테고리의 data-category 값 가져오기
        var selectedCategory = $(this).parent().data('category');

        // 모든 하위 카테고리 숨기기
        $('.subCtgMenu').hide();

        // 선택한 카테고리와 일치하는 하위 카테고리만 보여주기
        $('.subCtgMenu[data-category="' + selectedCategory + '"]').show();
    });

    // 페이지 로드시 모든 하위 카테고리 숨기기
    $('.subCtgMenu').hide();
});

