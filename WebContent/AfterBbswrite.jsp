<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="icon" href="./icon/favicon.ico">

    <title>Deng Deng E list</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <!-- Custom styles for this template -->
    <link href="./css/main.css" rel="stylesheet">
    <%-- summernote --%>
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">



  </head>

  <body>
	<header>
		    <nav class="navbar navbar-expand-lg navbar-light bg-light">
				<a class="navbar-brand offset-md-2" href="#">DengDengE</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNavDropdown">
					<ul class="navbar-nav offset-md-7">
						<c:choose>
							<c:when test="${current_user == null }">
							<!-- 로그인 안했을 때 -->
							<li class="nav-item">
								<a class="nav-link" href="UserControl?command=goSignIn">로그인</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="UserControl?command=goSignUp">회원가입</a>
							</li>
						</c:when>
						<c:otherwise>
							<!-- 로그인 했을 때 -->
							<li class="nav-item">
								<a class="nav-link" href="UserControl?command=signout">로그아웃</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="UserControl?command=myPage">마이 페이지</a>
							</li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</nav>
   </header>
    <main role="main">

      <section class="jumbotron text-center">
        <div class="container">
          <h1 class="jumbotron-heading">Album example</h1>
          <p class="lead text-muted">Something short and leading about the collection below—its contents, the creator, etc. Make it short and sweet, but not too short so folks don't simply skip over it entirely.</p>
          <p>
            <a href="#" class="btn btn-success my-2">Main call to action</a>
          </p>
        </div>
      </section>
      <section>
	      <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	        <ul class="nav menu justify-content-center">
			 <li class="nav-item menu-item">
			    <a class="nav-link" href="AnimalBbsController?command=animlist">분양 동물 보기</a>
			  </li>
			  <li class="nav-item menu-item">
			    <a class="nav-link" href="AfterBbsController?command=AfterBbslist">입양 후기 보기</a>
			  </li>
			  <li class="nav-item menu-item">
			    <a class="nav-link" href="CommuBbsController?command=list">커뮤니티</a>
			  </li>
			  <li class="nav-item menu-item">
			  	<a class="nav-link" href="FindPlaceController?command=findPlace">분양소 찾기</a>
			  </li>
			</ul>
		</nav>
	</section>

      <div class="album py-5 bg-light">
        <div class="container">
        	<div class="row">

        	<div class="row">
        	<h1 >글쓰기</h1>
        	</div>
        </div>
        <form action="AfterBbsController" method="post" id="myform">
        <input type="hidden" name="command" value="AfterBbswriteAf">
     	<div class="row">
        	<div class="input-group-prepend " >
    			<span class="input-group-text" id="basic-addon1" style="width: 80px">글제목</span>
  			</div>
  		<input type="text" class="form-control" placeholder="제목을 입력해 주세요" aria-label="Username"
  		aria-describedby="basic-addon1" style="width: 1000px" name="title" id="title">
        </div>
        <%-- 글내용 --%>
        <div class="row">
        <textarea id="summernote" name="content" value=""  ></textarea>
        </div>
        <br>
        <div class="row">
        <input type="hidden" name="pic1" value="" id="pic1"/>
        <input type="button" class="btn btn-success offset-md-4 col-md-2"  value="글쓰기" onclick="" id="btnwrite">&nbsp;
        <input type="button" class="btn btn-outline-secondary col-md-2 " value="돌아가기" onclick="" id="btnBack">


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
        <p>Album example is &copy; Bootstrap, but please download and customize it for yourself!</p>
        <p>New to Bootstrap? <a href="../../">Visit the homepage</a> or read our <a href="../../getting-started/">getting started guide</a>.</p>
      </div>
    </footer>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


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
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
  	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>


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


	$("#btnwrite").click(function() {
		var title = $("#title").val();
		var content = $("#summernote").val();

		if (title === "") {
			alert("제목을 입력해주세요 ");
			$("#title").focus();
			return;
		} else if (content === "") {
			alert("내용을 입력해주세요 ");
			$("#summernote").focus();
			return;

		} else {
			$("#myform").submit();

		}
	});

	$("#btnBack").click(function() {
		location.href = "AfterBbsController?command=AfterBbslist";
		});

	</script>



  </body>
</html>
