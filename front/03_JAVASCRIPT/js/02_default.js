//주석은 자바 주석과 동일
//한줄 주석
/*
범위 주석
*/

//console.log(내용) : 개발자 도구의 console 화면에 내용을 출력
//  -> 개발 도중 확인을 위한 목적으로 사용 -> 개발완료하면 삭제
console.log("테스트");
console.log("테스트2");
console.log(100);
console.log(100+200);
console.log("문자열"+100);
console.log("문자열",100,"hi",200);
//console.log()의 메소드에 매개변수를 여러개 주면 띄어쓰기로 구분해서 모두 출력

//alert(내용) : 내용 알림창 출력
// alert("메세지");
// alert(100);
// alert(100+200); 
// alert("문자열"+100);
// alert("문자열",100,"hi",200);
//alert에 매개변수를 여러개 주면 첫번째 매개변수만 사용하고 나머지는 모두 버림

//confirm(질문) : 사용자에게 질문을 보여주고, 그 결과를 true/false로 받아옴
// console.log(confirm("자바스크립트는 css보단 괜찮아요????"));
if(confirm("자바스크립트는 css보다 괜찮아요?")){
  console.log("js");
}else{
  console.log("css");
}

//prompt(질문) : 사용자에게 질문을 보여주고, 값을 입력받아서 입력받은 값을 문자열로 가져옴
console.log(prompt("자바스크립트와 css 중 더 하기 싫은것은?"));