const tabs = $(".tab>div");
const contents = $(".tab-content>div");
tabs.on("click",function(){
  tabs.removeClass("active-tab");
  contents.slideUp(100);
  $(this).addClass("active-tab");
  const i = tabs.index(this);
  contents.eq(i).slideDown(100);
});
tabs.eq(0).click();