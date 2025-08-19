/*
자바에서 변수를 선언하는 방법
자료형 변수명;
int num;
String str;

자바스크립트에서 변수를 선언하는 방법
var 변수명;
var num;
var str;
-> 자바스크립트는 변수 선언 시 데이터타입을 지정하지 않음
-> 선언한 변수에 데이터가 입력되면, 입력된 데이터의 자료형이 변수의 자료형으로 결정

*/
var name1;//변수를 선언하고 값을 대입하지 않으면? -> 자료형이 결정되지 않고, 내부데이터도 결정되지 않은 상태
console.log(name1);
console.log(typeof name1);  //해당 변수의 자료형을 문자열로 출력
name1 = "허예빈";
console.log(name1,typeof name1);

var age1;
console.log(age1, typeof age1);
age1 = 30;
console.log(age1, typeof age1);

age1 = "안녕";  //변수 사용 시 대입되는 데이터의 타입이 변경되면 변수의 자료형도 같이 변경
console.log(age1, typeof age1);
{
  var test1 = "test1";
  console.log(test1, typeof test1);
}
console.log(test1);
//var를 이용해서 변수를 선언하면 변수 범위가 효과가 없음
// -> 복잡한 코드를 작성할 때 이미 사용된 변수인지 체크가 힘듬

//es6에서 변수 선언방법(var -> let, const)
//2. let
let name2;
console.log(name2, typeof name2);
name2 = "허예빈";
console.log(name2,typeof name2);

let age2;
console.log(age2, typeof age2);
age2 = 25;
console.log(age2, typeof age2);
age2 = "hi";
console.log(age2, typeof age2);
{
  let test2 = "test2";
  console.log(test2, typeof test2);
}
// console.log(test2);  //let으로 선언한 변수는 중괄호 내부까지만 사용이 가능

//3. const(상수 final) : 한번 값이 대입되고나면 변경이 불가능
//변수를 생성하면서 바로 값이 대입되어야함, 대입된 데이터는 변경이 불가능
const name3 = "허예빈3";
console.log(name3, typeof name3);
const age3 = 33;
console.log(age3, typeof age3);
// name3 = 100;       //상수형 변수에 데이터를 변경하려고하면 에러 발생
{
  const test3 = "test3";
  console.log(test3,typeof test3);
}
// console.log(test3);

let arr1 = [1,2,3,4,5];
console.log(arr1);
arr1[2] = 300;
console.log(arr1);

const arr2 = [1,2,3,4,5]; //배열의 변수를 직접 바꾸는건 안되지만 배열의 주소를 바꾸기 때문에 배열로 수정 가능
console.log(arr2);
arr2[2] = 300;
console.log(arr2);