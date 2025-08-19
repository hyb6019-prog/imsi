//배열 : 여러개 데이터를 인덱스로 관리하는 자료형
//자바와 차이점은 자바는 지정한 자료형만 여러개저장 가능하지만, js배열은 저장하는 자료형에 제한이 없음
//자바스크립트에서 배열을 선언하는 방법 1(대괄호)
const arr1 = [1,2,3];
console.log(arr1);
console.log(arr1[1]);//대괄호를 이용해서 해당 인덱스에 접근 가능
arr1[1] = 100;
console.log(arr1);
arr1[3] = 200;       //최초 선언 이후에도 길이가 변경될 수 있음(마치 리스트같이)
console.log(arr1);
arr1[5] = 300;       //인덱스를 건너띄어도 4번은 empty값으로 입력해놓고 5번에 값이 입력됨
console.log(arr1);
console.log(arr1[4]);
console.log(typeof arr1); //object 하나의 객체로 인식

//자바스크립트에서 배열 선언하는 방법2 (배열 생성자를 사용)
//const arr2 = []; //길이가 0인 배열 선언
const arr2 = new Array();//길이가 0인 배열 생성
console.log(arr2);
arr2[0]=100;
arr2[1]=200;
console.log(arr2);

const arr3 = new Array(1,2,3);//길이가 3인 배열을 선언하고 매개변수로 전달한 값을 순서대로 대입
console.log(arr3);

//자바 배열과 자바스크립트 배열의 차아
//자바 배열 : 동일 자료를 여러개 인덱스로 관리
//자바스크립트 배열 : 자료형과 무관하게 여러 데이터를 인덱스로 관리
const arr4 = ["유저1",100,true, [1,2,3]];
for(let i=0; i<arr4.length;i++){
  console.log(arr4[i], typeof arr4[i]);
}

//배열에서 제공하는 기본 함수
const arr = [1,2,3,4];
//indexOf(value) : 매개변수로 넣은 값이 배열에 몇번째 있는지 찾아주는 함수(없으면 -1);
console.log(arr.indexOf(3));
console.log(arr.indexOf(5));

//concat() : 여러 배열을 하나의 배열로 합쳐주는 함수
const fruits1 = ["사과", "바나나", "딸기"];
const fruits2 = ["복숭아", "파인애플", "귤"];
const testArr1 = [100,25,"hi",false];
const testArr2 = [true,[1,2,3]];

const data1 = fruits1.concat(fruits2,testArr1,testArr2); 
console.log(data1);
console.log(fruits1,fruits2,testArr1,testArr2); //원본 배열에는 아무 문제 없음

//join(value) : 배열내부 데이터를 매개변수를 기준으로 구분해서 하나의 문자열로 리턴
const data2 = fruits1.join(",");
console.log(data2);
const data3 = fruits1.join(" ");
console.log(data3);
const data4 = fruits1.join();//구분자로 사용할 매개변수를 전달하지 않으면 기본값인 ','로 처리
console.log(data4);
const data5 = fruits1.join("");
console.log(data5);

//HTML 태그를 자바스크립트에서 작성해야하는 경우
/*
<div>
  <ul>
    <li><a = href='#'>메뉴1</a><li>
    <li><a = href='#'>메뉴2</a><li>
  </ul>
</div>
*/
//const data6 = "<div><ul><li><a href='#'>메뉴1</a></li></ul></div>;
const data6 = [
  "<div>",
  "   <ul>",
  "      <li><a href='#'>메뉴1<a></li>",    
  "      <li><a href='#'>메뉴2<a></li>",
  "   </ul>",
  "</div>"    
].join("");
//sort() : 정렬(원본배열 순서 변경) -> 매개변수를 주지 않으면 유니코드기준 오름차순 정렬(문자열로 변환한 후 사전순)
const testArr3 = [100,25,10,50];
console.log(testArr3);
testArr3.sort();
console.log(testArr3);

