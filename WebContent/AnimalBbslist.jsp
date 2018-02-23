<%@page import="dto.AnimalBbsDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AnimalBbslist.jsp</title>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
</head>
<body>
 
<%
List<AnimalBbsDto> animlist = (List<AnimalBbsDto>)request.getAttribute("animlist");
for(int i=0;i<animlist.size(); i++){
	System.out.println(animlist.get(i).toString());
}
%>
 
 

 
<%-- <%
String msg = (String)request.getAttribute("msg");
%>
<%
if(msg != null){
	%>
		<script type="text/javascript">
			alert("<%=msg %>");
		</script>
	<%
}
%> --%>

<h1>입양하기</h1>
<br><br><br><br><br>
<hr>

<form action="AnimalBbsController">
<table style="margin-left: auto; margin-right: auto;">
<col width="150"><col width="150"><col width="150"><col width="150"><col width="150">
<tr>
	<td>
		<input type="submit" name="area" value="수도권" style="background-color: ">
	</td>
	<td>
		<input type="submit" name="area" value="강원도">
	</td>
	<td>
		<input type="submit" name="area" value="충청도">
	</td>
	<td>
		<input type="submit" name="area" value="경상도">
	</td>
	<td>
		<input type="submit" name="area" value="전라도">
	</td>
</tr>

<tr>
	<td>
		<input type="submit" name="kinds" value="댕댕이">
	</td>
	<td>
		<input type="submit" name="kinds" value="냥냥이">
	</td>
	<td colspan="3">
		<input type="submit" name="kinds" value="etc">
	</td>
</tr>
<%
if(animlist == null || animlist.size() == 0){
	%>
		<tr>
			<td colspan="5" align="center">작성된 글이 없습니다</td>
		</tr>
	<%
}for(int i=0;i<animlist.size();i++){
	AnimalBbsDto aniBbsDto = animlist.get(i);
	%>
		<tr>	
			<td>
				<a href="AnimalBbsController?command=detail&seq<%=aniBbsDto.getSeq() %>">
					<img src="<%=aniBbsDto.getPic1() %>"><br>					
					<%=aniBbsDto.getTitle() %>
				</a>
			</td>
		</tr>
	<%
}
%>
<tr>
	<td colspan="5" align="right">
		<input type="hidden" name="command" value="write">
		<input type="submit" value="글쓰기">
	</td>
</tr>

</table>
</form>

</body>
</html>