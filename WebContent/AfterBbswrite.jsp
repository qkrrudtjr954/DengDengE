<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   
<title>Insert title here</title>


<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet"> 

</head>
<body>
<h1>글쓰기</h1>

<!-- <form action="NewFile.jsp" method="POST">
    <textarea id="summernote" name="editordata"></textarea>

  <input type="submit">

</form>
 -->
 <div align="center">
<form action="AfterBbsController" method="post">
<input type="hidden" name="command" value="AfterBbswriteAf">
<table>
<col width="150"><col width="750">
<tr>

   <td><input type="text" size="80" name="title" placeholder="제목을 입력해주세요" style="width: 500px;"></td>
</tr>
<tr>
<td colspan="2">
<textarea id="summernote" name="content" value=""></textarea>
</td>
</tr>
<tr>
<td colspan="2" align="right">
   <input type="submit" value="글쓰기">
</td>
</tr>

</table>
</form>
</div>
 <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
  <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>  
  <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>


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