<%@page import="dto.AnimalBbsDto"%>
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
List<AnimalBbsDto> animlist = (List<AnimalBbsDto>)request.getAttribute("animlist");
for(int i=0;i<animlist.size();i++){
	System.out.println(animlist.get(i).toString());
}
%>
<h1>입양하기</h1>

<form action="AnimalBbsController">
<input type="hidden" name="command" value="write">
<table border="1" style="margin-left: auto; margin-right: auto;">
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
		<input type="text" name="kinds" value="댕댕이">
	</td>
	<td>
		<input type="text" name="kinds" value="냥냥이">
	</td>
	<td>
		<input type="text" name="kinds" value="etc">
	</td>
</tr>
<%
if(animlist == null || animlist.size() == 0){
	%>
		<tr>
			<td colspan="5">작성된 글이 없습니다</td>
		</tr>
	<%
}for(int i=0;i<animlist.size();i++){
	AnimalBbsDto aniBbsDto = animlist.get(i);
	%>
		<tr>	
			<td>
				<a href="AnimalBbsController?command=detail&seq<%=aniBbsDto.getSeq() %>">
					<img src="<%=aniBbsDto.getPic1() %>">
				</a>
			</td>
			<td><%=aniBbsDto.getTitle() %></td>
		</tr>
	<%
}
%>
<tr>
	<td colspan="5">
		<input type="submit" value="글쓰기">
	</td>
</tr>

</table>
</form>

</body>
</html>