function sortASC(a,b){
  return a-b;
}
function sortDESC(a,b){
  return b-a;
}

testArr3.sort(sortASC);
console.log(testArr3);

//push, pop, unshift, shift : 배열에 데이터를 추가하거나 삭제하는 함수
const testArr4 = [1,2,"hello",true];
//push(data) : 매개변수로 전달한 데이터를 배열의 가장 뒤에 추가 //add 역할
console.log(testArr4);
testArr4.push(100);
console.log(testArr4);
testArr4.push("hi");
console.log(testArr4);
//pop() : 배열의 가장 마지막값 제거
testArr4.pop();
console.log(testArr4);
//unshift(data) : 매개변수로 전달한 데이터를 배열의 가장 앞에 추가(기존 데이터들은 인덱스번호가 하나씩 밀림)
testArr4.unshift("안녕");
console.log(testArr4);
//shift() : 배열의 가장 앞의 데이터를 삭제(기존 데이터들은 인덱스번호가 하나씩 당겨짐)
testArr4.shift();
console.log(testArr4);

//slice splice

//slice : 배열의 지정된 인덱스번호의 데이터를 복사해서 리턴 -> 원본배열에는 변화가 없음
const testArr5 = testArr4.slice(1,3); //배열인덱스 1번부터 3번 앞까지 복사 / 문자열의 substring과 같음
console.log(testArr4);
console.log(testArr5);
const testArr6 = testArr4.slice(1);//매개변수를 하나주면 해당 인덱스부터 끝까지 복사
console.log(testArr4);
console.log(testArr6);

//testArr4을 전체복사하고 싶으면?
const testArr7 = testArr4; //얕은 복사
console.log(testArr4);
console.log(testArr7);
testArr7[3] = 20; //주소 값을 복사한 것으로 4와 7 모두 같이 바뀜
console.log(testArr4);
console.log(testArr7);

//깊은 복사를 하고싶으면? -> slice
const testArr8 = testArr4.slice(0);
console.log(testArr4);
console.log(testArr8);
testArr8[3] = 200;
console.log(testArr4);
console.log(testArr8);

//깊은복사 방법 2번째 -> 전개연산자
const testArr9 = [...testArr4];
console.log(testArr4);
console.log(testArr9);
testArr9[3] = 2000;
console.log(testArr4);
console.log(testArr9);

const testArr99 = [...testArr4,"추가데이터"];
console.log(testArr99);

//splice : 배열을 잘라내는 함수 -> 원본배열에서 잘라낸 데이터가 사라짐
//splice 함수의 매개변수를 2개 주는 경우
//splice(a,b);
//a : 잘라내기 시작할 인덱스번호
//b : 잘라낼 데이터의 갯수
const testArr10 = testArr9.splice(1,3);
console.log(testArr9);
console.log(testArr10);

//splice 함수의 매겨변수를 3개 주는 경우
//splice(a,b,c);
//a : 잘라내기 시작할 인덱스번호
//b : 잘라낼 데이터의 갯수
//c : 잘라낸 자리에 삽입할 데이터 / 옆으로 ,을 주고 계속 추가할 수 있음
console.log(testArr4);
const testArr11 = testArr4.splice(2,2,"test");
console.log(testArr4);
console.log(testArr11);

//splice를 이용해서 배열 중간데이터를 수정/삭제/추가하는 방법
//수정 : 배열.splice(수정하고싶은 인덱스번호,1,수정데이터);
//삭제 : 배열.splice(삭제하고싶은 인덱스번호,1);
//추가 : 배열.splice(추가하고싶은 인덱스번호,0,추가하고싶은 데이터);
console.log(testArr4);
testArr4.splice(2,1,"안녕");
console.log(testArr4);
testArr4.splice(1,1);
console.log(testArr4);
testArr4.splice(2,0,"bye");
console.log(testArr4);