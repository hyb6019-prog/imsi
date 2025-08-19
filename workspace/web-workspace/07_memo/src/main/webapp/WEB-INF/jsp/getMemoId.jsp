<%@page import="kr.co.iei.memo.vo.Memo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%Memo m = (Memo)request.getAttribute("oneMemo"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1><%=m.getMemoWriter() %>의 작성글 조회</h1>
	<hr>
	<table border="1">
		<tr>
			<th>제목</th>
			<td><%=m.getMemoTitle() %></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><%=m.getMemoContent() %></td>
		</tr>
		<tr>
			<th>작성일</th>
			<td><%=m.getWriteDate() %></td>
		</tr>
		<tr>
			<td colspan="2" align="center" style="font-size: 12px">
				<span><a href="/updateMemo?memoId=<%=m.getMemoId()%>">수정</a></span>
				<span><a href="/deleteMemo?memoId=<%=m.getMemoId()%>">삭제</a></span>
			</td>
		</tr>
	</table>
</body>
</html>