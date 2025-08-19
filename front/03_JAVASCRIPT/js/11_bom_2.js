console.log("111");

//현재 화면로드가 완료되면 자동으로 한번 실행되는 함수
window.onload = function() {
  //window.alert("test");
  const btn6 = document.querySelector("#btn6");
  btn6.onclick = function(){
  console.log("btn6 클릭");
  }
}