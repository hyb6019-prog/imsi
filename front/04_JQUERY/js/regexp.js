//Regular Expression 정규표현식

$("#btn").on("click",function(){
  const inputValue = $("#input").val();
  /*
  javascript에서 정규표현식 사용하는 방법
  const 변수 = /정규표현식/;        //정규표현식 객체
  변수.test(문자열) : 매개변수로 전달한 문자열이 정규표현식에 만족하면 true 만족하지 못하면 false를 리턴
  */
  let regExp;
  //1. a라는 문자가 포함되어 있으면 
  // regExp = /a/;
  //2. b라는 문자가 포함되어 있으면 
  // regExp = /b/;
  //3. a 또는 b가 포함되어 있으면  //대괄호 포함시켜야 됨
  // regExp = /[ab]/;
  //4. a로 시작하면   //제일 앞에 a로 시작해야만 true
  // regExp = /^a/;
  //5. b로 시작하면
  // regExp = /^b/;
  //6. a 또는 b로 시작하면
  // regExp = /^[ab]/;
  //7. a로 끝나면
  // regExp = /a$/;
  //8. b로 끝나면
  // regExp = /b$/;
  //9.a 또는 b로 끝나면
  // regExp = /[ab]$/;
  //10. a로 시작해서 b로 끝나면(단. 중간에 아무문자나 여러개와도 상관없음)
  // regExp = /^a.*b$/;
  //11. 숫자만 입력하고 싶은 경우
  // regExp = /^[0-9]+$/;
  //12. 영어 대/소문자만 입력하고 싶은 경우
  // regExp = /^[a-zA-Z]+$/;
  //13. 한글만 입력하고 싶은 경우
  // regExp = /^[ㄱ-ㅎㅏ-ㅣ가-힣]+$/;
  //14. 이름을 입력하고 싶은 경우(한글3글자)
  // regExp = /^[가-힣]{3}$/;
  //15. 이름을 입력하고 싶은 경우(한글 2글자~4글자)
  // regExp = /^[가-힣]{2,4}$/;
  //16. 이름을 입력하고 싶은 경우(한글 2글자 이상)
  regExp = /^[가-힣]{2,}$/;


  const result = regExp.test(inputValue);
  console.log(result);
});
//회원가입을 하는 경우
//아이디가 영어 대/소문자+숫자로 6~20글자인지 체크  // db상 유효성검사가 통과되지 않으면 나머지는 의미가 없어서 이것부터 체크
//아이디가 중복인지 체크
//위 두 조건을 모두 만족해야 submit
//둘 중 하나라도 만족하지 않으면 전송 안함
const arr = ["user01","user02","user03"];

let idCheckResult = true;
$("#id").on("keyup",function(){
  const idReg = /^[a-zA-Z0-9]{6,20}$/;
  const inputId = $("#id").val();
  const result = idReg.test(inputId);
  console.log(result);
  if(result){
    //정규표현식에 만족 상태 -> 중복체크
    const index = arr.indexOf(inputId);
    if(index === -1){
      //아이디가 중복이 아닌 경우
      idCheckResult = false;
      $("#checkMsg").text("사용 가능한 아이디 입니다.")
      $("#checkMsg").css("color","blue");
    }else{
      //아이디가 중복인 경우
      idCheckResult = true;
      $("#checkMsg").text("이미 사용중인 아이디 입니다.")
      $("#checkMsg").css("color","red");
    }
  }else{
    //정규표현식 만족하지 못한 상태
    idCheckResult = true;
    $("#checkMsg").text("아이디는 영문+숫자로 6~20글자입니다.");
    $("#checkMsg").css("color","red");
  }
});

$("#submit").on("click",function(e){   //if문 위 아래 둘다 가능
  const msg = $("#checkMsg").text();
  if(msg !== "사용 가능한 아이디 입니다."){
    e.preventDefault();//기본이벤트 제거(submit 동작을 멈춤)
  }
  if(idCheckResult){
    e.preventDefault();//기본이벤트 제거(submit 동작을 멈춤)
  }
});

$("#pw").on("keyup",function(){ //비밀번호 유효성 검사
  const pwValue = $("#pw").val();

  const regArr = [
    /^.{8,20}$/,
    /[A-Z]/,
    /[a-z]/,
    /[0-9]/,
    /[!@#$%]/
  ];
  for(let i=0; i<regArr.length; i++){
    const check = regArr[i].test(pwValue);
    if(check){
      $(".msg>div").eq(i).addClass("ok");
    }else{
      $(".msg>div").eq(i).removeClass("ok");
    }
  }
});