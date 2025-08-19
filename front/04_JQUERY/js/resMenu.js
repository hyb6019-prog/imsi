$("#menu-btn").on("click",function(){
  $(".navi>ul").slideToggle();
});

//브라우저 크기가 변하는 경우 이벤트
$(window).on("resize", function(){
  //현재 창 크기
  const currentWidth = $(window).width();
  //화면크기(현재 창 크기)가 500px보다 큰 상황인데 화면에 메뉴 ul이 안보이면?
  if(currentWidth > 500 && $(".navi>ul").is(":hidden")){
    $(".navi>ul").removeAttr("style");
  }
});