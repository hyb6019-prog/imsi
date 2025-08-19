const tabs = document.querySelectorAll(".tab>div");
const contents = document.querySelectorAll(".tab-content>.active-content");

tabs.forEach(function(tab, i) {
  tab.addEventListener("click", function() {
    // 모든 탭과 콘텐츠에서 활성 클래스 제거
    tabs.forEach(function(t) {
      t.classList.remove("active-tab");
    });
    contents.forEach(function(c) {
      c.classList.remove("active-content");
    });
    // 클릭한 탭과 콘텐츠에만 활성 클래스 추가
    tabs[i].classList.add("active-tab");
    contents[i].classList.add("active-content");
  });
});