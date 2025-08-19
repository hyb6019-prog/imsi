<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>MVC2</h1>
	<hr>
	<%--
		전체회원 조회
		1. DB 작업 ->O
		2. query -> select * from member_tbl order by 1
		3-2. 사용자에게 입력받을 데이터 없음 -> Controller 호출(MVC2구조에서는 Servlet)
	--%>
	<h3><a href="/allMember">1. 전체회원조회</a></h3>
	<%--
		회원가입
		1. DB작업 -> O
		2. query -> insert into member_tbl values(member_seq.nextval,?,?,?,?,?,3,to_char(sysdate,"yyyy-mm-dd))
		3-1. 사용자에게 입력받을 데이터 -> 아이디, 비밀번호, 이름, 전화번호, 주소
	 --%>
	 <h3><a href="/joinFrm">2. 회원가입</a></h3>
	 <%--
	 	아이디로 회원 조회
	 	select * from member_tbl where member_id=?
	 	
	  --%>
	  <h3><a href="/selectMemberIdFrm">3. 아이디로 회원 조회</a></h3>
	 
</body>
</html>