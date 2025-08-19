const addBtn = document.querySelector("#add-btn");
const input = document.querySelector(".input-box>input");
addBtn.addEventListener("click",function(){
  todoAdd();
});
input.addEventListener("keyup",function(e){
  console.log(e);
  if(e.keyCode === 13){
    console.log("야 애 엔터쳤어");
    todoAdd();
  }
});

function todoAdd(){
  const inputValue = input.value;
  if(inputValue === ""){
    alert("할일을 입력해주세요");
    return;
  }

  const ul = document.createElement("ul");
  ul.classList.add("todo");

  const likeLi = document.createElement("li");
  likeLi.classList.add("todo-like");

  const textLi = document.createElement("li");
  textLi.classList.add("todo-text");
  textLi.innerText = inputValue;

  const checkLi = document.createElement("li");
  checkLi.classList.add("todo-check");

  const likeSpan = document.createElement("span");
  likeSpan.classList.add("material-icons");
  likeSpan.innerText = "favorite_border";
  likeSpan.addEventListener("click",function(){
    if(likeSpan.innerText === "favorite"){
      likeSpan.innerText = "favorite_border";
    }else if(likeSpan.innerText === "favorite_border"){
      likeSpan.innerText = "favorite";
    }
  });

  const doneSpan = document.createElement("span");
  doneSpan.classList.add("material-icons");
  doneSpan.classList.add("done-btn");
  doneSpan.innerText = "check_circle";
  doneSpan.addEventListener("click",function(){
    doneSpan.remove();
    textLi.style.textDecoration = "line-through";
  });

  const deleteSapn = document.createElement("span");
  deleteSapn.classList.add("material-icons");
  deleteSapn.innerText = "delete_forever";
  deleteSapn.addEventListener("click",function(){
    ul.remove();
  });

  likeLi.appendChild(likeSpan);

  checkLi.appendChild(doneSpan);
  checkLi.appendChild(deleteSapn);

  ul.appendChild(likeLi);
  ul.appendChild(textLi);
  ul.appendChild(checkLi);

  const listBox = document.querySelector(".list-box");
  listBox.appendChild(ul);

  input.value = "";
};


/*
const likeBtn = document.querySelector(".todo-like>.material-icons");
likeBtn.addEventListener("click",function(){
  if(likeBtn.innerText === "favorite"){
    likeBtn.innerText = "favorite_border";
  }else if(likeBtn.innerText = "favorite_border"){
    likeBtn.innerText = "favorite";
  }
});
const doneBtn = document.querySelector(".done-btn");
doneBtn.addEventListener("click",function(){
  const todoText = document.querySelector(".todo-text");
  todoText.style.textDecoration = "line-through";
  doneBtn.remove();
});
const delBtn = document.querySelector(".todo-check>span:last-child");
delBtn.addEventListener("click",function(){
  const todo = document.querySelector(".todo");
  todo.remove();
});
*/
