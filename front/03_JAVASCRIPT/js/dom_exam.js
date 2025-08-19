function addMember(){
  let name = prompt("이름을 입력하세요 : ");
  let age = prompt("나이를 입력하세요 : ");
  let addr = prompt("주소를 입력하세요 : ");
  
  const text1 = document.createTextNode(name);
  const td1 = document.createElement("td");
  td1.appendChild(text1);
  const text2 = document.createTextNode(age);
  const td2 = document.createElement("td");
  td2.appendChild(text2);
  const text3 = document.createTextNode(addr);
  const td3 = document.createElement("td");
  td3.appendChild(text3);

  const tr = document.createElement("tr");
  tr.appendChild(td1);
  tr.appendChild(td2);
  tr.appendChild(td3);

  const tb = document.querySelector("#exam1");
  tb.appendChild(tr);
}

function addMember2(){
  let name = prompt("이름을 입력하세요 : ");
  let age = prompt("나이를 입력하세요 : ");
  let addr = prompt("주소를 입력하세요 : ");

  const text1 = document.createTextNode(name);
  const td1 = document.createElement("td");
  td1.appendChild(text1);
  const text2 = document.createTextNode(age);
  const td2 = document.createElement("td");
  td2.appendChild(text2);
  const text3 = document.createTextNode(addr);
  const td3 = document.createElement("td");
  td3.appendChild(text3);
  const text4 = document.createTextNode("삭제");
  const delt = document.createElement("button");
  delt.appendChild(text4);
  const td4 = document.createElement("td");
  td4.appendChild(delt);

    const tr = document.createElement("tr");
  tr.appendChild(td1);
  tr.appendChild(td2);
  tr.appendChild(td3);
  tr.appendChild(td4);

  const tb = document.querySelector("#exam2");
  tb.appendChild(tr);
}

function addMember3(){
  const tr = document.createElement("tr");
  const nameTh = document.createElement("th");
  const ageTh = document.createElement("th");
  const addrTh = document.createElement("th");
  const delBtnTh = document.createElement("th");
  const delBtn = document.createElement("button");

  const name = prompt("이름을 입력하세요 : ");
  const age = prompt("나이를 입력하세요 : ");
  const addr = prompt("주소를 입력하세요 : ");

  const nameText = document.createTextNode(name);
  const ageText = document.createTextNode(age);
  const addrText = document.createTextNode(addr);
  const deleteText = document.createTextNode("삭제");

  nameTh.appendChild(nameText);
  ageTh.appendChild(ageText);
  addrTh.appendChild(addrText);
  delBtn.appendChild(deleteText);
  delBtnTh.appendChild(delBtn);

  delBtn.onclick = function(){
    tr.remove();
  }

  tr.appendChild(nameTh);
  tr.appendChild(ageTh);
  tr.appendChild(addrTh);
  tr.appendChild(delBtnTh);

  const table = document.querySelector("#exam2>tbody");
  table.appendChild(tr);
}