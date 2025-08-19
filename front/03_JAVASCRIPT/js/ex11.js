const tabs = document.querySelectorAll(".tab>div");
const contents = document.querySelectorAll(".tab-content>div");

tabs.forEach(function(tab, i) {
  tab.addEventListener("click", function() {
    tabs.forEach(function(t) {
      t.classList.remove("active-tab");
    });
    contents.forEach(function(c) {
      c.classList.remove("active-content");
    });
    tabs[i].classList.add("active-tab");
    contents[i].classList.add("active-content");
  });
});

