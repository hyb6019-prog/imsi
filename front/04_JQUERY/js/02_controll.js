function func1(){
  //js방식
  /*
  const divs = document.querySelectorAll("#test1>div");
  for(let i=0;i<divs.length;i++){
    console.log(`${i} : ${divs[i].innerText}`);
  }

  divs.forEach(function(item,i){
    console.log(`${i} : ${item.innerText}`);
  })

  //내부 수행 코드에서 반복회차번호가 필요없으면 선언하지 않고 사용
  divs.forEach(function(item){
    console.log(item.innerText);
  })
  
  //jQuery 방식
  const divs = $("#test1>div");
  for(let i=0;i<divs.length;i++){
    console.log(`${i} : ${divs.eq(i).text()}`);
  }
  //each : js의 forEach와 유사한 함수로 배열 전체를 순회
  //배열.each(function(i, item){})
  // -> 내부함수의 매개변수 순서가 js의 forEach와 반대
  // -> 첫번째 매개변수가 순회번호 / 두번째 매개변수가 해당 순번의 배열에서 꺼내온 데이터
  // -> 이 때 두번째 매개변수 item은 javascript 객체
  // -> jQuery 형식으로 사용하려면 $(item) 형식으로 사용

  divs.each(function(i, item){
    console.log(i + " : " + $(item).text());
  });
  //내부 수행코드에서 반복회차번호가 필요없는 경우
  // -> i값을 사용하지 않더라도 반드시 선언해야함
  divs.each(function(i, item){
    console.log($(item).text());
  });
  */
  const divs = $("#test1>div");
  //each 문법2 -> $.each(divs,function(i, item){});

  //객체.is("선택자") : 객체가 해당 선택자에 해당되면 true / 아니면 false를 리턴
  divs.each(function(i, item){
    const div = $(item);
    console.log(i + " : " + div.text());
    //이번회차의 객체가 d1클래스를 가지고 있는지 체크
    /*
    const test1 = divs.is(".d1");
    console.log(test1);
    */
    if(div.is(".d1")){
      div.css("color","red");
    }else if(div.is(".d2")){
      div.css("color","blue");
    }else{
      div.css("background-color","yellow");
    }
  });
}
function func2(){
  //js 방식
  // const divs = document.querySelectorAll("#test2>div");
  // divs[0].classList.add("t-red");
  // divs[1].classList.add("t-red");
  // divs[2].classList.add("t-red");
  // divs[3].classList.add("t-red");
  // divs[4].classList.add("t-red");


  // divs.forEach(function(item){
  //   item.classList.add("t-red");
  // })

  //jQuery 방식
  const divs = $("#test2>div");
  // divs.eq(0).addClass("t-red");
  // divs.eq(1).addClass("t-red");
  // divs.eq(2).addClass("t-red");
  // divs.eq(3).addClass("t-red");
  // divs.eq(4).addClass("t-red");
  
  // divs.each(function(i, item){
  //   $(item).addClass("t-red");
  // });
  divs.addClass("t-red");
  divs.eq(2).addClass("bg-yellow");
  divs.eq(3).addClass("bg-yellow");
}
function func3(){
  const divs = $("#test2>div");
  divs.removeClass("t-red");
  divs.removeClass("bg-yellow");
}
function func4(){
  const divs = $("#test2>div");
  const data1 = divs.eq(1).hasClass("bg-yellow");
  const data2 = divs.eq(2).hasClass("bg-yellow");
  console.log(data1);
  console.log(data2);
}
function func5(){
  const divs = $("#test2>div");
  divs.toggleClass("bg-yellow");
}
function func6(){
  // const inputs = $("#test3>input");
  const labels = $("#test3>label");
  labels.each(function(i,label){
    const id = $(label).prev().attr("id");
    $(label).attr("for",id);
  });
  //객체.attr(param1, param2) : 객체의 parma1속성에 param2값을 대입
  //객체.attr(param1) : param1 속성에 해당하는 값을 리턴
  // const id1 = inputs.eq(0).attr("id");
  /*
  const id1 = labels.eq(0).prev().attr("id");
  labels.eq(0).attr("for",id1);
  // const id2 = inputs.eq(1).attr("id");
  const id2 = labels.eq(1).prev().attr("id");
  labels.eq(1).attr("for",id2);
  // const id3 = inputs.eq(2).attr("id");
  const id3 = labels.eq(2).prev().attr("id");
  labels.eq(2).attr("for",id3);
  */
}
function func7(){
  const labels = $("#test3>label");
  labels.removeAttr("for");
}
function func8(){
  const inputs = $("#test3>input");
  const data = inputs.first().prop("checked");
  inputs.prop("checked",true);
  console.log(data);
}


