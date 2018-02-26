<%@page import="dto.CommuBbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>


</head>
<body>
<%
CommuBbsDto comdto = (CommuBbsDto)request.getAttribute("comdto");
%>

<h1>수정하기</h1>

<form action="CommuBbsController" method="post">
 <input type="hidden" name="command" value="updateAf">
 <input type="hidden" name="seq" value="<%=comdto.getSeq() %>">
<table border="3">
<col width="150"><col width="750">
<tr>
	<td><%=comdto.getCategory_name() %></td>
	<td><input type="text" name="title" size="50" value="<%=comdto.getTitle() %>"></td>
</tr>
<tr>
   <td colspan="2" align="right">작성자 &nbsp;&nbsp;&nbsp; <%=comdto.getReg_date() %>&nbsp;&nbsp;&nbsp; 조회수 : <%=comdto.getReadcount() %>&nbsp;</td>
</tr>
<tr>
<td colspan="2">
<textarea id="summernote" name="content" value=""><%=comdto.getContent() %></textarea>
</td>


</tr>
<tr>
<td colspan="2" align="right">
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