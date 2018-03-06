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
	<header>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand offset-md-2" href="MainControl?command=start">DengDengE</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav offset-md-7">
					<c:choose>
						<c:when test="${current_user == null }">
							<!-- 로그인 안했을 때 -->
							<li class="nav-item"><a class="nav-link"
								href="UserControl?command=goSignIn">로그인</a></li>
							<li class="nav-item"><a class="nav-link"
								href="UserControl?command=goSignUp">회원가입</a></li>
						</c:when>
						<c:otherwise>
							<!-- 로그인 했을 때 -->
							<li class="nav-item"><a class="nav-link"
								href="UserControl?command=signout">로그아웃</a></li>
							<li class="nav-item"><a class="nav-link"
								href="UserControl?command=myPage">마이 페이지</a></li>
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
			<p class="lead text-muted">Something short and leading about the
				collection below—its contents, the creator, etc. Make it short and
				sweet, but not too short so folks don't simply skip over it
				entirely.</p>
			<p>
				<a href="#" class="btn btn-success my-2">Main call to action</a>
			</p>
		</div>
	</section>


	<section>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<ul class="nav menu justify-content-center">
				<li class="nav-item menu-item"><a class="nav-link"
					href="AnimalBbsController?command=animlist">분양 동물 보기</a></li>
				<li class="nav-item menu-item"><a class="nav-link"
					href="AfterBbsController?command=AfterBbslist">분양 후기 보기</a></li>
				<li class="nav-item menu-item"><a class="nav-link"
					href="CommuBbsController?command=list">커뮤니티</a></li>
				<li class="nav-item menu-item"><a class="nav-link"
					href="FindPlaceController?command=findPlace">분양소 찾기</a></li>
			</ul>
		</nav>
	</section>

	<div class="album py-5 bg-light">
		<div class="container">
			<!--------- 본문페이지         -------->
			<div class="row">
				<div class="offset-md-1 col-md-10">
					<form name="form1" action="CommuBbsController">
						<input type="hidden" name="command" value="writeAf">
						<h1>글쓰기</h1>
						<hr>
						<div class="row">
							<div class="offset-md-1"></div>
							<div class="col-md-2" align="right">
								<select class="custom-select" id="category" name="category">
									<!-- <option value="0">선택하세요</option>
									<option value="1">애견Tip</option>
									<option value="2">중고장터</option>
									<option value="3">자유게시판</option>
									 -->
									<c:forEach items="${categories }" var="category" varStatus="i">
										<option value="${category.seq }">${category.title }</option>
									</c:forEach>
								</select>
							</div>

							<div class="col-md-8">
								<input type="text" class="form-control" name="title" id="title"
									placeholder="제목을 입력해주세요">
							</div>

							<div class="offset-md-1"></div>
						</div>
						<hr>
						<div class="row">
							<div class="offset-md-1"></div>
							<div class="col-md-10">
								<textarea name="content" id="summernote" name="content" ></textarea>
							</div>
							<div class="offset-md-1"></div>
						</div>
						<br>
						<div class="row">
							<input class="btn btn-success offset-md-4 col-md-2" type="submit"
								id="btnWrite" value="글쓰기"> &nbsp;
							<button type="button" id="btnBack"
								class="btn btn-outline-secondary col-md-2">돌아가기</button>
						</div>
					</form>


					<!-- ---------- -->
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
		$('.menu-item').on(
				'mouseover',
				function() {
					$(this).css('background', 'green').css('border',
							'1px solid green').css('border-radius', '15px');
					$(this).children('.nav-link').css('color', 'white');

				});
		$('.menu-item').on(
				'mouseout',
				function() {
					$(this).css('background', '').css('border',
							'1px solid white').css('border-radius', '5px');
					$(this).children('.nav-link').css('color', 'white');
				});
	</script>

	


	<script type="text/javascript">
	$(document).ready(function() {
				$('#summernote').summernote({
					height : 300, // set editor height
					minHeight : null, // set minimum height of editor
					maxHeight : null, // set maximum height of editor
					focus : true, // set focus to editable area after initializing summernote
					lang : 'ko-KR',
					callbacks : {onImageUpload : function(
									files, editor,welEditable) {
									sendFile(files[0], this);
									},
								},toolbar : [['style',['bold',
														'italic',
														'underline',
														'clear' ] ],
											['font',['strikethrough',
													'superscript',
														'subscript' ] ],
											[ 'fontsize',[ 'fontsize' ] ],
											[ 'color', [ 'color' ] ],
											['para',[ 'ul', 'ol','paragraph' ] ],
											[ 'height',[ 'height' ] ],
											[ 'insert',[ 'picture' ] ] ]
					});

		function sendFile(file, editor) {
		formdata = new FormData();
		formdata.append("userImage", file);

		$.ajax({
				data : formdata,
				type : "POST",
				url : '${initParam.IMG_SERVER_PATH}/upload',
				cache : false,
				contentType : false,
				processData : false,
				success : function(data) {
				console.log(data);
				var url = '${initParam.IMG_SERVER_PATH }/image/'+ data.filename;
					$('#hello').html(url);
					$('#summernote').summernote('editor.insertImage', url);
					$('#imageDiv > ul').append('<li><img src="'+url+'" width="480" height="auto"/></li>');
				}
		});
							}

		$("#btnBack").click(function() {
			location.href = "CommuBbsController?command=list";
			});
		$("#btnWrite").click(function () {
			var strT = document.getElementById('title');
			var strC = document.getElementById('summernote');
			var strS = document.getElementById('category');
			if( strT.value == '' || strT.value == null ){
			    alert( '제목을 입력해주세요.' );
			    $("#title").focus();
		        return false;
			}else if( strC.value == '' || strC.value == null ){
			    alert( '내용을 입력해주세요.' );
			    $("#summernote").focus();
			    return false;
			}
			if( strS.value == "0"){
			    alert( '게시판을 선택해주세요.' );
			    $("#category").focus();
			    return false;
			}
		});
	});
	</script>
<!-- function check(){

var str = document.getElementById('personName');

 

if( str.value == '' || str.value == null ){
    alert( '값을 입력해주세요' );
    return false;
}

var blank_pattern = /^\s+|\s+$/g;
if( str.value.replace( blank_pattern, '' ) == "" ){
    alert(' 공백만 입력되었습니다 ');
    return false;
}

 

//공백 금지
//var blank_pattern = /^\s+|\s+$/g;(/\s/g
var blank_pattern = /[\s]/g;
if( blank_pattern.test( str.value) == true){
    alert(' 공백은 사용할 수 없습니다. ');
    return false;
}


var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;

if( special_pattern.test(str.value) == true ){
    alert('특수문자는 사용할 수 없습니다.');
    return false;
}

alert( '최종 : ' + str.value );


} -->
</script>

</body>
</html>
