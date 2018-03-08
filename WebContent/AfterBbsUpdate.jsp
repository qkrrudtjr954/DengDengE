<%@page import="dto.AfterBbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="icon" href="./icon/favicon.ico">

<title>Deng Deng E list</title>

<!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="./css/main.css" rel="stylesheet">
    


</head>

<body>
	<%@include file="./layout/header.jsp" %>
	<%@include file="./layout/jumbotron.jsp" %>

	<main role="main">

	<%@include file="./layout/menubar.jsp" %>

	<div class="album py-5 bg-light">
		<div class="container">

			<%
AfterBbsDto bbs = (AfterBbsDto)request.getAttribute("bbs2");
%>

			<form action="AfterBbsController" method="post">
				<input type="hidden" name="command" value="AfterBbsUpdateAf">
				<input type="hidden" name="seq" value="<%=bbs.getSeq() %>">
				<input type="hidden" name="pic1" value="" id="pic1">

				<div class="row">
						<h1>입양하기 글 수정</h1>
					</div>
					<hr>
				<div class="row">
					<span class="offset-md-8" style="font-size: small">작성자 :<%=bbs.getTarget_user_seq() %>&nbsp;&nbsp;작성날짜
						:<%=bbs.getReg_date() %>&nbsp;&nbsp; 조회수 : <%=bbs.getReadcond() %></span>
				</div>


				<div class="row">

					<div class="input-group-prepend ">
						<span class="input-group-text" id="basic-addon1"
							style="width: 80px">글제목</span>
					</div>
					<br>
					<input type="text" class="form-control" placeholder="제목을 입력해 주세요"
						aria-label="Username" aria-describedby="basic-addon1"
						style="width: 1020px" name="title" value="<%=bbs.getTitle()%>">
				</div>
				<br>




				<div class="row">
					<textarea id="summernote" name="content" value=""><%=bbs.getContent() %></textarea>
				</div>
				
				<br>
				<div class="row">
					<input type="submit" class="btn btn-success" value="수정하기">
				</div>






			</form>


		</div>
	</div>

	</main>

	<footer class="text-muted">
		<div class="container">
			<p class="float-right">
				<a href="#">Back to top</a>
			</p>
			<p>Album example is &copy; Bootstrap, but please download and
				customize it for yourself!</p>
			<p>
				New to Bootstrap? <a href="../../">Visit the homepage</a> or read
				our <a href="../../getting-started/">getting started guide</a>.
			</p>
		</div>
	</footer>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>
	

	<script type="text/javascript">
		$('.menu-item').on('mouseover', function () {
			$(this).css('background', 'green').css('border', '1px solid green').css('border-radius', '15px');
			$(this).children('.nav-link').css('color', 'white');

		});
		$('.menu-item').on('mouseout', function () {
			$(this).css('background', '').css('border', '1px solid white').css('border-radius', '5px');
			$(this).children('.nav-link').css('color', 'white');
		});
	</script>

	<%-- summernote --%>
	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
	<script
		src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>
	<%@include file="./layout/sendmaster.jsp" %>

	<script>
    $(document).ready(function() {

        $('#summernote').summernote({
	        	width : 1100,
	            height: 300,                 // set editor height
	            minHeight: null,             // set minimum height of editor
	            maxHeight: null,             // set maximum height of editor
	            focus: true,                  // set focus to editable area after initializing summernote
	            lang: 'ko-KR',
	    		callbacks: {
	    			onImageUpload: function(files, editor, welEditable) {
	    			      sendFile(files[0], this);
	    				},
	    		},
	    		toolbar: [
	    			['style', ['bold', 'italic', 'underline', 'clear']],
	    			['font', ['strikethrough', 'superscript', 'subscript']],
	    			['fontsize', ['fontsize']],
	    			['color', ['color']],['para', ['ul', 'ol', 'paragraph']],
	    			['height', ['height']],
	    			['insert', ['picture']]
	    		] 
	            
	            
	    	});

		sendMasterTableSet();

	});
    

    
    function sendFile(file, editor) {
    	formdata = new FormData();
    	formdata.append("userImage", file);

    	$.ajax({
    		data: formdata,
    		type: "POST",
    		url: '${initParam.IMG_SERVER_PATH}/upload',
    		cache: false,
    		contentType: false,
    		processData: false,
    		success: function(data) {
    			console.log(data);
    			var url = '${initParam.IMG_SERVER_PATH }/image/'+data.filename;

    			if($('#pic1').val() == ''){
    				$('#pic1').val(url);
    			}

    			alert(url);
    			$('#hello').html(url);
    			$(editor).summernote('editor.insertImage', url);
    			$('#imageDiv > ul').append('<li><img src="'+url+'" width="480" height="auto"/></li>');
            }
    	});
    }
    
    








  </script>


</body>
</html>
