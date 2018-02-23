<%@page import="dto.AfterBbsDto"%>
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

<h1 align="center">댕댕이 반려 동물 입양후기</h1>
<h3 align="center">회원님들의 생생한 입양 후기들</h3>


 <%
List<AfterBbsDto> afterBbslist = (List<AfterBbsDto>)request.getAttribute("afterBbslist");
 
 for(int i=0;i<afterBbslist.size();i++){
		System.out.println(afterBbslist.get(i).toString());
	}
 
 %>


 
<!--  검색부분
 <table border="2" style="margin-left: auto; margin-right: auto;">
 <tr>
 <td colspan="1">	
<select name="search" style="width:70px;height: 25px" id="search">
	<option value="an1">강아지</option>
	<option value="an2">고양이</option>
	<option value="an3">기타</option>
</select>
<select name="search1" style="width: 70px;height: 30px id=search">
	<option value="id">작성자</option>
	<option value="title">제목</option>
</select>
<input type="text" name="text" size="30" style="height: 25px" id="text">
<button type="button" id="searchbutton" class="btn">검색</button>
<button type="button" id="searchreset" class="btn">목록</button>
</td>
</tr>
</table>

 -->
 


<%-- <%
// 페이징 처리 정보
PagingBean paging = new PagingBean();
//처음들어왔을때 nowPage == null
if(request.getParameter("nowPage") == null){
	//처음들어왔을때 nowPage 현재페이지를 1페이지로 세팅해준다.
	paging.setNowPage(1);
//페이지수를 클릭해서 들어온 경우
}else{
	//넘겨받은 nowPage를 int로 변환시켜 paging 객체에 넣어준다.
	paging.setNowPage(Integer.parseInt(request.getParameter("nowPage")));
} 
%>
 --%>
 
 
 <table border="1" align="center">
<col width="70"><col width="500"><col width="150"><col width="100">

<tr>
<th>번호</th><th>종류</th><th>제목</th><th>작성자</th>
</tr>

<%
if(afterBbslist == null || afterBbslist.size() == 0){
	%>
	<tr>
		<td colspan="4">작성된 글이 없습니다</td>
	</tr>	
	<%
}

for(int i = 0;i < afterBbslist.size(); i++){
	AfterBbsDto bbs = afterBbslist.get(i);
	%>
	<tr>
	<td><%=i+1 %></td>
	<td>
		<%-- <%=arrow(bbs.getDepth()) %> --%>
		<%if(bbs.getDel()==1){ %>
		<b>관리자에의해 삭제된 글입니다.</b>
		<%}else{ %>
		<a href="AfterBbsController?command=detail&seq=<%=bbs.getSeq() %>">
			<%=bbs.getTitle() %>
		</a>
		<%} %>
	</td>
	<%-- <td><%=bbs.getId() %> </td> --%>
	</tr>	
	<%
}
%>


 </table>
 
<div align="center">
<form action="AfterBbsController">
		<input type="hidden" name="command" value="bbswrite">
		<input type="submit" value="글쓰기">
</form>
</div>
 
 
 
 

</body>
</html>