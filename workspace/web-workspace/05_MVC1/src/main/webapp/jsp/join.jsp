<%@page import="kr.co.iei.member.model.service.MemberService"%>
<%@page import="kr.co.iei.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    //1. 인코딩
    request.setCharacterEncoding("utf-8");
    //2. 값추출
    String memberId = request.getParameter("memberId");
    String memberPw = request.getParameter("memberPw");
    String memberName = request.getParameter("memberName");
    String memberPhone = request.getParameter("memberPhone");
    String memberAddr = request.getParameter("memberAddr");
    //3. 비즈니스로직
    Member m = new Member();
    m.setMemberId(memberId);
    m.setMemberPw(memberPw);
    m.setMemberName(memberName);
    m.setMemberPhone(memberPhone);
    m.setMemberAddr(memberAddr);
    MemberService memberService = new MemberService();
    int result = memberService.insertMember(m);
    //4. 결과처리
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입 결과</h1>
	<hr>
	<%if(result > 0) {%>
	<h3>회원 가입 성공!!</h3>
	<%}else { %>
	<h3>회원 가입 실패</h3>
	<%} %>
	<a href="/">메인페이지로 이동</a>
</body>
</html>