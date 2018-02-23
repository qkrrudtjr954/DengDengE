<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>글쓰기</h1>
<div align="center">
<form action="CommuBbsController" method="post">
<input type="hidden" name="command" value="writeAf">
<table>
<col width="150"><col width="750">
<tr>
	<td><select name="category">
		<option value="0">선택하세요</option>
		<option value="1">애견Tip</option>
		<option value="2">중고장터</option>
		<option value="3">자유개시판</option>
	</select>
	</td>
	<td><input type="text" size="80" name="title" placeholder="제목을 입력해주세요"></td>
</tr>
<tr>
<td colspan="2">
<textarea name="content" id="summernote" name="content" value=""></textarea>
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


<script type="text/javascript">
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