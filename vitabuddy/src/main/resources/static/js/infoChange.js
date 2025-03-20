$(document).ready(function () {
  // 검색 버튼 클릭 이벤트
  $("#searchBtn").on("click", function () {
    searchSupplements();
  });

  // 1. 영양제 검색
  function searchSupplements() {
    const keyword = document.getElementById("keyword").value;
    const brand = document.getElementById("brand").value;

    $.ajax({
      url: "/supplement/search",
      method: "GET",
      data: { keyword: keyword, brand: brand },
      success: function (data) {
        displaySupplementList(data);
      },
      error: function () {
        alert("영양제 검색에 실패했습니다.");
      },
    });
  }

  // 2. 검색 결과 표시
  function displaySupplementList(supplements) {
    const supplementList = document.getElementById("supplementList");
    supplementList.innerHTML = "";

    supplements.forEach((supplement) => {
      const listItem = document.createElement("li");
      listItem.textContent = `${supplement.supName} (${supplement.supBrand})`;

      const selectButton = document.createElement("button");
      selectButton.textContent = "추가";
      selectButton.onclick = function () {
        checkAuthAndAdd(supplement.supId, supplement); // supId로 수정
      };

      listItem.appendChild(selectButton);
      supplementList.appendChild(listItem);
    });
  }

  // 3. 인증 체크 후 추가
  function checkAuthAndAdd(supId, supplement) {
    $.ajax({
      type: "GET",
      url: "/api/checkAuth",
      success: function () {
        addToCurrentList(supplement);
      },
      error: function (xhr) {
        if (xhr.status === 401) {
          alert("로그인이 필요한 서비스입니다.");
          window.location.href = "/intro";
        }
      },
    });
  }

  // 4. 복용 리스트 추가 및 삭제 버튼
  function addToCurrentList(supplement) {
    const currentList = document.getElementById("currentSupplementList");
    const listItem = document.createElement("li");
    listItem.textContent = `${supplement.supName} (${supplement.supBrand})`;
    listItem.setAttribute("data-id", supplement.supId); // supId로 수정

    const deleteButton = document.createElement("button");
    deleteButton.textContent = "삭제";
    deleteButton.onclick = function () {
      deleteSupplement(supplement.supId, listItem); // supId로 수정
    };

    listItem.appendChild(deleteButton);
    currentList.appendChild(listItem);

    $.ajax({
      url: "/supplement/add",
      method: "POST",
      data: { supId: supplement.supId }, // supId로 수정
      success: function (response) {
        alert(response);
      },
      error: function () {
        alert("영양제 추가에 실패했습니다.");
      },
    });
  }

  // 5. 삭제 요청
  function deleteSupplement(supId, listItem) {
    $.ajax({
      url: `/supplement/delete?supId=${supId}`,
      method: "DELETE",
      success: function (response) {
        alert(response);
        if (listItem) {
          listItem.remove();
        }
      },
      error: function () {
        alert("영양제 삭제에 실패했습니다.");
      },
    });
  }
});
