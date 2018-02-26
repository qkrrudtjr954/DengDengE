<%@page import="dto.AfterBbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
  <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
  <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>

<title>Insert title here</title>
</head>
<body>

<%
AfterBbsDto bbs = (AfterBbsDto)request.getAttribute("bbs2");
%>






<h1>디테일</h1>

<form action="AfterBbsController" method="post">
 <input type="hidden" name="command" value="AfterBbsUpdateAf">
 <input type="hidden" name="seq" value="<%=bbs.getSeq() %>">
<table border="3">
<col width="150"><col width="750">
<tr>
   <td colspan="1"><input type="text" name="title" value="<%=bbs.getTitle() %>"></td>
</tr>
<tr>
   <td colspan="2" align="right">작성자 &nbsp;&nbsp;&nbsp; <%=bbs.getRdate() %>&nbsp;&nbsp;&nbsp;</td>
</tr>
<tr>
<%-- <td colspan="2" col height="550"><%=bbs1.getContent() %></td> --%>
<td colspan="2">
<textarea id="summernote" name="content" value=""><%=bbs.getContent() %></textarea>
</td>


</tr>
<tr>
<td colspan="1">
 <%--  <button><a href="AfterBbsController?command=AfterBbsUpdate&seq=<%=bbs.getSeq() %>"></a>수정하기</button> --%>
 <input type="submit" value="수정하기">
  </td>
</tr>


</table>
</form>


<script>
    $(document).ready(function() {
        $('#summernote').summernote({
            height: 300,                 // set editor height
            minHeight: null,             // set minimum height of editor
            maxHeight: null,             // set maximum height of editor
            focus: true                  // set focus to editable area after initializing summernote
    });
});

    
    $(document).ready(function() {
    	  $('#summernote').summernote();
    	});
    

  </script>


</body>
</html>