/**
 * 
 */
 
 let currentPage = 1; // 현재 페이지

function changePage(page) {
    if (page < 1 || page > totalPages) return; // 범위 체크

    currentPage = page;
    loadProducts(currentPage); // 현재 페이지의 상품을 로드하는 함수 호출
}

// 상품 로드 함수 (서버와 AJAX를 통해 데이터 가져오기)
function loadProducts(page) {
    fetch("/productList?page=${page}")
        .then(response => response.json())
        .then(data => {
            // 상품 데이터와 페이지 정보 업데이트
            renderProducts(data.products); // 상품 렌더링 함수 호출
            updatePagination(data.totalPages); // 페이지네이션 업데이트 함수 호출
        })
        .catch(error => console.error('Error:', error));
}

// 상품 렌더링 함수
function renderProducts(products) {
    const productContainer = document.getElementById('prd');
    productContainer.innerHTML = ''; // 기존 상품 목록 지우기
    products.forEach(prd => {
        const productItem = '<div class="productItem">
            <a href="/product/detailView/${prd.prdNo}">
                <img src="/images/${prd.prdName}.png" alt="${prd.prdName}">
                <h3>${prd.prdName}</h3>
            </a>
            <p>${prd.prdPrice} 원</p>
            <button type="button">장바구니에 추가</button>
        </div>';
        productContainer.innerHTML += productItem;
    });
}

// 페이지네이션 업데이트 함수
function updatePagination(totalPages) {
    const paginationLinks = document.querySelectorAll('.pagination a.page');
    paginationLinks.forEach(link => link.classList.remove('active'));
    paginationLinks[currentPage - 1].classList.add('active');
}
 