function func9(){
  const divs = $("#test4>div");
  //css함수에 매개변수 1개(css속성이름) 넣으면 해당 속성에 적용된 값을 가져옴
  const data1 = divs.eq(0).css("float");
  console.log(data1);
  const data2 = divs.eq(0).css("background-color");
  console.log(data2);
  //css함수에 매개변수 2개넣으면 속성을 변경
  divs.eq(1).css("background-color","blue");
  //대상 객체에 css속성을 한번에 여러개 변경하려면?
  // divs.first().css("background-color","red").css("float","none");
  divs.first().css({  //  매개변수로 {}를 넣으면 객체
    backgroundColor : "red",
    float : "none"
  })
}

function func10(){
  const h1 = $("#test5>h1");
  //html()를 매개변수 없이 사용하면 값을 가져옴
  const data = h1.html();
  console.log(data);
  //html(param1) : 매개변수를 주면 매개변수로 컨텐츠 영역을 변경
  h1.html("<span>hh</span>");
}
function func11(){
  const h1 = $("#test5>h1");
  //text()를 매개변수 없이 사용하면 값을 가져옴
  const data = h1.text();
  console.log(data);
  //text(param1) : 매개변수를 주면 매개변수로 컨텐츠 영역을 변경
  h1.text("<span>hh<span>");
}
function func12(){
  const input = $("#test5>input");
  //val()를 매개변수 없이 사용하면 value속성에 있는 값을 가져옴
  const inputValue = input.val();
  console.log(inputValue);
  //val(param1) : 매개변수를 주면 매개변수로 value속성 값을 변경
  input.val("값변경");
}
let i = 5;
function func13(){
  //js 방식
  // const p = document.createElement("p");
  //jQuery에서 새로운 dom 객체를 생성하는 방법
  const p = $("<p>");  //<>을 넣어줘야 생성 안넣으면 불러오기 <p></p>
  p.text("test - "+i);//<p>test</p>
  i++;
  const div = $("#test6");
  //객체1.append(객체2) : 객체1의 마지막자식으로 객체2를 추가
  div.append(p);
  //객체2.appendTo(객체1) -> p.appendTo(div);
}
function func14(){
  const p = $("<p>");
  p.text("test -- "+i);
  i++;
  const div = $("#test6");
  //객체1.prepend(객체2) : 객체1의 첫번째자식으로 객체2를 추가
  div.prepend(p);
  //객체2.prependTo(객체1) : 객체2를 객체1의 첫번째자식으로 추가
}
function func15(){
  const p = $("<p>");
  p.text("test -- "+i);
  i++;
  const div = $("#test6");
  //객체1.after(객체2) : 객체1의 다음요소로 객체2를 추가
  div.after(p);
  //객체2.insertAfter(객체1)
}
function func16(){
    const p = $("<p>");
  p.text("test -- "+i);
  i++;
  const div = $("#test6");
  //객체1.before(객체2) : 객체1의 이전요소로 객체2를 추가
  div.before(p);
  //객체2.insertBefore(객체1)
}
const btn17 = $("#btn17");
btn17.on("click", function(){
  const h3 = $("#test7>h3");
  h3.remove();  //대상객체 제거
});
$("#btn18").on("click",function(){
  const div = $("#test7");
  div.empty();//대상객체는 남겨두고 내부의 모든 후손을 삭제
})
$("#btn19").on("click",function(){ //이동
  const h2 = $("#test7>h2");
  const div = $("#test8");
  div.append(h2);
})
$("#btn20").on("click",function(){ //복사
  const h2 = $("#test7>h2").clone();
  const div = $("#test8");
  div.append(h2);
})