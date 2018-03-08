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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

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

			<div class="row">
				<div>
					<iframe width="560" height="315"
						src="https://www.youtube.com/embed/dHmyY0iX0ww?rel=0&amp;controls=0&amp;showinfo=0&autoplay=1"></iframe>
				</div>
			</div>

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
	
	<c:if test="${current_user != null }">

		<button type="button" id="adminQuestion" data-toggle="modal"
			data-target="#exampleModal">
			<img alt="circle" src="./img/contact-us.png" width="110px">
		</button>


		<!-- 모달 부분 -->

		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">관리자에게 메세지 보내기</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<form action="MainControl" method="post" id="myForm">
						<input type="hidden" name="command" value="sendMsg">
						<div class="modal-body">

							<ul class="list-group list-group-flush">
								<li class="list-group-item">문의종류<br> <select
									class="custom-select" width="20" name="Qtype">
										<option value="1">분양 하기</option>
										<option value="2">입양 하기</option>
										<option value="3">회원정보 문의</option>
										<option value="4">제휴 문의</option>
										<option value="5">기타 문의</option>
								</select></li>
								<li class="list-group-item">문의 제목 <br> 
									<input class="form-control mr-sm-2" type="text" name="title" placeholder="문의 제목을 입력하세요">
								</li>
								<li class="list-group-item">연락처(이메일)<br> 
									<input class="form-control mr-sm-2" type="text" name="email" placeholder="빈칸일 시 회원정보 상 이메일로 답변이 갑니다">
								</li>
								<li class="list-group-item">문의 내용 <br> 
									<textarea class="form-control" rows="3" name="content"></textarea>
								</li>
							</ul>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
							<input type="button" onclick="submitMyForm()" class="btn btn-success" value="문의하기">
						</div>
					</form>
				</div>
			</div>
		</div>

		

		<!-- 모달 끝 -->
	</c:if>
	
		

	

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
    
	<%@include file="./layout/sendmaster.jsp" %>

	<script type="text/javascript">
		$(document).ready(function () {
			sendMasterTableSet();
		})
	
		$('.menu-item').on('mouseover', function () {
			$(this).css('background', 'green').css('border', '1px solid green').css('border-radius', '15px');
			$(this).children('.nav-link').css('color', 'white');

		});
		$('.menu-item').on('mouseout', function () {
			$(this).css('background', '').css('border', '1px solid white').css('border-radius', '5px');
			$(this).children('.nav-link').css('color', 'white');
		});
		
		function submitMyForm() {
			var FormData = $('#myForm').serialize();
			
			$.ajax({
				url : 'MainControl',
				data : FormData,
				method : 'GET',
				success : function (data) {
					if(data == "success"){
						alert('메세지를 전송했습니다.');
					} else {
						alert('메세지 전송에 실패했습니다.');
					}
					
					$('button[data-dismiss="modal"]').click();
				}
			})
		}
		
		
	</script>
</body>
</html>
