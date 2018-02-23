<%@page import="dto.CommuBbsDto"%>
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
CommuBbsDto comdto = (CommuBbsDto)request.getAttribute("comdto");
%>

<h1>디테일</h1>
<div align="center">
<table border="3">
<col width="150"><col width="750">
<form action="CommuBbsController" method="post">
	<input type="hidden" name="command" value="update">
<tr>
	<td><a href="CommuBbsController?command=classify&target_category=<%=comdto.getTarget_category() %>"><%=comdto.getCategory_name() %></a></td>
	<td><%=comdto.getTitle() %></td>
</tr>
<tr>
	<td colspan="2" align="right">작성자 &nbsp;&nbsp;&nbsp; <%=comdto.getReg_date() %>&nbsp;&nbsp;&nbsp; 조회수 : <%=comdto.getReadcount() %>&nbsp;</td>
</tr>
<tr>
<td colspan="2" col height="750"><div style="float:left;padding:9px 10px 0 0"><%=comdto.getContent() %></div></td>
</tr>
<tr>
	<td colspan="2" align="right"><button><a href="CommuBbsController?command=delete&seq=<%=comdto.getSeq() %>">삭제하기</a></button><input type="submit" value="수정하기"></td>
</tr>
</table>
</form>
</div>


<%-- <div align="center">
<form action="CommuBbsController" method="post">
	<input type="hidden" name="command" value="update">
<ul>
	<li class="title"><%=comdto.getCategory_name() %></li>
	<li class="title"><%=comdto.getCategory_name() %></li> --%>
</body>
</html>