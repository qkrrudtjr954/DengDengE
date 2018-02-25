<%@page import="dto.CommuBbsDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<script>
   
   
$(document).ready(function () {
	 $("#btnAll").click(function () {
	        location.href="CommuBbsController?command=list";

	    });
	
    $("#btnCatg1").click(function () {
        $("form[name=form1]")
        .attr({action:"CommuBbsController?command=classify&target_category="+$(this).val(), method:"post"}).submit();

    });
    

    $("#btnCatg2").click(function () {
    	 $("form[name=form1]")
         .attr({action:"CommuBbsController?command=classify&target_category="+$(this).val(), method:"post"}).submit();
    });
    

    $("#btnCatg3").click(function () {
    	 $("form[name=form1]")
         .attr({action:"CommuBbsController?command=classify&target_category="+$(this).val(), method:"post"}).submit();
    });
   

});
   
 
</script>


</head>
<body>
	<%
List<CommuBbsDto> bbslist = (List<CommuBbsDto>)request.getAttribute("bbslist");
%>
	<h1>커뮤니티</h1>
	<form name="form1" action="CommuBbsController">
		<div align="left">
			&nbsp;&nbsp;
			<button type="button" id="btnAll">전체보기</button>
			&nbsp;&nbsp;
			<button type="button" id="btnCatg1" value="1">애견Tip</button>
			&nbsp;&nbsp;
			<button type="button" id="btnCatg2" value="2">중고장터</button>
			&nbsp;&nbsp;
			<button type="button" id="btnCatg3" value="3">자유게시판</button>
		</div>
	</form>
	<br>
	<br>
	<hr>
	<div align="center">

		<table border="1">
			<col width="150">
			<col width="70">
			<col width="500">
			<col width="150">

			<tr>
				<th>카테고리</th>
				<th>번호</th>
				<th align="center">제목</th>
				<th>작성자</th>
				<th>작성일</th>
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
					<%if(bbs.getDel()==1){ %> [작성자가 삭제한 글 입니다.] <%
      }
		 else{
	         %> <a
					href="CommuBbsController?command=read&seq=<%=bbs.getSeq() %>">
						<%=bbs.getTitle() %>
				</a> <%
	      }
	      %>
				</td>
				<td><%=bbs.getTarget_user_seq() %></td>
				<td><%=bbs.getReg_date() %></td>
			</tr>
			<%
	}
	%>
			<tr>
				<td colspan="5" align="right">
					<button id="write">
						<a href="CommuBbsController?command=write">write
					</button>
				</td>
			</tr>
			<tr>
<div id="board_search_div">
	<form name="searchform" method="get" action="CommuBbsController">
		<input type="hidden" name="command" value="search" />
		<table id="board_search_table">
		<tr>
			<td class="board_search_td">
			<select name="Searchtype">
			<option value="target_user_seq">글쓴이</option>
			<option value="A.title">제목</option>

			</select></td>
			<td class="board_search_td"><input type="text" name="SearchWord"></td>
			<td class="board_search_td">
			<input type="submit" value="검색">
			</td>
		</tr>
	</table>
	</form>
</div>


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