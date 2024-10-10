/**
 * 브랜드별 탭 클릭 : 브랜드 태그 나옴
 */
 
/*getBrands(){
    // 페이지 로드 시 브랜드 태그 리스트를 가져오기
    $.ajax({
        type: 'GET',
        url: '/supplements/brands', // Controller에 정의된 URL
        success: function(brands) {
            // brands는 서버에서 받아온 브랜드 리스트
           	console.log(brands);
            let tagList = '';
            brands.forEach(function(brand) {
                tagList += `<span class="brand-tag">${brand}</span> `;
            });
            $('#category').html(tagList); // 태그 리스트를 출력할 div에 삽입
        },
        error: function(error) {
            console.log("Error:", error);
        }
    });
};*/


/*document.getElementById("brandTab").addEventListener("click", function(event) {
    event.preventDefault(); // 링크 기본 동작을 막습니다.
    
    fetch('/supplements/brands') // 서버의 브랜드 목록을 요청
        .then(response => response.json()) // JSON 형태로 응답을 받음
        .then(data => {
            const brandListDiv = document.getElementById("brandList");
            brandListDiv.innerHTML = ''; // 기존 내용을 비움

            // 해시태그 스타일로 브랜드 목록을 추가
            data.forEach(brand => {
                const hashtag = document.createElement("span");
                hashtag.classList.add("hashtag");
                hashtag.textContent = `#${brand}`;
                brandListDiv.appendChild(hashtag);
            });
        })
        .catch(error => console.error('Error:', error));
});*/

