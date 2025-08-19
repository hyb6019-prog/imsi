<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	int result = (Integer)request.getAttribute("result");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입결과</h1>
	<hr>
	<%if(result > 0) {%>
	<h3>회원 가입 성공</h3>
	<%}else { %>
	<h3>회원 가입 실패</h3>
	<%} %>
	
	<a href="/">메인페이지로 이동</a>
</body>
</html>