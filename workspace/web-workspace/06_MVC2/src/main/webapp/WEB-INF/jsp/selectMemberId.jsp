<%@page import="kr.co.iei.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	Member selectMember = (Member)request.getAttribute("memberId");
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>아이디로 조회 결과</h3>
	<hr>
	<ul>
		<li>회원번호 : <%=selectMember.getMemberNo() %></li>
		<li>회원아이디 : <%=selectMember.getMemberId() %></li>
		<li>회원비밀번호 : <%=selectMember.getMemberPw() %></li>
		<li>회원 이름 : <%=selectMember.getMemberName() %></li>
		<li>회원 전화번호 : <%=selectMember.getMemberPhone() %></li>
		<li>회원 주소 : <%=selectMember.getMemberAddr() %></li>
		<li>회원 등급 : <%=selectMember.getMemberLevel() %></li>
		<li>회원 가입일 : <%=selectMember.getEnrollDate() %></li>
	</ul>

</body>
</html>