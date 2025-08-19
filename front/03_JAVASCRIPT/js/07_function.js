/*
자바의 메소드 선언 방법
[접근제어지시자] 리턴타입 메소드이름(매개변수){
  수행코드
  ...
  return 되돌려줄 데이터;
}

*/

//1. 선언적 함수 : 자바스크립트 코드가 동작할때 가장 먼저 만들어짐
                  //-> 함수 생성코드보다 실행코드가 먼저있어도 상관 없음

/*
function 함수이름(매개변수){
  수행코드
  ...
  [return 되돌려줄 데이터]
}
*/
func1(); //함수 선언전에 작성해도 실행됨
function func1(){
  console.log("func1 함수 동작");
}
//함수 호출 방법 : 함수이름(매개변수);
func1();

function func2(){
  console.log("func2 함수 동작");
  return "hi";
}
const data1 = func2();
console.log(data1);
const data2 = func1();
console.log(data2);


//2. 익명 함수 : function에 이름을 붙이지 않음
              //함수에 이름이 없으면 실행 불가능 -> 익명함수는 변수에 저장해서 사용
/*
function (매개변수){
  수행코드
  ...
  [return 되돌려줄 데이터]
}
*/
// data3();     //-> 선언적 함수와 다르게 변수를 정의한 후 사용해야 함
const data3 = function(){
  console.log("익명함수1 실행");
}
data3();
const data4 = function(){
  console.log("익명함수2 실행");
  return "hello";
}
const data5 = data4();
console.log(data5);
//2-1 익명함수2 : function 이름을 붙이지 않음 / 변수에 저장도 안함
//              -> 스스로 한번만 실행하고 재사용하지 않는 경우
//              -> 필요한 값들 초기화 할때 사용
(function(){
  console.log("익명함수3 실행");
})();

//함수의 매개변수
//함수의 매개변수 작성시 변수이름은 상관없음, 순서
//매개변수 작성 시 자료형이 의미가 없기때문에 매개변수 이름만 작성
function func3(num, str){
  console.log("func3 실행");
  console.log(num, typeof num);
  console.log(str, typeof str);

  // console.log(str.toUpperCase());
  //arguments객체 : 함수별로 존재하는 지역변수 객체(함수 호출시 전달하는 매개변수를 배열로 가지고 있음)
  console.log(arguments);
}

func3(100, "hi");
func3("hello", 200);
func3([1,2,3],true);
//선언한 매개변수보다 매개변수를 부족하게 전달 -> 앞에서부터 순서대로 사용하고, 전달하지 않은 것은 undefined
func3(100);
func3();
//선언한 매개변수보다 매개변수를 많이 전달 -> 선언한 매개변수까지만 사용하고 나머지는 사용 안함
func3(1000,"2000",3000,"4000");

function func4(){
  console.log("func4 실행");
  for(let i=0;i<arguments.length;i++){
    console.log(arguments[i], typeof arguments[i]);
  }
}
func4(100,"2000",3000,"400",50);

//자바스크립 내장함수
const url = "http://www.naver.com?query=날씨";
const str1 = encodeURI(url);        //최소한의 문자만 인코딩
console.log(str1);
const str2 = decodeURI(str1);       //encodeURI로 인코딩된 문자열을 다시 디코딩 하는 함수
console.log(str2);

const str3 = encodeURIComponent(url); //알파벳, 숫자, . 을 제외하고 모두 인코딩
console.log(str3);
const str4 = decodeURIComponent(str3); //encodeURIComponent로 인코딩 된 문자열을 다시 디코딩하는 함수
console.log(str4);

//isNaN(data) : 매개변수로 전달한 데이터가 숫자가 아닌지 체크해서 그 결과를 리턴 -> 숫자가 아니면 true / 숫자면 false
//isFinite(data) : 매개변수로 전달한 데이터가 숫자인지 체크해서 그 결과를 리턴 -> 숫자면 true / 숫자가 아니면 false
const num1 = 100;
const num2 = "200";
const num3 = "ㅋㅋㅋ";
console.log(isNaN(num1));
console.log(isNaN(num2));   //자동형변환으로 숫자로 변경될 수 있으면 false
console.log(isNaN(num3));

console.log(isFinite(num1));
console.log(isFinite(num2));
console.log(isFinite(num3));