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
<h1>커뮤니티</h1>
<div  align="left">
&nbsp;&nbsp;
<button><a href="CommuBbsController?command=list">전체보기</a></button>&nbsp;&nbsp;
<button><a href="CommuBbsController?command=classify&target_category=1">애견Tip</a></button>&nbsp;&nbsp;
<button><a href="CommuBbsController?command=classify&target_category=2">중고장터</a></button>&nbsp;&nbsp;
<button><a href="CommuBbsController?command=classify&target_category=3">자유게시판</a></button>
</div>
<br><br><hr>
<div align="center">


<table border="1">
<col width="150"><col width="70"><col width="500"><col width="150">

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
	<td><%=bbs.getCategory_name() %></td>
	<td><%=i+1 %></td>
	<td>
		<%if(bbs.getDel()==1){ %>
         	[작성자가 삭제한 글 입니다.]	
      <%
      }
		 else{
	         %>
	         <a href="CommuBbsController?command=read&seq=<%=bbs.getSeq() %>">
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
	<td colspan="5" align="right">
	<button id="write"><a href="CommuBbsController?command=write">write</button></td>
</tr>
<tr>

<%-- 로그인 메시지 완료 되었을때 뜨는 메시지 --%>
<%
String msg = (String)request.getAttribute("msg");

if(msg!=null){
   %>
   <script type="text/javascript">
      alert("<%=msg%>");
   </script>
   <%
}
%>


</body>
</html>