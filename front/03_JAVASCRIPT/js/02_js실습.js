// const title = document.querySelector("#title");
// title.onclick = function(){
//   const titleBox = document.querySelector(".searchBox");
//   titleBox.style.display = "block";
// }
// const date = document.querySelector("#date");
// date.onclick = function(){
//   const dateBox = document.querySelector("#dateBox");
//   dateBox.style.display = "block";
// }

const divs = document.querySelectorAll("[name=search]");
const searchBox = document.querySelectorAll(".searchBox");
// divs[0].onclick = function(){
//   searchBox.forEach(function(item){
//     item.style.display = "none";
//   });
//   searchBox[0].style.display = "block";
// }
// divs[1].onclick = function(){
//   searchBox.forEach(function(item){
//     item.style.display = "none";
//   });
//   searchBox[1].style.display = "block";
// }
// divs[2].onclick = function(){
//   searchBox.forEach(function(item){
//     item.style.display = "none";
//   });
//   searchBox[2].style.display = "block";
// }


divs.forEach(function(div, i) {
  divs[i].onclick = function() {
    // 검색박스 숨기고
    searchBox.forEach(function(item) {
      item.style.display = "none";
    });

    // 해당 검색박스 보여줌
    searchBox[i].style.display = "block";
  };
});