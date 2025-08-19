//JAVA -> HashMap
// key1 : value1, key2 : value2, key3 : value3..... HashMap<String,Object>
//객체 생성
const obj1 = {
  name : "유저1",
  age : 20,
  addr : "서울",
  test1 : [1,2,3,4],
  test2 : true,
  test3 : function(){
    console.log("hi");
  }
}
console.log(obj1);
//객체이름.key -> 해당 value를 가져옴
console.log(obj1.addr);
console.log(obj1.age);
//객체이름["key"] -> 해당 value를 가져옴
console.log(obj1["addr"]);

console.log(obj1.test1[1]);

obj1.test3(); //함수 불러오기

//객체 내부데이터 수정
obj1.age = 30;
console.log(obj1);
obj1.name = 100; //데이터타입이 다른 변수를 넣어도 수정됨
console.log(obj1);

//객체에 새로운 속성을 추가하는 방법(값 변경과 동일 -> 없는 key를 사용)
obj1.test4 = "추가데이터";
console.log(obj1);

//in : 객체에서 해당 키값을 사용하고 있는지 체크
console.log("age" in obj1);
console.log("phone" in obj1);

//객체에서 속성 삭제
delete obj1.age;
console.log(obj1);

