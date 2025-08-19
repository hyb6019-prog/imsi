const q1 = document.querySelector("#q1");
q1.onclick = function(){
  const name = prompt("이름 : ");
  const age = prompt("나이 : ");
  const addr = prompt("주소 : ");

  const name2 = document.querySelector(".examzone>div>#name");
  name2.innerText = name;
  const age2 = document.querySelector(".examzone>div>#age");
  age2.innerText = age;
  const addr2 = document.querySelector(".examzone>div>#addr");
  addr2.innerText = addr;
}
function func1(){
  const input = document.querySelector("#input1");
  const num = input.value;
  const result = document.querySelector(".examzone>.result");
  if(num%2 === 0){
    result.innerText = "짝수";
  }else if(num%2 === 1){
    result.innerText = "홀수";
  }else{
    result.innerText = "숫자가 아님";
  }
}
const img =  document.querySelector("img");
img.onclick = function(){
  img.src = "img/angel.png";
}
const q4 = document.querySelector("#q4");
q4.onclick = function(){
  const result = document.querySelector("body>div:last-of-type>#result");
  result.style.color = "navy";
}

