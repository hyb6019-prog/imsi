<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>MVC1 - 허예빈</h1>
	<hr>
	<%-- JSP 주석 --%>
	<%--
		전체회원 조회
		1. DB 작업 O
		2. query : select *from member_tbl order by 1
		3-2. 사용자에게 입력받을 값 없음 -> Controller 호출 (MVC1에서는 Controller는  JSP가 담당)
		
	 --%>
	 <h3><a href="/jsp/allMember.jsp">1. 전체회원조회</a></h3>
	 <%--
	 	회원가입
	 	1. DB 작업 O
	 	2. query : insert into member_tbl values(member_seq.nextval,?,?,?,?,?,3,to_char(sysdate,'yyyy-mm--dd'))
	 	3-1. 사용자에게 입력받을 값 -> 아이디,비밀번호,이름,전화번호,주소
	 		-> 입력받을 양식 페이지로 이동(MVC1에서는 일반 화면페이지도 JSP가 담당)
	  --%>
	  <h3><a href="/jsp/joinFrm.jsp">2. 회원가입</a></h3>
	 <%--
		아이디로 회원조회 
		select * from member_tbl where member_id = ?
	 --%>
	 <h3><a href="/jsp/searchIdFrm.jsp">3. 아이디로 회원조회</a></h3>
	 <%--
	   	회원삭제
	   	1. DB 작업 O
	   	2. query : delete from member_tbl where member_id = ?
	   	3-1. 사용자에게 입력받을 값 -> 아이디
	   		-> 입력받을 양식 페이지로 이동
	 --%>
	 <h3><a href="/jsp/deleteFrm.jsp">4. 회원삭제</a></h3>
	 <%--
	 	업데이트
	 	select * from member_tbl where member_id=?
		update member_tbl set
					member_pw=?,
					member_phone=?,
					member_addr=?,
					where member_no=?;
	  --%>
</body>
</html>