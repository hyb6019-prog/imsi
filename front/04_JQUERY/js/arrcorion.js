$(".more").on("click", function(e){
  $(this).toggleClass("active");  //active 클래스 추가
  $(this).parent().next().slideToggle(400);
  e.stopPropagation();//이벤트 버블링 제거
});

$(".more").parent().on("click",function(){
  $(this).children().click();
});