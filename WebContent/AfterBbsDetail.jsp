<%@page import="dto.AfterBbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
int seq = (int)request.getAttribute("seq");
AfterBbsDto bbs1 = (AfterBbsDto)request.getAttribute("bbs1");

%>


<h1 align="center">댕댕이 반려 동물 입양 후기</h1>

<form action="CommuBbsController" method="post">
	<input type="hidden" name="command" value="update">
<table border="1">
<tr>
	<td>카테고리</td>
	<td>제목</td>
</tr>
<tr>
	<td>작성자</td><td> 작성일, 조회수 </td>
</tr>
<tr>
<td colspan="2"><textarea rows="20" cols="100"></textarea></td>
</tr>
<tr>
	<td colspan="2" align="right"><button>삭제하기</button><input type="submit" value="수정하기"><td>
</tr>
</table>

</form>





</body>
</html>