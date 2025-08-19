<%@page import="kr.co.iei.member.model.service.MemberService"%>
<%@page import="kr.co.iei.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    //1.인코딩
    request.setCharacterEncoding("utf-8");
    //2.값추출
    int memberNo = Integer.parseInt(request.getParameter("memberNo"));
    String memberPw = request.getParameter("memberPw");
    String memberPhone = request.getParameter("memberPhone");
    String memberAddr = request.getParameter("memberAddr");
    Member m = new Member();
    m.setMemberAddr(memberAddr);
    m.setMemberNo(memberNo);
	m.setMemberPhone(memberPhone);
	m.setMemberPw(memberPw);
	System.out.println(m);
    //3.비즈니스로직
    MemberService memberService = new MemberService();
    int result = memberService.updateMember(m);
    
    //4. 결과처리
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>회원 정보 수정</h3>
	<hr>
	<%if(result == 0) { %>
	<h1>회원 정보 수정 실패</h1>
	<%}else { %>
    		<h1>회원 정보 수정 성공</h1>
     <% }%>
	
</body>
</html>