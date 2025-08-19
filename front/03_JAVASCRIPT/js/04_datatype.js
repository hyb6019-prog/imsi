/*
javascript의 자료형 -> 변수에 저장되는 자료의 형태
문자열/숫자/논리형/undefined
객체/배열/function
*/
//undefined : 정의되지 않음 -> 변수를 선언했으나 변수의 자료형이 정의되지 않은 상태
let test1;
console.log(test1);
// console.log(test2);

//문자열 -> string : 문자와 문자열을 구분하지 않음 / "문자열",'문자열' 둘 다 표현 가능
const str = "JavaScript";
console.log(str, typeof str, typeof(str));
//javascript의 string타입에 내장되어있는 함수

console.log(str.length);       //문자열 길이
console.log(str.toLowerCase());//소문자로 변환해서 리턴
console.log(str);              //원본은 영향 안받음
console.log(str.toUpperCase());//대문자로 변환해서 리턴
//매개변수로 전달한 문자열이 대상 문자열에 몇번째에 있는지 찾아서 그 위치를 리턴(앞에서부터 검색)
console.log(str.indexOf("a"));
//매개변수로 전달한 문자열이 대상 문자열에 몇번째에 있는지 찾아서 그 위치를 리턴(뒤에서부터 검색)
console.log(str.lastIndexOf("a"));
//매개변수로 전달한 문자열이 없으면 -1 리턴
console.log(str.indexOf("z"));
//문자열 중 해당 인덱스에 위치한 문자열 1개 추출해서 리턴
console.log(str.charAt(4));
//for(int i=3; i<7 i++)
console.log(str.substring(3,7)); //문자열 3번 인덱스부터 7번 앞까지 문자열을 리턴
console.log(str.substring(3));// 매개변수를 1개만 전달하는 경우 3번 인덱스부터 끝까지 문자열을 리턴
const study = "java,oracle,jdbc,html,css,javascript";
//매개변수로 전달한 값을 기준으로 문자열을 잘라서 배열로 리턴
console.log(study.split(","));

//숫자타입 -> number -> 정수/실수 구분하지않고 모두 number
const num1 = 10;
console.log(num1, typeof num1);
const num2 = 3.5;
console.log(num2, typeof num2);

console.log(Math.abs(10));
console.log(Math.abs(-10));
console.log(Math.random());     //0~1사이의 랜덤 실수 1개 추출
console.log(Math.round(3.5));   //소수점 반올림
console.log(Math.ceil(3.1));    //소수점 올림
console.log(Math.floor(3.9));   //소수점 버림

//논리형 : true/false
const test2 = true;
console.log(test2, typeof test2);
const test3 = (100 == 200);
console.log(test3, typeof test3);

//자동 형변환
const userName = "유저1";
const userAge = 20;
const userAddr = "서울";
const userGrade = "2";
console.log(typeof userName, typeof userAge, typeof userAddr);
console.log(userName + userAge);//"유저1" + 20 -> "유저1" + "20" -> "유저120"
console.log(userName + userAddr);//"유저1" + "서울" -> "유저1서울"
console.log(userAge + userAddr);//20 + "서울" -> "20" + "서울" -> "20서울"

console.log(userAge + userGrade);//20 + "2" -> "20" + "2" -> "202"

console.log(userAge - userGrade);//20 - "2" -> 20 - 2 -> 18 / 자바와 다르게 계산이 됨
console.log(userName - userAge);//"유저1" - 20 -> NaN - 20 => 연산불가능 =>NaN(Not a Number)
console.log(userAddr - userGrade);
//제 이름은 유저1이고, 나이는 20살 2학년 입니다.
console.log("제 이름은 "+ userName + "이고, 나이는 " + userAge + "살 " + userGrade + "학년 입니다.")

//백틱(`)
console.log(`제 이름은 ${userName}이고, 나이는 ${userAge}살 ${userGrade}학년 입니다.`);

//수동 형변환
const test11 = "100";
console.log(test11, typeof test11);
const test22 = Number(test11);
console.log(test22, typeof test22);
const test33 = String(test22);
console.log(test33, typeof test33);

//연산자, 제어문 -> 자바와 거의 동일

//자바스크립트에만 존재하는 연산자 : ===, !==
const oper1 = 1;
const oper2 = "1";
console.log(oper1 == oper2);//자료형과 상관없이 자동형변환을 해서 값이 일치하면 true
console.log(oper1 === oper2);//자료형과 값이 모두 일치해야 true(!== 부정)

//반복문
for(let i=0;i<3;i++){
  console.log("안녕하세요");
}

const input = Number(prompt("정수를 입력하세요.")); //number로 강제형변환 안하면 기본값으루 문자열을 가져옴
console.log(input,typeof input);
if(input%2 ===0){
  console.log("짝수");
}else{
  console.log("홀수");
}

//짧은 조건문(&&연산 || 연산의 특성을 이용)
input%2 === 0 || console.log("홀수");
input%2 === 0 && console.log("짝수"); //2항 연산자 / 앞 조건식이 true면 console 실행