$("#btn1").on("click", function(){
  const result = $("#result1");
  // const trs = $("#tbl1>tbody>tr:not(:first-child)");
  const trs = $("#tbl1>tbody>tr");
  trs.each(function(i, item){
    if(i !== 0){
      const div = $("<div>");
      const tds = $(item).children();
      const text = tds.eq(0).text() + "/" + tds.eq(1).text() + "/" + tds.eq(2).text();
      div.text(text);
      result.append(div);
    }
  });


  // const tds = $("#tbl1 td");
  // tds.each(function(i,item){
  //   console.log(i + $(item).text());
  //   result.append($(item).text());
  //   if(i%3 === 2){
  //     result.append("<br>");
  //   }else{
  //     result.append("/");
  //   }
  // });
})

$("#btn2").on("click", function(){
  const titleTh = $("tbl1 th");
  titleTh.addClass("title");

  const nameTd = $("#tbl1>tbody>tr>td:first-child");
  nameTd.addClass("name");
  const ageTd = $("#tbl1>tbody>tr>td:nth-child(2)");
  ageTd.addClass("age");
  $("#tb11>tbody>tr>td:last-child").addClass("addr");

  /*
  const tbs = $("#tbl1>tbody>tr>td");
  tds.each(function(i, item){
    if(i%3 === 0){
      $(item).addClass("name");
    }else if(i%3 === 1){
      $(item).addClass("age");
    }
  })
  */
});
$("#btn3").on("click",function(){
  const thTd = $("#tb11>tbody>tr>*");
  thTd.removeClass("title"),removeClass("name"),removeClass("age"),removeClass("addr");
})


/* 2번 내가 푼거


$("#btn2").on("click", function(){
  const tds = $("#tbl1>tbody>tr");
  // tds.eq(0).children().addClass("title");
  // tds.eq(0).children().next().addClass("title");
  // tds.eq(0).children().next().next().addClass("title");
  // tds.eq(1).children().addClass("name");
  // tds.eq(1).children().next().addClass("age");
  // tds.eq(1).children().next().next().addClass("addr");
  // tds.eq(2).children().addClass("name");
  // tds.eq(2).children().next().addClass("age");
  // tds.eq(2).children().next().next().addClass("addr");
  // tds.eq(3).children().addClass("name");
  // tds.eq(3).children().next().addClass("age");
  // tds.eq(3).children().next().next().addClass("addr");

  tds.each(function(i, item){
    if(i === 0){
      $(item).children().addClass("title");
      $(item).children().next().addClass("title");
      $(item).children().next().next().addClass("title");
    }else{
      $(item).children().addClass("name");
      $(item).children().next().addClass("age");
      $(item).children().next().next().addClass("addr");
    }
  })
})

$("#btn3").on("click", function(){
  const tds = $("#tbl1>tbody>tr");
  tds.each(function(i, item){
    if(i === 0){
      $(item).children().removeClass("title");
      $(item).children().next().removeClass("title");
      $(item).children().next().next().removeClass("title");
    }else{
      $(item).children().removeClass("name");
      $(item).children().next().removeClass("age");
      $(item).children().next().next().removeClass("addr");
    }
  })
})
*/

const colorDiv = $(".copy");
let color = "transparent";
colorDiv.on("click", function(){
  color = $(this).css("background-color");
})

// colorDiv.eq(0).on("click",function(){
//   color = $(this).css("background-color");
// })
// colorDiv.eq(1).on("click",function(){
//   color = $(this).css("backgreound-color");
// })

// const divs = $("#exam3>fieldset").last().children("div");
// const divs = $("#exam3>fieldset:last-child>div");
const divs = $("#exam3 div").not(".copy");
divs.on("click",function(){
  $(this).css("background-color",color);
});

$("#btn4").on("click",function(){
  // divs.css("background-color","transparent");
  divs.removeAttr("style");
  color = "transparent";
})

$("#btn5").on("click",function(){
  $("#result2").empty();
  const trs = $("#tbl2 input:checked").parent().parent();
  trs.each(function(i,tr){
    const div = $("<div>");
    const tds = $(tr).children();
    const text = tds.eq(1).text()+"/"+tds.eq(2).text()+"/"+tds.eq(3).text();
    div.text(text);
    $("#result2").append(div);
  });
  /*
  const trs = $("#tbl2>tbody>tr.not(:first-chold)");
  trs.each(function(i, tr){
    const input = $(tr).find("input");
    if(input.is(":checked")){
      const div = $("<div>");
      const tds = $(tr).children();
      const text = tds.eq(1).text()+"/"+tds.eq(2).text()+"/"+tds.eq(3).text();
      div.text(text);
      $("#result2").append(div);
    }
  });
  */
});













/* 내가 푼거
const copys = $("#exam3 div");
const redi = copys.first();
const bluei = copys.first().next();
redi.on("click", function(){
  let divs = $("#exam3>fieldset:nth-child(2)>div");
  divs.each(function(i, div){
    divs.on("click", function(){
      (div).css("background-color","red");  
    })
  })
})
// $(div).css("background-color","red");
*/