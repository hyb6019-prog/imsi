<%@page import="kr.co.iei.memo.vo.Memo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    ArrayList<Memo> getAllMemo = (ArrayList<Memo>)request.getAttribute("allMemo");
    %>
    <style>
    	table{
    	"border-spacing: 0;
    	}
    	h1{
    	color: blue;
    	}
    	table th,table td{
    	border: 1px solid transparent;
    	text-align: center;
    	padding: 8px;
    	}
    </style>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>메모 목록</h1>
	<hr>
	<a href="/writeFrm">메모 작성하기</a>
	<form action="/searchWriter" method="get" id="searchFrm">
		<input type="text" name="memoWriter" placeHolder="작성자를 입력하세요">
		<input type="submit" value="조회">
	</form>
	<table style="border-spacing: 0;" border="1">
		<tr>
			<th style="width:15%; background-color: rgb(0, 204, 0);">메모번호</th>
			<th style="width:40%; background-color: rgb(0, 204, 0);">제목</th>
			<th style="width:25%; background-color: rgb(0, 204, 0);">작성자</th>
			<th style="width:20%; background-color: rgb(0, 204, 0);">작성일</th>
		</tr>
		<%for(Memo m : getAllMemo){ %>
		<tr>
			<td><%=m.getMemoId()%></td>
			<td><a href="/getMemoId?memoId=<%=m.getMemoId()%>"><%=m.getMemoTitle() %></a></td>
			<td><%=m.getMemoWriter() %></td>
			<td><%=m.getWriteDate() %></td>
		</tr>
		<%} %>
	</table>
	<a href="/">메인페이지로 돌아가기</a>
</body>
</html>