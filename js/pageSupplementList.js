/**
 * 
 */
	$(document).ready(function() {
	    // 페이지 번호 클릭
	    $('.pagination .page').on('click', function() {
	        event.preventDefault(); 
	        
	        const page = $(this).data('page');//클릭한 페이지 번호
	        
	        if (!$(this).hasClass('disabled')) {//활성화
	            changePage(page);//페이지 변경
	        }
	    });
	
	    // 이전/다음 버튼 클릭
	    $('.pagination .prev, .pagination .next').on('click', function() {
	        event.preventDefault();
	        
	        const page = $(this).data('page');//이전/다음 페이지 번호 가져오기
	        
	        if (!$(this).hasClass('disabled')) {
	            changePage(page);
	        }
	    });
	
	    // 페이지 변경
	    function changePage(page) {
	        $.ajax({
	            url: '/api/supplement/supplementList',
	            type: 'GET',
	            data: {
	                page: page  //선택된 페이지 번호
	            },
	            success: function(response) {
	                //상품 목록 업데이트
	                $('#prdList').empty(); //기존 상품 목록 삭제
	                 response.forEach(function(sup) {
				        const productItem = `
				            <div class="productItem">
				                <a href="/api/supplement/supplementDetail/${sup.supId}">
				                    <img src="${sup.supImg}" alt="${sup.supName}">
				                </a>
				                <p>${sup.supName}</p>
				                <p>${sup.supPrice}</p>
				                <p>${sup.supBrand}</p>
				            </div>
				        `;
				        $('#prdList').append(productItem);
				        });
	                //페이지네이션 업데이트
	                updatePagination(page);
	            },
	            error: function() {
	                console.error("error");
	            }
	        });
	    }
	
	    //페이지네이션 업데이트
	    function updatePagination(currentPage) {
	        $('.pagination .page').each(function() {
	            const page = $(this).data('page');
	            if(page == currentPage) {
	                $(this).addClass('active');//현재 페이지 활성화
	            } else {
	                $(this).removeClass('active');//나머지 페이지 비활성화
	            }
	        });
	
	        //이전/다음 버튼 활성화/비활성화
	        if(currentPage == 1) {
	            $('.pagination .prev').addClass('disabled');
	        } else {
	            $('.pagination .prev').removeClass('disabled');
	        }
	
	        if(currentPage == totalPages) {
	            $('.pagination .next').addClass('disabled');
	        } else {
	            $('.pagination .next').removeClass('disabled');
	        }
	    }
	});
 