<%@page import="kr.co.iei.member.model.vo.Member"%>
<%@page import="kr.co.iei.member.model.service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
   //1. 인코딩
   request.setCharacterEncoding("utf-8");
   //2. 값추출
   String memberId = request.getParameter("memberId");
   //3. 비즈니스로직
   MemberService memberService = new MemberService();
   Member m = memberService.selectMemberId(memberId);
   //4. 결과출력
   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원 조회 결과</h1>
	<hr>
	<%if(m == null) { %>
		회원 조회 실패!!
	<%}else{ %>
		<ul>
			<li>회원번호 : <%=m.getMemberNo() %></li>
			<li>아이디 : <%=m.getMemberId()%></li>
			<li>비밀번호 : <%=m.getMemberPw()%></li>
			<li>이름 : <%=m.getMemberName()%></li>
			<li>전화번호 : <%=m.getMemberPhone()%></li>
			<li>주소 : <%=m.getMemberAddr()%></li>
			<%if(m.getMemberLevel() == 3){ %>
				<li>등급 : 준회원</li>
			<%}else if(m.getMemberLevel() == 2) { %>
				<li>등급 : 정회원</li>
			<%}else if(m.getMemberLevel() == 1) { %>
			    <li>등급 : 관리자</li>
			<%} %>
			<li>등급 : <%=m.getMemberLevel()%></li>
			<li>가입일 : <%=m.getEnrollDate()%></li>
		</ul>
	<%} %>
	<a href="/">메인페이지로 이동</a>
</body>
</html>