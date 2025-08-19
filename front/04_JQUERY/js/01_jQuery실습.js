function func1(){
  const p = $("#text");
  const text = p.text();
  console.log(text);
}
function func2(){
  const h3 = $(".text");
  console.log(h3.text());
}
function func3(){
  console.log($("[name=text]").text());
}
function func4(){
  // const checkbox = $("[name=text]:checked");
  const checkbox = $("[name=study]");
  const checkedbox = checkbox.filter(":checked");
  console.log(checkedbox.length);
}

function func5(){
  const pp = $("#pp");
  // const select = pp.prev().children().first();
  // const select = pp.parent().children().first().children().eq(0);
  const select = pp.parent().find("li").eq(0);

  select.css("border-color","red");
}
function func6(){
  const ul = $(".test ul");
  // const select = ul.next().children().eq(1);
  // const select = ul.parent().children().eq(1).children().eq(1);
  const select = ul.parent().find("#pica").next();

  select.css("border-color","red");
}
function func7(){
  const span = $("#pica");
  // const select = span.parent().parent();
  // const select = span.parents().eq(1);
  const select = span.parents("div").first();

  select.css("border-color","red");
}
function func8(){
  const div = $(".test");
  const select = div.find("li");
  for(let i=0;i<select.length;i++){
    console.log(select.eq(i).text());
  }
  // console.log(select.eq(0).text());
  // console.log(select.eq(1).text());
  // console.log(select.eq(2).text());
  // console.log(select.eq(3).text());
  // console.log(select.eq(4).text());
}