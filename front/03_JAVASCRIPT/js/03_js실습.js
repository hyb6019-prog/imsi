// 1. 모든 div 요소를 선택합니다.
const divs = document.querySelectorAll(".divs");

// 2. 사라진 div들을 저장할 배열
const removedDivs = [];

// 3. 각 div에 클릭 이벤트를 등록합니다.
divs.forEach(function(div) {
  div.addEventListener("click", function() {
    // 클릭된 div를 화면에서 숨깁니다.
    div.style.display = "none";

    // 배열에 클릭된 div를 저장합니다 (순서 유지).
    removedDivs.push(div);

    // 5개 모두 숨겨졌는지 확인합니다.
    if (removedDivs.length === 5) {
      // 1초 후에 다시 나타나게 합니다 (자연스러운 연출)
      setTimeout(function() {
        // 저장된 순서대로 다시 보여줍니다
        removedDivs.forEach(function(hiddenDiv) {
          hiddenDiv.style.display = "block";
        });

        // 배열 초기화 (비워줌)
        removedDivs.length = 0;
      }, 1000); // 1초 후
    }
  });
});