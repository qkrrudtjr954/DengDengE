<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="icon" href="./icon/favicon.ico">


<%
String msg = (String)request.getAttribute("msg");
%>
<%
if(msg != null){
	%>
		<script type="text/javascript">
			alert("<%=msg %>");
		</script>
	<%
}
%>

<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Custom styles for this template -->
<link href="./css/main.css" rel="stylesheet">
</head>

<body>
	<header>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand offset-md-1" href="#">DengDengE</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav offset-md-9">
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
				<a href="AnimalBbsController?command=animlist" class="btn btn-success my-2">분양 동물 보러가기</a>
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
			    <a class="nav-link" href="AfterBbsController?command=AfterBbslist">분양 후기 보기</a>
			  </li>
			  <li class="nav-item menu-item">
			    <a class="nav-link" href="CommuBbsController?command=list">커뮤니티</a>
			  </li>
			  <li class="nav-item menu-item">
			    <a class="nav-link" href="#">분양소 찾기</a>
			  </li>
			</ul>
		</nav>
	</section>


	<div class="album py-5 bg-light">
		<div class="container">
			<div class="row">
				<div class="list-title offset-md-4 col-md-4 offset-sm-1 col-sm-10">
					<h1>분양 동물 보기</h1>
				</div>
			</div>
			<div class="row">
				<c:forEach items="${animlist }" var="item" varStatus="i">
					<div class="col-md-4">
						<div class="card mb-4 box-shadow">
							<img class="card-img-top" src="${(empty item.pic1) ? './img/no-img.png' : item.pic1  }" alt="./img/no-img.png">
							<div class="card-body">
								<p class="card-text">
									${item.title }
									<br>
								<p>
									${item.name} <span style="font-size:12px;">( ${item.type } )</span>
								</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<a href="AnimalBbsController?command=detail&seq=${item.seq }" class="btn btn-sm btn-outline-secondary">View</a>
									</div>

									<!-- 몇일 전, 몇시간전 방금전 등록 되었는지 표시하는 소스 -->
									<fmt:formatDate var="temp1" value="${item.reg_date.replace('.0', '')}" pattern="yyyy-MM-dd hh:mm:ss" />
							      	<fmt:parseDate var="reg_date"  value="${temp1}" pattern="yyyy-MM-dd hh:mm:ss"/>

							      	<jsp:useBean id="now" class="java.util.Date" />
									<fmt:formatDate var="temp2" value="${now}" pattern="yyyy-MM-dd hh:mm:ss" />
									<fmt:parseDate var="current_date"  value="${temp2}" pattern="yyyy-MM-dd hh:mm:ss"/>

									<c:set var="range_day" value="${current_date.day - reg_date.day }"/>
									<c:set var="range_hour" value="${current_date.hours - reg_date.hours }"/>
									<c:choose>
										<c:when test="${range_day == 0 }">
											<c:choose>
												<c:when test="${range_hour==0 }">
													<small class="text-muted">방금 전</small>
												</c:when>
												<c:otherwise>
													<small class="text-muted">${ range_hour } 시간 전</small>
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<small class="text-muted">${ range_day } 일 전</small>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
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

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>


	a<script type="text/javascript">
		function setDate() {
			var regs = new Array();

			for(var i=0; i < ${animlist.size()}; i++){
				regs.push('${animlist.get(i).reg_date}');
			}


			var reg = new Date();
			var current = new Date();
			var rangeDay = 0;
			var rangeHour = 0;


			for(var j=0; j<regs.length; j++){
				reg = new Date(regs[i]);
				rangeDay = current.getDay() - reg.getDay();
				rangeHour = (current.getHours() < reg.getHours()) ? ((current.getHours()+24) - reg.getHours()) : (current.getHours() - reg.getHours());

				// 오늘 올린 게시물
				if(rangeDay < 1){
					if(rangeHour < 1){
						// 방금 올린게시물
						$('#range${animlist.get(j).seq}').html('방금 전');
					} else {
						// 몇 시간 전에 올린 게시물
						$('#range${animlist.get(j).seq}').html(rangeHour + '시간 전');
					}
				} else {
					//	몇 일 전에 올린 게시물
					$('#range${animlist.get(j).seq}').html(rangeHour + '일 전');
				}
			}
		}

		$('.menu-item').on(
				'mouseover',
				function() {
					$(this).css('background', 'green').css('border',
							'1px solid green').css('border-radius', '15px');
					$(this).children('.nav-link').css('color', 'white');

<<<<<<< HEAD




=======
				});
		$('.menu-item').on(
				'mouseout',
				function() {
					$(this).css('background', '').css('border',
							'1px solid white').css('border-radius', '5px');
					$(this).children('.nav-link').css('color', 'white');
				});

	</script>
>>>>>>> kyung
</body>
</html>
