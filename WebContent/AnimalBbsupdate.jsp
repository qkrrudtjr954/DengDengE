<%@page import="dto.AnimalBbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
AnimalBbsDto aniBbsDto = (AnimalBbsDto)request.getAttribute("aniBbsDto");
System.out.println(aniBbsDto.toString());
%>
<%
// 숫자값 -> 문자
String m = null;
String n = null;
String g = null;
if(aniBbsDto != null){
		int  medi = aniBbsDto.getMedicine();
		int neu = aniBbsDto.getNeutralization();
		int gen = aniBbsDto.getGender();
		System.out.println("m"+medi);
		System.out.println("n"+neu);
		System.out.println("g"+gen);
		
		if(medi == 1){
			m = "YES";
			
		}else {
			m = "NO";
			
		}
		
		if(neu == 1){
			
			n = "YES";
			
		}else {
			
			n = "NO";
			
		}
		
		if(gen == 1){
			
			g = "YES";
		}else {
			
			g = "NO";
		}
		System.out.println("m"+m);
		System.out.println("n"+n);
		System.out.println("g"+g);
	}
%>

<h1>입양하기 글수정</h1>
<br><br><br><br>
<a href="AnimalController?command=animlist">list</a>
<hr>

<form action="AnimalBbsController">
<input type="hidden" name="command" value="updateAf">
<input type="hidden" name="seq" value="<%=aniBbsDto.getSeq() %>">
<table border="1" style="margin-left: auto; margin-right: auto;">
<col width="100"><col width="100"><col width="100"><col width="100">
<col width="100"><col width="150"><col width="100"><col width="150">
<col width="100"><col width="100">
<tr align="center">
	<td>이름</td>
	<td>
		<input type="text" name="name" size="20" value="<%=aniBbsDto.getName() %>" readonly="readonly">
	</td>
	<td>나이</td>
	<td>
		<input type="number" name="age" value="<%=aniBbsDto.getAge() %>" readonly="readonly">
	</td>
	<td>견종</td>
	<td>
		<input type="text" name="kinds" size="20" value="<%=aniBbsDto.getKinds() %>" readonly="readonly">
	</td>
	<td>분류</td>
	<td>
		<input type="text" name="type" size="20" value="<%=aniBbsDto.getType() %>" readonly="readonly">
	</td>
	
	<td>지역</td>
	<td>
		
		<input type="text" name="location" size="20" value="<%=aniBbsDto.getLocation() %>" readonly="readonly">
	</td> 
</tr>

<tr align="center">
	<td>예방접종</td>
	<td>
		<input type="text" name="medi" value="<%=m %>" readonly="readonly">
	</td>
	<td>중성화</td>
	<td>
		<input type="text" name="neu" value="<%=n %>" readonly="readonly">
	</td>
	<td>성별</td>
	<td>
		<input type="text" name="gen" value="<%=g %>" readonly="readonly">
	</td>
</tr>

<tr align="center">
	<td>제목</td>
	<td colspan="10">
		<input type="text" name="title" size="175" value="<%=aniBbsDto.getTitle() %>">
	</td>
</tr>

<tr align="center">
	<td>특이사항</td>
	<td colspan="10">
		<input type="text" name="descrip" size="175"  value="<%=aniBbsDto.getDescripttion() %>" readonly="readonly">
	</td>
</tr>

<tr align="center">
	<td>사진</td>
	<td colspan="10">
		파일명 : <%=aniBbsDto.getPic1() %> &nbsp;
		<input type="file" name="pic" style="width: 400px" >
	</td>
</tr>

<tr>
	<td>내용</td>
	<td colspan="10">
		<textarea rows="20" cols="180" name="content"><%=aniBbsDto.getContent() %></textarea>
	</td>
</tr>
<tr align="right">
	<td colspan="11">
		<input type="submit" value="수정하기">
	</td>

</tr>

</table>
</form>

</body>
</html>