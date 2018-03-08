<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="./icon/favicon.ico">

<title>Deng Deng E signup</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<!-- Custom styles for this template -->
<link href="./css/signup.css" rel="stylesheet">
</head>

<body class="bg-light">

	<div class="container">
		<div class="py-5 text-center">
			<img class="d-block mx-auto mb-4" src="./img/animal (1).png" alt="" width="72" height="72">
			<h2>내정보 수정</h2>
			${notice }
		</div>

		<div class="row">
			<div class="offset-md-3 col-md-6 order-md-1">
				<form class="needs-validation" id="signUpForm" action="UserControl" method="POST" novalidate>
					<input type="hidden" name="command" value="myPageAf">
					<div class="mb-3">
						<label for="email">Email</label> 
							<span><input type="email" class="form-control success" name="email" id="email" value="${current_user.email }" readonly="readonly"></span>
						<div class="invalid-feedback">이메일을 입력해주세요.</div>
						<div class="invalid-email"></div>

					</div>
					
					<div class="mb-3">
						<label for="password">Current Password</label> 
						<input type="password" class="form-control" name="curpassword" id="curpassword" required>
						<div class="invalid-feedback">현재비밀번호를 입력해주세요.</div>
						<button type="button" class=" offset-md-8 btn btn-secondary" id="updateuser" onclick="">pwd확인</button>
						
					</div>
					
					

					 <div class="mb-3">
						<label for="password">Password</label> 
						<input type="password" class="form-control" name="password1" id="password1" required readonly="readonly">
						<div class="invalid-feedback">수정할 비밀번호를 입력해주세요.</div>
					</div>

					<div class="mb-3">
						<label for="password">Password <span style="font-size: 12px;">(Confirm)</span></label> 
						<input type="password" class="form-control" name="password2" id="password2" required readonly="readonly">
						<div class="invalid-feedback">비밀번호를 확인해주세요.</div>
						<div class="invalid-password"></div>
					</div>

					<hr class="mb-4">
					
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="same-address"> 
						<label class="custom-control-label" for="same-address">
							Shipping address is the same as my billing address
						</label>
					</div>
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="save-info">
						<label class="custom-control-label" for="save-info">
							Save this information for next time
						</label>
					</div>
					
					<hr class="mb-4">
				
					
					<!-- <button class="btn btn-success btn-lg btn-block" type="submit">내정보 수정하기</button> -->
					<input type="submit" value="정보수정" id="submit" style="visibility: hidden;" class="btn btn-success btn-lg btn-block" >
				</form>
			</div>
		</div>

		<footer class="text-muted text-center text-small">
			<p class="mb-1">&copy; 2017-2018 DengDengE</p>
			<ul class="list-inline">
				<li class="list-inline-item">
					<a href="#">Privacy</a>
				</li>
				<li class="list-inline-item">
					<a href="#">Terms</a>
				</li>
				<li class="list-inline-item">
					<a href="#">Support</a>
				</li>
			</ul>
		</footer>
	</div>


	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script src="https://getbootstrap.com/assets/js/vendor/holder.min.js"></script>
	<script>
      // Example starter JavaScript for disabling form submissions if there are invalid fields
      (function() {
        'use strict';

        window.addEventListener('load', function() {
          // Fetch all the forms we want to apply custom Bootstrap validation styles to
          var forms = document.getElementsByClassName('needs-validation');

          // Loop over them and prevent submission
          var validation = Array.prototype.filter.call(forms, function(form) {
            form.addEventListener('submit', function(event) {
              if (form.checkValidity() === false || !$('#email').hasClass('success') || !$('#password2').hasClass('success')) {
                event.preventDefault();
                event.stopPropagation();
              }else{
            	  	console.log('hello');
            	  	/* var datastring = $("#signUpForm").serialize();
          		$.ajax({
          			url : 'UserControl',
          			data : datastring,
          			type : 'POST',
          			success : function (data) {
          				var result = JSON.parse(data);
          				if(data.statusCode == 200){
          					alert('회원 가입에 성공했습니다.');
							location.href = "MainControll?command=start";          					
          				} else {
          					// reload
          					alert('회원 가입에 실패했습니다.');
          					location.href = "UserControll?command=goSignUp";
          				}
					}
          		}); */
              }
              form.classList.add('was-validated');
            }, false);
          });
        }, false);
      })();
      
      
	
	$(document).ready(function () {
		/* $('#email').keyup(function () {
			$.ajax({
  				url : 'UserControl',
  				data : { command:'checkEmail', email: $('#email').val() },
  				type : 'POST',
  				success : function (data) {
  					if(data == 'no'){
  						$('#email').attr('style', 'border-color:#dc3545;');
  						$('#email').removeClass('success');
  						$('.invalid-email').html('<span style="font-color:#dc3545;">이미 사용중인 이메일 입니다.</span>');
  					}else{
  						$('#email').attr('style', 'border-color:#28a745;');
  						$('#email').addClass('success');
  						$('.invalid-email').html('<span style="font-color:#28a745;">사용가능한 이메일 입니다.</span>');
  					}
  				}
			})
		}); */
    	  
		$('#password2').keyup(function () {
			if(this.value != $('#password1').val()){
				$(this).attr('style', 'border-color:#dc3545;');
				$(this).removeClass('success');
				$('.invalid-password').html('<span style="font-size:80%;color:#dc3545;">비밀번호가 일치하지 않습니다..</span>');
					
			}else{
				$(this).attr('style', 'border-color:#28a745;');
				$(this).addClass('success');
				$('.invalid-password').html('<span style="font-size:80%;color:#28a745;">비밀번호가 일치합니다.</span>');
			}	
		});
		
		
		
		
		$("#updateuser").click(function() {
			var pwd ="${current_user.password }"; 
			//alert(pwd);
			if($("#curpassword").val() == pwd ){
				alert("수정가능");
				$("#password1").removeAttr("readonly");
				$("#password2").removeAttr("readonly");
				$("#submit").removeAttr("readonly");
			    document.getElementById("submit").style.visibility='visible';
				
				
				
			}
			else{
				alert("비밀번호를 다시 입력하십시요");
				$("#curpassword").val("");
			}
			
		});
		
		
		
		
		
	});
    </script>
</body>
</html>
