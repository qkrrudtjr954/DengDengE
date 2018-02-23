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


<table>

<tr>
<td>제목</td>

</tr>




<tr>
<td>

<h2>이미지가 없습니다</h2>


</td>

</tr>

<tr>
 <td>
	<textarea></textarea> 
 
 
 </td>

</tr>





</table>





</body>
</html>