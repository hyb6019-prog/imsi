<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>회원 삭제</h3>
	<hr>
	<form action="/jsp/delete.jsp" method="post">
		<label for="memberId">삭제 할 아이디 조회</label>
		<input type="text" name="memberId" id="memberId">
		<input type="submit" value="조회">
	</form>
</body>
</html>