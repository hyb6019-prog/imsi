console.log("222");
const btn1 = document.querySelector("#btn1");
btn1.onclick = function(){
  /*
  window.open(param1,parm2,parm3)
  param1 : 주소(새 창에서 열릴 페이지 주소)
  param2 : 창의 이름
  param3 : 옵션
  */

  window.open("http://www.naver.com","네이버","width=500, height=500");
}

const btn2 = document.querySelector("#btn2");
let timeoutId;
btn2.onclick = function(){
  /*
  window.setTimeout(param1, param2);
  param1 : 일정시간 후 실행될 함수
  param2 : 일정시간(ms);
  */

  timeoutId = window.setTimeout(function(){
    alert("짠 ! ! !")
  },5*1000);

  window.setTimeout(func1,1*1000);
}
function func1(){
  alert("선언적 함수 !")
} 

const btn3 = document.querySelector("#btn3");
btn3.onclick = function(){
  window.clearTimeout(timeoutId);
}

const btn4 = document.querySelector("#btn4");
let intervalId;
btn4.onclick = function(){
  /*
  window.setInterval(param1, param2);
  param1 : 일정 시간마다 반복해서 실행할 함수
  param2 : 일정시간(ms);
  */
  intervalId = window.setInterval(function(){
      console.log("interval Test")
  },3*1000);
}

const btn5 = document.querySelector("#btn5");
btn5.onclick = function(){   
  window.clearInterval(intervalId);
}

const timeStart = document.querySelector("#time-start");
let timeId;
timeStart.onclick = function(){
  timeId = window.setInterval(function(){
    const date = new Date();
    //const currentTime = date.getHours() + " : " + date.getMinutes() + " : " + date.getSeconds();
    const currentTime = `${date.getHours()} : ${date.getMinutes()} : ${date.getSeconds()}`;
    const timeZone = document.querySelector("#time-zone");
    timeZone.innerText = currentTime;
  },1*1000)

  
}
const timeStop = document.querySelector("#time-stop");
timeStop.onclick = function(){
  window.clearInterval(timeId);
}


const btn7 = document.querySelector("#btn7");
btn7.onclick = function(){
  console.log("화면 너비 "+screen.width);
  console.log("화면 높이 "+screen.height);
  console.log("가용 너비 "+screen.availWidth);
  console.log("가용 높이 "+screen.availHeight);
  console.log("가용 색상 :"+screen.colorDepth);
  console.log("한 픽셀 당 비트 수 : "+screen.pixelDepth);
}

const btn8 = document.querySelector("#btn8");
btn8.onclick = function(){
  location.href ="http://www.naver.com"
}

const btn9 = document.querySelector("#btn9");
btn9.onclick = function(){
  location.reload();
}
//현재 위치의 위도 / 경도를 구함 -> 매개변수로 함수를 전달
//매개변수로 전달한 함수의 parameter로 결과를 전달
navigator.geolocation.getCurrentPosition(myLocation);

function myLocation(data){
  console.log(data);
}




console.log("333");