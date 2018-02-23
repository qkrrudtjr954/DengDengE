<%@page import="dto.AnimalBbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AnimalBbsdetail.jsp</title>
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

<h2 style="text-decoration: underline;">댕댕이의 아이들</h2>
<br><br><br><br><br>
<hr>

<form action="AnimalBbscontroller" method="post">
<input type="hidden" name="command" value="update">
<h5 style="color: #00bfff"><%=aniBbsDto.getLocation() %>&nbsp;&nbsp;&nbsp;<%=aniBbsDto.getTitle() %></h5>
<%=aniBbsDto.getType() %>&nbsp;&nbsp;&nbsp;<%=aniBbsDto.getRdate() %>
<table border="1" style="margin-left: auto; margin-right: auto;">
<col width="100"><col width="150"><col width="100"><col width="150">
<tr>
	<td>견/모종</td>
	<td>
		<%=aniBbsDto.getKinds() %>
	</td>
	<td>나이</td>
	
		<td>
			<%=aniBbsDto.getAge() %>
		</td>	
</tr>

<tr>
	<td>접종유무</td>
	<td>
		<%=m %>
	</td>
	<td>중성화유무</td>
	<td>
		<%=n %>
	</td>
</tr>

<tr>
	<td>성별</td>
	<td>
		<%=g %>
	</td>
	<td>특이사항</td>
	<td>
		<%=aniBbsDto.getDescripttion() %>
	</td>
</tr>

</table>
<br>
<table style="margin-left: auto; margin-right: auto;">
<tr>
	<td>
		<textarea rows="50" cols="70" readonly="readonly"><%=aniBbsDto.getContent() %></textarea>
	</td>
</tr>
</table>
</form>

</body>
</html>