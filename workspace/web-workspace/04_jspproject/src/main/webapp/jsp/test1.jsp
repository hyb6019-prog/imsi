<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>데이터를 받는 jsp</h1>
	
	
	<%
	//자바주석도 가능
	String name = request.getParameter("name");
	System.out.println("name : " + name);
	%>
	<hr>
	<h3><%= name %></h3>
</body>
</html>