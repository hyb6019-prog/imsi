const tabs = document.querySelectorAll(".tab > div");
const contents = document.querySelectorAll(".tab-content > div");
const names = ["movie", "drama", "anime", "music"];

tabs.forEach(function(tab, index) {
  tab.addEventListener("click", function() {
    tabs.forEach(function(t) {
      t.classList.remove("active-tab");
    });
    contents.forEach(function(c) {
      c.classList.remove("active-content");
    });

    tab.classList.add("active-tab");
    contents[index].classList.add("active-content");

    location.hash = names[index];
  });
});

let hash = location.hash.replace("#", "");
let startIndex = 0;

for (var i = 0; i < names.length; i++) {
  if (names[i] === hash) {
    startIndex = i;
    break;
  }
}

tabs[startIndex].classList.add("active-tab");
contents[startIndex].classList.add("active-content");