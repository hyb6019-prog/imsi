function func1(){
  console.log("인라인테스트2222");
}

const btn1 = document.querySelector("#btn1");
btn1.onclick = function(){
  console.log("고전이벤트 모델");
}

const btn2 = document.querySelector("#btn2");
btn2.addEventListener("click",function(){
  console.log("표준이벤트모델");
});

const btn3 = document.querySelector("#btn3");
const btn4 = document.querySelector("#btn4");

btn3.onclick = function(){
  console.log("고전이벤트모델 테스트 111")
}

btn3.onclick = function(){
  console.log("고전이벤트모델 테스트 222")
}

btn4.addEventListener("click", function(){
  console.log("표준이벤트모델 테스트 333")
})

btn4.addEventListener("click", function(){
  console.log("표준이벤트모델 테스트 444")
})

btn3.onclick = test1;

btn4.addEventListener("click",test1);

function test1(){
  console.log("test1");
}

const a = document.querySelector("#a");
a.addEventListener("click",function(){
  const result = window.confirm("네이버로 갈래?");
  if (result){
    //네이버로 이동
    location.href="http://www.naver.com";
  }else{
    //현재 페이지 잔류
  }
});

const submit = document.querySelector("#submit");
function checkPw(){
  const newPw = document.querySelector("#newPw");
  const newPwRe = document.querySelector("#newPwRe");
  const newPwValue = newPw.value;
  const newPwReValue = newPwRe.value;
  if(newPwValue === newPwReValue){

  }else{
    newPw.style.border = "1px solid red";
    newPwRe.style.border = "1px solid red";
    return false;
  }
}

/*
submit.addEventListener("click",function(e){
//표준 이벤트 모델에서 함수의 첫번째 매개변수에는 이벤트에 대한 정보가 들어있는 객체가 들어옴.
//이벤트 객체 중 perventDefault(); 함수는 해당 dom 객체가 가지고 있는 기본 이벤트를 제거함.
//e.preventDefault();


//비밀번호 변경 제출 조건
//0. 기존 비밀번호 틀렸을 때
//1. 새 비밀번호와 새 비밀번호 확인이 다를 때
//2. 새 비밀번호와 기존 비밀번호가 같을 때
//3. 새 비밀번호를 입력하지 않았을 떄




//기존 비밀번호가 1111이라고 가정
//기존 비밀번호, 새 비밀번호, 새 비밀번호 확인에 입력한 값을 모두 가져와야함.
const pw = document.querySelector("#pw");
const newPw = document.querySelector("#newPw");
const newPwRe = document.querySelector("#newPwRe");

const pwValue = pw.value;
const newPwValue = newPw.value;
const newPwReValue = newPwRe.value;

//1.    기존 비밀번호 체크
if(pwValue === "1111"){
  pw.style.border = "1px solid green";
}else{
  pw.style.border = "1px solid red";
  alert("비밀번호 까먹었니?")
  e.preventDefault();//submit 이벤트를 제거
}

//2. 새 비밀번호와 새 비밀번호 확인 값 체크
if(newPwValue === newPwReValue){
  newPw.style.border = "1px solid green";
  newPwRe.style.border = "1px solid green";
}else{
  newPw.style.border = "1px solid red";
  newPwRe.style.border = "1px solid red";
  e.preventDefault();
}
//3. 기존 비밀번호와 새 비밀번호 체크
if(pwValue === newPwValue){
  pw.style.border = "1px solid red";
  newPw.style.border = "1px solid red";
  e.preventDefault();
}else{
  pw.style.border = "1px solid green";
  newPw.style.border = "1px solid green";
}

//4. 새 비밀번호 입력 체크
if(newPwValue === ""){
  newPw.style.border = "1px solid red";
  e.preventDefault();
}else{
  newPw.style.border = "1px solid green";
}
});
*/

const div1 = document.querySelector(".div1");
div1.addEventListener("click",function(){
  alert("div1 클릭");
});
const div2 = document.querySelector(".div2");
div2.addEventListener("click",function(e){
  alert("div2 클릭");
  //e.stopPropagation();//이벤트 버블링을 막는 함수
});
const div3 = document.querySelector(".div3");
div3.addEventListener("click",function(e){
  alert("div3 클릭");
  e.stopPropagation();
});



const div4 = document.querySelector("#div4");
div4.addEventListener("click",function(){
  div4.style.backgroundColor = "yellow";
});

const div5 = document.querySelector("#div5");
div5.addEventListener("dblclick",function(){
  div5.style.backgroundColor = "green";
});

const div6 = document.querySelector("#div6");
div6.addEventListener("mouseenter",function(){
  console.log("mouseEnter");
  div6.style.backgroundColor = "black";
});
div6.addEventListener("mouseleave",function(){
  console.log("mouseLeave");
  div6.style.backgroundColor = "transparent";
});

const memberId = document.querySelector("#memberId");

memberId.addEventListener("focusin",function(){
  memberId.style.backgroundColor = "skyblue";
});
memberId.addEventListener("focusout",function(){
  memberId.style.backgroundColor = "white";
});

//아이디 중복체크용 테스트 데이터 (실제로는 DB에서 조회)
const userArr = new Array();
userArr.push("user01");
userArr.push("user02");
userArr.push("user03");

//keyup, focusout, change//focusout 보다 적합.
memberId.addEventListener("change",function(){
  console.log("아이디 중복 체크");
  const inputId = memberId.value; 
  const result = userArr.indexOf(inputId);
  const idChk = document.querySelector("#idChk");
  if(result === -1){
      //사용가능한 아이디
      idChk.innerText = "사용 가능한 아이디 입니다.";
      idChk.style.color = "blue";
  }else{
      //이미 사용중인 아이디
      idChk.innerText = "이미 사용중인 아이디 입니다.";
      idChk.style.color = "red";
  }
});