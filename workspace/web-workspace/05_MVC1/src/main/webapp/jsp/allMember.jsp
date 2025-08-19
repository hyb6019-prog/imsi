<%@page import="kr.co.iei.member.model.vo.Member"%>
<%@page import="kr.co.iei.member.model.service.MemberService"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	//스크립틀릿 : 자바 코드치는 영역
    	//1. 인코딩
    	request.setCharacterEncoding("utf-8");
    	//2. 값추출
    	//3. 비즈니스로직
    	MemberService memberService = new MemberService();
    	ArrayList<Member> list = memberService.selectAllMember();
    	//4. 결과처리
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>전체회원 정보</h1>
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
		<%
		for(int i=0;i<list.size();i++){
			Member m = list.get(i);
		%>
		<tr>
			<td><%=m.getMemberNo() %></td>
			<td><a href="/jsp/updateFrm.jsp?memberId=<%=m.getMemberId()%>"><%=m.getMemberId() %></a></td>
			<td><%=m.getMemberPw() %></td>
			<td><%=m.getMemberName() %></td>
			<td><%=m.getMemberPhone() %></td>
			<td><%=m.getMemberAddr() %></td>
			<td>
				<%if(m.getMemberLevel() == 1){ %>
					관리자
				<%}else if(m.getMemberLevel() == 2){ %>
					정회원
				<%}else if(m.getMemberLevel() == 3){ %>
					준회원
				<%} %>
			</td>
			<td><%=m.getEnrollDate() %></td>
			<td><a href="/jsp/delete.jsp?memberId=<%=m.getMemberId()%>">삭제</a></td>
		</tr>
		<%} %>
	</table>
	<a href="/">메인페이지로 이동</a>
</body>
</html>