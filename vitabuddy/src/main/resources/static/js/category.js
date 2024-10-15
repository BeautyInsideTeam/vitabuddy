/**
 * [기능별], [성분별], [브랜드별] 탭 클릭 시, 해당 태그 출력
 */
$(function() {
    $('#category ul li a').on('click', function(event) {
        event.preventDefault(); 

        // 선택된 상위 카테고리 (functions, ingredients, brands)
        var selectedCategory = $(this).parent().data('category'); //3가지 중 할당

        // API URL 선택 (카테고리별로 URL 다르게 설정) - 수정사항 1
        var apiUrl = '';
        if (selectedCategory === 'functions') {
            apiUrl = '/api/supplement/functions';  // 기능별 카테고리
        } else if (selectedCategory === 'brands') {
            apiUrl = '/api/supplement/brands';  // 브랜드별 카테고리
        } else if (selectedCategory === 'ingredients') {
            apiUrl = '/api/supplement/ingredients';  // 성분별 카테고리
        }

      	//ajax 요청
        $.ajax({
            type: 'GET',
            url: apiUrl, 
            // data: { category: selectedCategory },  //수정사항2. 컨트롤러 매개변수로 data값을 넘기지 않음. 
            success: function(response) {
                // 기존 하위 카테고리 내용 삭제 후 새 데이터 로드
                
                var subCategoryMenu = $('.subCtgMenu[data-category="' + selectedCategory + '"] ul'); //데이터가 들어갈 공간을 변수로 정의
                $('.subCtgMenu ul').empty();  //수정사항3. 이 코드가 없으면, 다른 탭 클릭 시, 그 밑에 누적으로 카테고리 태그가 나타난다
             
				
                console.log(response);    // 서버에서 받은 응답 데이터 출력하는 코드

			    
			    //수정사항4. for반복문으로 대체 (reponse[i] 하나하나에 링크를 걸어야 함 - endpoint 지정
				for (let i = 0; i < response.length; i++) {
				    // 해당 해시태그에 맞는 상품을 검색할 엔드포인트 URL 설정
				    let categoryEndpoint = '/supplements/tagsearch?category=' + selectedCategory + '&tag=' + encodeURIComponent(response[i]);
				
				    // <a> 태그에 클릭 가능한 링크와 해시태그 추가
				    subCategoryMenu.append('<li><a href="' + categoryEndpoint + '">#' + response[i].replace(/\"/g, "") + '</a></li>');
				}
				
				// 하위 카테고리 표시
                $('.subCtgMenu[data-category="' + selectedCategory + '"]').show();
            },
            error: function() { 
                console.error(selectedCategory + " 카테고리 로드 실패");
            }
        });
    });

    // 페이지 로드시 모든 하위 카테고리 숨김
    $('.subCtgMenu').hide();
});