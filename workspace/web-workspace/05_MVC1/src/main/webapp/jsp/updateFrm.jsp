<%@page import="kr.co.iei.member.model.vo.Member"%>
<%@page import="kr.co.iei.member.model.service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    //1.인코딩
    request.setCharacterEncoding("utf-8");
    //2. 값추출
    String memberId = request.getParameter("memberId");
    //3.비즈니스로직
    MemberService memberService = new MemberService();
    Member m = memberService.selectMemberId(memberId);
    //4.결과처리
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원정보 수정</h1>
	<hr>
	<form action="/jsp/update.jsp" method="post">
	<div>
		<label for="memberNo">회원번호 <%=m.getMemberNo() %></label>
		<input type="hidden" name="memberNo" id="memberNo" value="<%=m.getMemberNo()%>">
	</div>
	<div>
		<label for="memberId">아이디 <%=m.getMemberId() %></label>
		
	</div>
		<div>
			<label for="memberPw">비밀번호</label>
			<input type="password" name="memberPw" id="memberPw" value="<%=m.getMemberPw()%>">
		</div>
		<div>
			<label for="memberPhone">전화번호</label>
			<input type="text" name="memberPhone" id="memberPhone" value="<%=m.getMemberPhone()%>">
		</div>
		<div>
			<label for="memberAddr">주소</label>
			<input type="text" name="memberAddr" id="memberAddr" value="<%=m.getMemberAddr()%>">
		</div>
		<div>
			<input type="submit" value="수정하기">
		</div>
	</form>
</body>
</html>