const stars1 = $(".star-wrap1>span");
stars1.on("click",function(){
  stars1.css("color","lightgray");
  $(this).prevAll().css("color","gold");
  $(this).css("color","gold");
  const index = stars1.index(this);
  $("#star-result").text(index+1);
});

$("#btn").on("click",function(){
  const score = $("#score").val();
  const changeWidth = 30 * score;
  $(".star-on").css("width","0px");
  // $(".star-on").css("width",changeWidth+"px");
  $(".star-on").animate({"width":changeWidth+"px"},300);
  /*
  const stars2 = $(".star-wrap2>span");
  stars2.css("color","lightgray");
  for(let i=0; i<score; i++){
    stars2.eq(i).css("color","gold");
  }
  */
});