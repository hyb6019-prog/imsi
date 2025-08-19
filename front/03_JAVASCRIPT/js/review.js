const addBtn = document.querySelector("#add-btn");
const input = document.querySelector(".input-box>input");
addBtn.addEventListener("click",function(){
  reviewAdd();
});
input.addEventListener("keyup",function(e){
  console.log(e);
  if(e.keyCode === 13){
    reviewAdd();
  }
});

function reviewAdd(){
  const inputValue = input.value;
  if(inputValue === ""){
    alert("감상평을 남겨주세요");
    return;
  }

  const ul = document.createElement("ul");
  ul.classList.add("review");

  const likeReview = document.createElement("li");
  likeReview.classList.add("review-like");

  const textReview = document.createElement("li");
  textReview.classList.add("review-text");
  textReview.innerText = inputValue;

  const removeReview = document.createElement("li");
  removeReview.classList.add("review-remove");

  const likeSpan = document.createElement("span");
  likeSpan.classList.add("material-icons");
  likeSpan.innerText = "thumb_up_off_alt";
  likeSpan.addEventListener("click",function(){
    if(likeSpan.innerText === "thumb_up"){
      likeSpan.innerText = "thumb_up_off_alt";
    }else if(likeSpan.innerText === "thumb_up_off_alt"){
      likeSpan.innerText = "thumb_up";
    }
  });

  const deleteSpan = document.createElement("span");
  deleteSpan.classList.add("material-icons");
  deleteSpan.innerText = "remove_circle_outline";
  deleteSpan.addEventListener("click",function(){
    ul.remove();
  });

  likeReview.appendChild(likeSpan);
  removeReview.appendChild(deleteSpan);

  ul.appendChild(likeReview);
  ul.appendChild(textReview);
  ul.appendChild(removeReview);

  const listBox = document.querySelector(".review-box");
  listBox.appendChild(ul);

  input.value = "";
};



for(key in objects/*객체*/){
    console.log(objects[key]);
}