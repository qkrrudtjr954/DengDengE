<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="./icon/favicon.ico">

<title>Deng Deng E login</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<!-- Custom styles for this template -->
<link href="./css/signin.css" rel="stylesheet">
</head>

<body class="text-center">
	<form class="form-signin">
		<input type="hidden" value="signin" name="command">

		<a href="MainControl?command=start">
			<img class="mb-4" src="./img/main.png" alt="" width="150" height="150">
			<img class="mb-4" src="./img/slogo.png" alt="" width="170" height="55">
		</a>

		

		<label for="inputEmail" class="sr-only">Email</label>
		<input type="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>

		<label for="inputPassword" class="sr-only">Password</label>
		<input type="password" id="inputPassword" class="form-control" placeholder="Password" required>

		<div class="checkbox mb-3">
			<label>
				<input type="checkbox" value="remember-me">아이디 기억하기
			</label>
		</div>

		<input class="btn btn-lg btn-success btn-block" type="button" value="로그인">
		<br>
		<a href="UserControl?command=goSignUp">댕댕이가 처음이십니까?</a>
		<br> 
		<a href="MainControl?command=start">메인화면으로 가기</a> 
		<p class="mt-5 mb-3 text-muted">&copy; 2017-2018 &nbsp;&nbsp; DengDengE</p>
		
		
		
	</form>


	<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
	<!-- javascript cookie -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js" type="text/javascript" ></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script type="text/javascript">
	// session
	$('input[type="checkbox"]').on('click', function () {

		if($(this).is(':checked')){
			// insert into session
			if($('#inputEmail').val() == ''){
				$('input[type="checkbox"]').prop('checked', false);
				$('#inputEmail').focus();
			}else{
				alert('session!')
				$.cookie('user_id', $('#inputEmail').val(), {expires: 7, path: '/'});
			}
		}else{
			// delete from session
			alert("delete!");
			$.removeCookie("user_id", {path: '/'});
		}
	});

	$('input[type="button"]').on('click', function () {
		// make validate function
		$.ajax({
			url : 'UserControl',
			method : 'POST',
			data : { command : 'signin', email : $('#inputEmail').val(), password : $('#inputPassword').val() },
			success : function (data) {
				var user = JSON.parse(data);

				if(user.seq==0){
					alert('아이디와 비밀번호를 확인해주십시오.');
				} else {
					location.href = "${(returnurl==null) ? 'MainControl?command=start' : returnurl}";
				}
			}
		})
	});

	$(document).ready(function () {
		var user_id = $.cookie("user_id");

		if(user_id != null){
			$('#inputEmail').val(user_id);
			$('input[type="checkbox"]').attr('checked', 'checked');
		}
	});

	</script>
	
</body>
</html>
