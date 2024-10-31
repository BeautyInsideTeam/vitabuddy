
    function goToPage(page) {
        const totalPages = ${totalPages}; // 서버에서 전달된 전체 페이지 수
		const id = ${supplementDetailId};
        // 페이지가 유효한 범위를 벗어나면 아무 작업도 하지 않음
        if (page < 1 || page > totalPages) return;

        $.ajax({
            url: `/api/supplement/supplementDetail/${id}/reviews`, // AJAX 요청 경로
            type: "GET",
            data: { page: page },
            dataType: "html", // 서버에서 HTML 조각을 반환받기 위함
            success: function(data) {
                // 받은 HTML 조각을 특정 컨테이너에 삽입
                $("#reviewListContainer").html(data);

                // 페이지네이션 버튼 활성화 상태 업데이트
                updatePaginationButtons(page, totalPages);
            },
            error: function() {
                alert("리뷰 목록을 불러오는 데 실패했습니다.");
            }
        });
    }

    function updatePaginationButtons(currentPage, totalPages) {
        // 이전, 다음 버튼 활성화/비활성화 설정
        $(".prev").toggleClass("disabled", currentPage === 1);
        $(".next").toggleClass("disabled", currentPage === totalPages);

        // 페이지 버튼 활성화 표시 업데이트
        $(".pagination .page").each(function() {
            const page = $(this).data("page");

            if (page === currentPage) {
                $(this).addClass("active");
            } else {
                $(this).removeClass("active");
            }
        });
    }

