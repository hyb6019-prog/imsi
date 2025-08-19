<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSP 프로젝트</h1>
	<hr>
	<h3><a href="/jsp/test.jsp">테스트파일로 이동</a></h3>
	<h3><a href="/jsp/test1.jsp?name=허예빈">jsp에 데이터 전송</a></h3>
	<form action="/jsp/test2.jsp" method="get">
		<input type="text" name="num1">
		+
		<input type="text" name="num2">
		<input type="submit" value="더하기"> 
	</form>
</body>
</html>