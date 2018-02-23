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

<%-- <form action="AfterBbsController" method="post">
	<input type="hidden" name="command" value="AfterBbsDetail">
<table border="3">
<tr>
   <td><%=bbs1.getTitle() %></td>
</tr>
<tr>
   <td colspan="2" align="right">작성자 &nbsp;&nbsp;&nbsp; <%=bbs1.getRdate() %>&nbsp;&nbsp;&nbsp; 조회수 :</td>
</tr>
<tr>
<td colspan="2"><%=bbs1.getContent() %></td>
</tr>
<tr>
   <td colspan="2" align="right"><button><a href="AfterBbsController?command=delete">삭제하기</a></button><input type="submit" value="수정하기"></td>
</tr>
</table>

</form>
 --%>

<h1>디테일</h1>
<table border="3">
<col width="150"><col width="750">
<form action="AfterBbsController" method="post">
   <input type="hidden" name="command" value="AfterBbsDetail">
<tr>
   <td colspan="2"><%=bbs1.getTitle() %></td>
</tr>
<tr>
   <td colspan="2" align="right">작성자 &nbsp;&nbsp;&nbsp; <%=bbs1.getRdate() %>&nbsp;&nbsp;&nbsp; 조회수 : </td>
</tr>
<tr>
<td colspan="2" col height="750"><%=bbs1.getContent() %></td>
</tr>
<tr>
   <td colspan="2" align="right"><button><a href="CommuBbsController?command=delete">삭제하기</a></button><input type="submit" value="수정하기"></td>
</tr>
</table>




</body>
</html>