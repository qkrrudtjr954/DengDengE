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
AfterBbsDto bbs = (AfterBbsDto)request.getAttribute("bbs2");
%>
${bbs }





<h1>디테일</h1>

<form action="AfterBbsController" method="post">
 <input type="hidden" name="command" value="AfterBbsUpdateAf">
 <input type="hidden" name="seq" value="<%=bbs.getSeq() %>">
<table border="3">
<col width="150"><col width="750">
<tr>
   <td colspan="1"><input type="text" name="title" value="<%=bbs.getTitle() %>"></td>
</tr>
<tr>
   <td colspan="2" align="right">작성자 &nbsp;&nbsp;&nbsp; <%=bbs.getRdate() %>&nbsp;&nbsp;&nbsp; 조회수 : </td>
</tr>
<tr>
<%-- <td colspan="2" col height="550"><%=bbs1.getContent() %></td> --%>
<td colspan="2">
<textarea rows="100" cols="150"  
name="content"><%=bbs.getContent() %>
</textarea>
</td>


</tr>
<tr>
<td colspan="1">
 <%--  <button><a href="AfterBbsController?command=AfterBbsUpdate&seq=<%=bbs.getSeq() %>"></a>수정하기</button> --%>
 <input type="submit" value="수정하기">
  </td>
</tr>


</table>
</form>


</body>
</html>