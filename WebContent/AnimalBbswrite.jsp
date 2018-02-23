<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AnimalBbswrite.jsp</title>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
</head>
<body>
<h1>입양하기 글작성</h1>
<br><br><br><br><br>
<hr>

<form action="AnimalBbsController">
<input type="hidden" name="command" value="writeAf">
<table border="1" style="margin-left: auto; margin-right: auto;">
<col width="50"><col width="100"><col width="150"><col width="150"><col width="150">

<tr>
	<td>이름</td>
	<td>
		<input type="text" name="name" size="20">
	</td>
	<td>나이</td>
	<td>
		<input type="number">
	</td>
	<td>견종</td>
	<td>
		<input type="text" name="kinds" size="20">
	</td>
	<td>분류</td>
	<td>
		<select>
			<option value="유기견">유기견</option>
			<option value="개인분양">개인 분양</option>
			<option value="etc">etc</option>
		</select>
	</td>
	
	<td>파일업로드</td>
	<td>
		<input type="file" name="fileload" style="width: 400px">
	</td>
</tr>


</table>
</form>

</body>
</html>