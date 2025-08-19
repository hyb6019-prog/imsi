//배열 순회 함수
/*
  for(int i=0;i<list.size();i++){
    string data = list.get(i);
    sysout(data);
  }

  for(String data : list){
      sysout(data);
  }
*/

const arr = [6,5,2,4,3,1];
console.log(arr);
for(let i=0; i<arr.length; i++){
  console.log(i, arr[i]);
}
//forEach() : 해당 배열을 처음부터 끝까지 순회하면서 필요한 동작을 수행하는 함수
//forEach 함수의 매개변수로 필요한 동작을 수행할 함수 전달
//내부 함수의 매개변수로 데이터를 받음
//첫번째 매개변수가 반복하면서 접근하는 배열의 각 요소 -> arr[i]
//두번째 매개변수가 반복회차 -> i
console.log("foreach1");
arr.forEach(function(index, item){
  console.log(index, item);
});
console.log("foreach2");
//매개변수는 이름이 중요한게 아니라 순서가 중요
arr.forEach(function(aaa,bbb){
  console.log(bbb,aaa);
});
console.log("foreach3");
//만약 반복회차가 필요없는 경우 -> 두번째 매개변수는 선언하지 않고 사용해도 무관
arr.forEach(function(item){
  console.log(item);
});
console.log("foreach4");
//만약 반복회차만 필요한 경우 -> 데이터가 필요없음 -> forEach를 사용할 필요가 없음
const data = arr.forEach(function(item,index){
  console.log(index);
});
//forEach는 수행하면 리턴이 없음 -> 리턴이 없는 함수의 수행결과를 변수에 저장하면 -> 변수는 undefined
console.log(data);

//map : forEach와 마찬가지로 배열을 순회하는 함수, 내부함수에서 return하는 데이터를 다시 배열로 묶어줌
//-> 기존 배열에 있는 데이터를 가공해서 새로운 배열을 만들어낼 때 사용하는 함수
const arr1 = arr.map(function(item,index){
  const str = `${index}번째 데이터는 ${item}`;
  console.log(str);
  return str;
});
console.log(arr1)

const arr2 = new Array();
for(let index=0; index<arr.length; index++){
  const item = arr[index];
  const str = `${index}번째 데이터는 ${item}`;
  console.log(str);
  arr2.push(str);
}
console.log(arr2);

console.log("filter");
//filter : 배열에서 특정 조건에 만족하는 데이터만 다시 필터링해서 배열로 묶어줄 때 사용
const arr3 = arr.filter(function(item, index){
  //해당 회차에서 필요한 연산을 모두 마치고 최종 결과로 true/false를 리턴
  //true를 리턴하면 해당 회차의 아이템은 결과배열에 포함 / false를 리턴하면 해당 회차의 아이템은 결과배열에 포함x
  console.log(item, item > 3);
  return item > 3;
});
console.log(arr3);

const arr5 = new Array();
for(let index=0; index<arr.length; index++){
  const item = arr[index];
  if(item > 3){
    arr5.push(item);
  }
}

//map은 항상 원본배열과 같은 렝스 길이를 가짐 / filter는 
const arr4 = arr.map(function(item, index){
  if(item > 3){
    return item;
  }
});
console.log(arr4);