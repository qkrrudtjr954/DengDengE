<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dto.AnimalBbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AnimalBbsdetail.jsp</title>
</head>
<body>
<%!
public String toDates(String mdate){
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분 ");	
	String s = mdate.substring(0, 4) + "-" 	// yyyy
			+ mdate.substring(4, 6) + "-"	// MM
			+ mdate.substring(6, 8) + " " 	// dd
			+ mdate.substring(8, 10) + ":"	// hh
			+ mdate.substring(10, 12); 
	System.out.println(s);
	Timestamp d = Timestamp.valueOf(s);
	return sdf.format(d);	
}
 
public String toOne(String msg){	
	return msg.charAt(0)=='0'?msg.charAt(1) + "": msg.trim();
}
%>

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
		
	}
%>

<h2 style="text-decoration: underline;">댕댕이의 아이들</h2>
<br><br><br><br><br>
<a href="AnimalBbsController?command=animlist">돌아가기</a>
<hr>

<form action="AnimalBbscontroller" method="post">
<h5 style="color: #00bfff"><%=aniBbsDto.getLocation() %>&nbsp;&nbsp;&nbsp;<%=aniBbsDto.getTitle() %></h5>
<%=aniBbsDto.getType() %>&nbsp;&nbsp;&nbsp;<%=aniBbsDto.getRdate() %>&nbsp;조회수:<%=aniBbsDto.getReadcount() %>
<table border="1" style="margin-left: auto; margin-right: auto;">
<col width="100"><col width="150"><col width="100"><col width="150">
<tr>
	<td>견/묘종</td>
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

<table style="margin-left: auto; margin-right: auto;" border="1">
<tr>
	<td>
		<%=aniBbsDto.getContent() %>
	</td>
</tr>

<tr align="right">
	<td>
		<a href="AnimalBbsController?command=update&seq=<%=aniBbsDto.getSeq() %>">수정</a>
		<a href="AnimalBbsController?command=delete&seq=<%=aniBbsDto.getSeq() %>">삭제</a>
	</td>
</tr>

<tr align="right">
	<td>
		
	</td>
</tr>
</table>
</form>

</body>
</html>