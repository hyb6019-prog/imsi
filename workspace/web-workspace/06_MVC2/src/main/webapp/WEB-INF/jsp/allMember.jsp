<%@page import="kr.co.iei.member.model.vo.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    ArrayList<Member> memberList = (ArrayList<Member>)request.getAttribute("allMemberList");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>전체회원조회</h1>
	<hr>
	<table border="1">
		<tr>
			<th>회원번호</th>
			<th>회원아이디</th>
			<th>회원비밀번호</th>
			<th>회원이름</th>
			<th>회원전화번호</th>
			<th>회원주소</th>
			<th>회원등급</th>
			<th>회원가입일</th>
			<th>회원삭제</th>
		</tr>
		<%for(Member m : memberList) {%>
		<tr>
			<td><%=m.getMemberNo() %></td>
			<td><%=m.getMemberId() %></td>
			<td><%=m.getMemberPw() %></td>
			<td><%=m.getMemberName() %></td>
			<td><%=m.getMemberPhone() %></td>
			<td><%=m.getMemberAddr() %></td>
			<%if(m.getMemberLevel() == 1){ %>
				<td>관리자</td>
			<%}else if(m.getMemberLevel() == 2){%>
				<td>정회원</td>
			<%}else if(m.getMemberLevel() == 3){%>
				<td>준회원</td>
			<%} %>
			<td><%=m.getEnrollDate() %></td>
			<td><a href="deleteMember?memberId=<%=m.getMemberId()%>">삭제</a></td>
		</tr>
		<% } %>
	</table>
	<a href="/">메인페이지로 이동</a>
</body>
</html>