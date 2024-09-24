/**
 * 
 */
 
 $(document).ready(function(){
 
 	//검색 폼에 submit 이벤트가 발생하면 처리 함수
 	$('#searchForm').on('submit', function(){
 
 		 var keyword = $('#keyword').val(); // 입력된 검색어 가져오기

        // 검색어가 있을 때만 AJAX 요청을 보냄
        if (keyword) {
            $.ajax({
                url: '/searchResult', //검색 처리 URL
                method: 'GET',
                data: { keyword: keyword }, // 검색어를 서버로 전송
                success: function (response) {
                    // 검색 결과를 상품 리스트 영역에 업데이트
                    $('#prdList').html(response); // 검색 결과
                },
                error: function () {
                    alert('검색 결과를 가져오는 중 오류가 발생했습니다.');
                }
            });
        }
 	});//on끝
 	
 });//ready끝
 
 