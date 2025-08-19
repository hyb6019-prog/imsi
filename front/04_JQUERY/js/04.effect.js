const div = $("#div");
$("#btn1").on("click",function(){
  div.show(5000); //display를 원래 속성으로 변경
});
$("#btn2").on("click",function(){
  div.hide(); //display : none;
});
$("#btn3").on("click",function(){
  div.toggle(3000);
});
$("#btn4").on("click",function(){
  div.slideDown(400);
});
$("#btn5").on("click",function(){
  div.slideUp(5000);
});
$("#btn6").on("click",function(){
  div.slideToggle();
});

$("#btn7").on("click",function(){
  div.fadeIn();
});
$("#btn8").on("click",function(){
  div.fadeOut(5000);
});
$("#btn9").on("click",function(){
  div.fadeToggle();
});

$("#btn10").on("click",function(){
  div.animate({
    width:"150px", 
    height:"100px", 
    "background-color":"yellow"   //animate함수로 변경할 수 없는 css속성(단, 배경색은 jquery-ui를 사용하면 변경 가능)
  },5000); 
});