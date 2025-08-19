const d1 = $(".d1");
//이 코드는 쓰지 말 것

//문서 전체에 클릭이벤트를 적용 -> 그중 특정 대상이 클릭되었을때만 동작하게 만드는 코드
//문서 전체에 클릭이벤트를 적용했는데 그 중 대상이 .d1이면 동작
//페이지에 요소가 많아지면 -> 클릭이벤트가 많아짐 -> 페이지 속도가 느려짐
// $(document).on("click",".d1",function(){
//   console.log($(this).text());
// });


//이 코드는 쓰지 말 것




d1.on("click",function(){
  //this : 이벤트를 동작시킨 해당 요소
  //해당 요소가 몇번째 요소인지 찾는방법
  const i = d1.index(this);
  console.log(i+" + "+$(this).text());
});
/*
d1.each(function(i, item){
  $(item).on("click",function(){
    console.log(i+" + "+$(item).text())
  });
});

d1.eq(0).on("click",function(){
  console.log(0+" + "+d1.eq(0).text());
});
d1.eq(1).on("click",function(){
  console.log(1+" + "+d1.eq(1).text());
})
*/

// $("#btn1").on("click",function(){
//   const div = $("<div>");
//   div.addClass("d1");
//   div.text("test");
//   /*
//   div.on("click",function(){
//     console.log(div.text());
//   })
//   */
//   $("#test1").append(div);
// });

// const btn = $(".btn"); 내가 푼것
// const span = $(btn.eq(0).next().next());
// btn.eq(0).on("click", function(){
//   let num = Number(span.eq(0).text())+1;
//   span.eq(0).text(num);
// });

const buttons = $(".levelup button");
buttons.on("click",function(){
  // const i = buttons.index(this);
  // const levelSpans = $(".levelup>div>span>last-child");
  // const currentLevelSpan = levelSpans.eq(i);
  const currentLevelSpan = $(this).next().next();
  const currentLevel = currentLevelSpan.text();
  const nextLevel = Number(currentLevel) + 1;
  currentLevelSpan.text(nextLevel);
});
// const btn = $(".btn");
// btn.each(function(i, item){
//   $(item).on("click",function(){
//     span = $(item).next().next();
//     level = span.text();
//     const levelUp = Number(level)+1;
//     span.text(levelUp);
//   })
// })

$("#btn6").on("click",function(){
// buttons.trigger("click");
buttons.click();


  // const levelSpans = buttons.next().next();
  /*
  const levelSpans = $(".levelup>div>span:last-child");
  levelSpans.each(function(i,item){
    const currentLevel = $(item).text();
    const nextLevel = Number(currentLevel)+1;
    $(item).text(nextLevel);
  })
    */
})

