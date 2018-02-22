<%@page import="dto.CommuBbsDto"%>
<%@page import="java.util.List"%>
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
List<CommuBbsDto> bbslist = (List<CommuBbsDto>)request.getAttribute("bbslist");
%>

<div align="center">
<h1>커뮤니티</h1>
<table>
<col width="70"><col width="500"><col width="150"><col width="150">

<tr>
<th>카테고리</th><th>번호</th><th align="center">제목</th><th>작성자</th><th>작성일</th>
</tr>

<%
if(bbslist == null || bbslist.size() == 0){
	%>
	<tr>
		<td colspan="3">작성된 글이 없습니다</td>
	</tr>	
	<%
}

for(int i = 0;i < bbslist.size(); i++){
	CommuBbsDto bbs = bbslist.get(i);
	%>
	<tr>
	<td><%=bbs.getTarget_category() %></td>
	<td><%=i+1 %></td>
	<td>
		<%if(bbs.getDel()==1){ %>
         	[작성자가 삭제한 글 입니다.]	
      <%
      }
		 else{
	         %>
	         <a href="CommuBbsController?command=enter&seq=<%=bbs.getSeq() %>">
	         <%=bbs.getTitle() %>
	         </a>
	         <%
	      }
	      %>
	</td>
	<td><%=bbs.getTarget_user_seq() %> </td>
	<td><%=bbs.getReg_date() %></td>
	</tr>	
	<%
	}
	%>
<tr>
	<td colspan="3">
	<button id="write"><a href="CommuBbsController?command=write">write</button></td>
</tr>
<tr>
</body>
</html>