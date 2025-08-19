<%@page import="kr.co.iei.member.model.service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    //1.인코딩
    request.setCharacterEncoding("utf-8");
    //2.값추출
    String memberId = request.getParameter("memberId");
    //3.비즈니스로직
    MemberService memberService = new MemberService();
    int result = memberService.deleteMember(memberId);
    //4.결과출력
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>회원 삭제결과</h3>
	<hr>
	<%if(result == 0){ %>
	<h1>회원삭제 실패</h1>
	<%}else { %>
	<h1>회원삭제 성공</h1>
	<%} %>
	<a href="/jsp/allMember.jsp">회원 목록으로</a>
</body>
</html>