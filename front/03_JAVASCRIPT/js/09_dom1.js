//클릭1 버튼을 누르면 동작하는 함수
function func1(){
  //<p>안녕</p>를 생성해서 add-zone div에 추가
  //요소노드 : <p></p> , 텍스트노드 : 안녕
  //1. 요소노드 생성(내가 생성하고싶은 태그를 만들어내는 과정);
  const p = document.createElement("p");//p태그 생성 -> <p></P>
  //태그를 자바스크립트에서 처리할 수 있는 객체형태로 생성 후 저장
  //2. 텍스트노드 생성
  const text = document.createTextNode("안녕");//안녕이라는 문자열을 텍스트노드 형태로 생성

  /*
  <p></p>
  안녕

  -> <p>안녕</p>
  node1.appendChild(node2) : node1의 마지막 자식으로 node2를 추가
  */
  p.appendChild(text);//p태그의 마지막자식으로 안녕이라는 글씨를 추가 -> <p>안녕</p>

  //문서에서 이미 작성된 태그를 가져오는 방법(아이디)
  //문서에서 아이디가 add-zone인 태그를 가지고와서 변수에 저장
  const addZone = document.getElementById("add-zone");//<div id="add-zone"></div>
  /*
  <div id="add-zone">
    <p>안녕</P>
  </div>
  */
  addZone.appendChild(p);
}

function func2(){
  //img src="img.dora.png">를 생성해서 add-zone div에 추가
  //노드 : <img> 요소노드만 존재
  //1. img 태그 생성
  const img = document.createElement("img");//<img>
  //2. img 태그의 src속성값을 img/dora.png 변경
  img.src = "img/dora.png";//<img src="img/dora.png">
  //3. id가 add-zone인 div를 문서에서 가져옴
  const addZone = document.getElementById("add-zone");
  //4. add-zone에 자식으로 img태그를 추가
  addZone.appendChild(img);
}


function func3(){
/*
  <ul>
    <li><a href="#">메뉴1</a><li>
    <li><a href="#">메뉴2</a><li>
    <li><a href="#">메뉴3</a><li>
  </ul>
*/

// const text1 = document.createTextNode("메뉴1");
// const a1 = document.createElement("a");
// a1.href = "#";
// a1.appendChild(text1);
// const li1 = document.createElement("li");
// li1.appendChild(a1);

// const text2 = document.createTextNode("메뉴2");
// const a2 = document.createElement("a");
// a2.href = "#";
// a2.appendChild(text2);
// const li2 = document.createElement("li");
// li2.appendChild(a2);

// const text3 = document.createTextNode("메뉴3");
// const a3 = document.createElement("a");
// a3.href = "#";
// a3.appendChild(text3);
// const li3 = document.createElement("li");
// li3.appendChild(a3);

// const ul = document.createElement("ul");
// ul.appendChild(li1);
// ul.appendChild(li2);
// ul.appendChild(li3);

// const testZone = document.getElementById("test-zone");
// testZone.appendChild(ul);

/*
const ul = document.createElement("ul");
for(let i=0;i<3;i++){
  const li = document.createElement("li");
  const a = document.createElement("a");
  a.href="#";
  const text = document.createTextNode("메뉴"+(i+1));
  a.appendChild(text);
  li.appendChild(a);
  ul.appendChild(li);
}
const testZone = document.getElementById("test-zone");
testZone.appendChild(ul);
*/ //for문

const ul = document.createElement("ul");
const menus = [
  {text : "메뉴1", url : "#"},
  {text : "메뉴2", url : "#"},
  {text : "메뉴3", url : "#"},
]
menus.forEach(function(item, index){
  const li = document.createElement("li");
  const a = document.createElement("a");
  a.href=item.url;
  const text = document.createTextNode(item.text);
  a.appendChild(text);
  li.appendChild(a);
  ul.appendChild(li);
});
/*
for(let i=0;i<menus.length;i++){
  const li = document.createElement("li");
  const a = document.createElement("a");
  a.href=menus[i].ur1;
  const text = document.createTextNode(menus[i].text);
  a.appendChild(text);
  li.appendChild(a);
  ul.appendChild(li);
}
*/
const testZone = document.getElementById("test-zone");
testZone.appendChild(ul);
}

function hidePw(){
  const pwInput = document.getElementById("pw");

  const hideBtn = document.getElementById("hide-btn");
  const showBtn = document.getElementById("show-btn");
  //don객체.style.css속성 = "변경값";
  showBtn.style.display = "inline";//패스워드 보이는 버튼 보이기
  hideBtn.style.display = "none";//패스워드 숨기는 버튼 숨기기
  pwInput.type = "password";

}

function showPw(){
  const pwInput = document.getElementById("pw");
  const hideBtn = document.getElementById("hide-btn");
  const showBtn = document.getElementById("show-btn");
  //don객체.style.css속성 = "변경값";
  showBtn.style.display = "none";//패스워드 보이는 버튼 숨기기
  hideBtn.style.display = "inline";//패스워드 숨기는 버튼 보이기
  pwInput.type = "text";
}

function func4(){
  const h2 = document.getElementById("h2");
  //h2태그의 글씨색 / 배경색 변경
  //dom객체의 일반 속성 변경 객체이름.속성이름 = 변경할 값;
  //css관련속성 => 객체이름.style.css속성이름 = 변경할 값;
  h2.style.color = "red";
  //적용하려는 css속성에 -가 포함되어있으면 카멜표기법으로 변경
  h2.style.backgroundColor = "yellow";
}

function func5(){
  // const delDiv = document.getElementById("del-div3");
  const delDiv = document.querySelector("#del-div3");
  //dom객체.remove();
  delDiv.remove();
  // delDiv.style.display = "none"; //화면에서만 안보일뿐 데이터는 남아있음
}
function func6(){
  // document.getElementsByClassName("del-div"); //getElementsByClassName은 복수로 무조건 배열로 가져옴
  //이미 문서에 있는 요소를 선택하는 방법 -> css 선택자로 선택
  //document.querySelector("css선택자");
  // -> 해당 선택자에 해당하는 요소를 1개 가져옴(동일한 선택자인 요소가 여러개인 경우 -> 제일 먼저 작성된것 1개만)

  //document.querySelectorAll("css선택자");
  //-> 해당 선택자에 해당하는 요소를 모두 배열형태로 가져옴(선택자로 선택된 요소가 1개면 -> 길이가 1인 배열)
  const divs = document.querySelectorAll(".del-div");
  divs.forEach(function(item){
    item.remove();
  });
}
function func7(){
  const btn = document.querySelector("#btn");
  //a.href=
  //img.src = 
  //input.type
  //div.style.css속성.
  //이벤트속성을 설정할 때는 반드시 함수형태를 대입
  btn.onclick = function(){
    const div5 = document.querySelector("#del-div5");
    div5.remove();
  }
}
function func8(){
  const btn = document.querySelector("#btn");
  btn.onclick = null;
}


