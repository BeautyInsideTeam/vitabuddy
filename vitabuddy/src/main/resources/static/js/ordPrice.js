window.onload = function () {
    const plusButtons = document.querySelectorAll('.plusBtn');
    const minusButtons = document.querySelectorAll('.minusBtn');
    
    plusButtons.forEach((plusBtn, index) => {
        plusBtn.addEventListener('click', () => {
            qtyChange(index, 1);
        });
    });

    minusButtons.forEach((minusBtn, index) => {
        minusBtn.addEventListener('click', () => {
            qtyChange(index, -1);
        });
    });

    // 페이지가 로드될 때도 총 금액 계산
    updateTotalAmount();

    function qtyChange(index, num) {
        // 현재 선택된 수량 필드와 금액 필드
        const qtyInputs = document.querySelectorAll('.cartQty');
        let qty = parseInt(qtyInputs[index].value);
        qty = qty + num;

        if (qty < 1) qty = 1;  // 1보다 작아지지 않도록

        calAmount(index, qty);
    }

    function calAmount(index, qty) {
        const qtyInputs = document.querySelectorAll('.cartQty');
        const priceElements = document.querySelectorAll('.price'); 
        const amountElements = document.querySelectorAll('.amount'); 

        const price = parseInt(priceElements[index].dataset.price); // dataset에서 가격 추출
        const totalAmount = qty * price;

        // 개별 상품 금액
        qtyInputs[index].value = qty;
        amountElements[index].innerHTML = totalAmount.toLocaleString(); // 천단위 구분자 

        // 총 금액
        updateTotalAmount();
    }

    function updateTotalAmount() {
        let total = 0;

        document.querySelectorAll('.amount').forEach(amountElement => {
            total += parseInt(amountElement.textContent.replace(/,/g, '')); // , 제거 후 숫자로 변환해서 계산
        });

        // 총 주문 금액 
        const totalElement = document.querySelector('#total'); 
        totalElement.innerHTML = total.toLocaleString(); 
    }
};
