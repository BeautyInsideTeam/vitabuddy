/**
 * 
 */
 
$(function() {
    $('#category ul li a').on('click', function() {
        event.preventDefault(); 

        // 상위 카테고리
        selectedCategory = $(this).parent().data('category');

        // ajax
        $.ajax({
            type: 'GET',
            url: '/api/supplement/subcategories',  
            data: { category: selectedCategory }, // 선택된 상위 카테고리
            success: function(response) {
                // 기존 하위 카테고리 지우고 새 데이터 로드
                var subCategoryMenu = $('.subCtgMenu[data-category="' + selectedCategory + '"] ul');
                subCategoryMenu.empty();  // 기존 내용 삭제

                // 하위 카테고리 목록 출력
                response.forEach(function(subcategory) {
                    subCategoryMenu.append('<li><a href="#">' + subcategory.name + '</a></li>');
                });

                // 하위 카테고리 표시
                $('.subCtgMenu[data-category="' + selectedCategory + '"]').show();
            },
            error: function() {
                console.error("하위 카테고리 로드 실패");
            }
        });
    });

    // 페이지 로드시 
    $('.subCtgMenu').hide(); //모든 하위 카테고리 숨김
});
