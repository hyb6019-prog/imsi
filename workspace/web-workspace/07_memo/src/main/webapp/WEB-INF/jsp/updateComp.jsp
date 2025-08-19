<%@page import="kr.co.iei.memo.vo.Memo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%Memo m = (Memo)request.getAttribute("update"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>수정하기</h3>
	<hr>
	<form action="/updateComp" method="post">
		<table border="1">
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="memoTitle" id="memoTitle" value="<%=m.getMemoTitle()%>">
				</td>
				
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea name="memoContent" id="memoContent" ><%=m.getMemoContent() %></textarea>
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>
					<input type="text" name="memoWriter" id="memoWriter" value="<%=m.getMemoWriter() %>">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정">
				</td>
			</tr>
		</table>
		<input type="hidden" name="memoId" value="<%=m.getMemoId()%>">
	</form>
</body>
</html>