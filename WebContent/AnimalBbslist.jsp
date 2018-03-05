<%@page import="dto.User"%>
<%@page import="dto.AnimalBbsDto"%>
<%@page import="java.util.List"%>
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
List<AnimalBbsDto> animallist = (List<AnimalBbsDto>)request.getAttribute("animlist");
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
			<div class="row" style="margin: 0 auto; width: 900px;">
					<h1 style="text-decoration: underline;" class="offset-md-4">분양 동물 보기</h1>
			</div>
			<div>
				<a href="AnimalBbsController?command=animlist"
					class="offset-md-11 btn btn-outline-secondary" style="background-color: #28A745; color: #fff">list</a>
			</div>
			<hr>
			<br>

			<form action="AnimalBbsController" method="post">
			<input type="hidden" name="command" value="btnsearch">

				<div class="row">
					<input type="submit" name="searchBtn" class="btn btn-success" style="background-color: #28A745; color: #fff"
					value="서울">
					&nbsp;&nbsp;&nbsp;
					<input type="submit" name="searchBtn" class="btn btn-success" style="background-color: #28A745; color: #fff"
					value="경기도">
					&nbsp;&nbsp;&nbsp;
					<input type="submit" name="searchBtn" class="btn btn-success" style="background-color: #28A745; color: #fff"
					value="강원도">
					&nbsp;&nbsp;&nbsp;
					<input type="submit" name="searchBtn" class="btn btn-success" style="background-color: #28A745; color: #fff"
					value="충청도">
					&nbsp;&nbsp;&nbsp;
					<input type="submit" name="searchBtn" class="btn btn-success" style="background-color: #28A745; color: #fff"
					value="경상도">
					&nbsp;&nbsp;&nbsp;
					<input type="submit" name="searchBtn" class="btn btn-success" style="background-color: #28A745; color: #fff"
					value="전라도">
				</div>
			</form>

			<br>
			<form action="AnimalBbsController" method="post">
			<input type="hidden" name="command" value="btnsearch">
				<div class="row">
					<input type="submit" name="searchBtn" class="btn btn-success" style="background-color: #28A745; color: #fff"
					value="유기동물">
					&nbsp;&nbsp;&nbsp;
					<input type="submit" name="searchBtn" class="btn btn-success" style="background-color: #28A745; color: #fff"
					value="개인분양">
					&nbsp;&nbsp;&nbsp;
					<input type="submit" name="searchBtn" class="btn btn-success" style="background-color: #28A745; color: #fff"
					value="etc">
				</div>
			</form>

			<br>
			<form action="AnimalBbsController" method="post" id="form">
				<input type="hidden" name="command" value="search">
				<div class="row" style="margin:0 auto;width:900px;">
					<div class="offset-md-2 input-group-prepend">
						<select class="custom-select" id="inputGroupSelect01"name="Searchtype" style="width: 150px">
							<option value="title">제목</option>
							<option value="target_user_seq">작성자</option>
						</select> 
						<input type="text" class="form-control"
							aria-label="Text input with segmented dropdown button" size="50"
							name="SearchWord" id="text">
					</div>

					<div class="serach">
						<input type="button" class="btn btn-success" id="btnsearch" style="background-color: #28A745; color: #fff"
							value="검색">
					</div>
				</div>
			</form>
			<br>
	
		<form action="AnimalBbsController" method="post">
		<input type="hidden" name="command" value="write">
			<div class="row">
				<c:forEach items="${animlist }" var="item" varStatus="i">
					<div class="col-md-4">
						<div class="card mb-4 box-shadow">
							<img class="card-img-top" src="${(empty item.pic1) ? './img/no-img.png' : item.pic1  }" alt="./img/no-img.png">
							<div class="card-body">
								<p class="card-text">
									<!-- 몇일 전, 몇시간전 방금전 등록 되었는지 표시하는 소스 -->
									<c:set var="reg" value="${item.reg_date}"/>
									<%
									String temp = (String)pageContext.getAttribute("reg");   //No exception.
									Calendar cal = Calendar.getInstance();

									int cur_day = cal.get(Calendar.DAY_OF_MONTH);
									int cur_hour = cal.get(Calendar.HOUR_OF_DAY);
									int cur_month = cal.get(Calendar.MONTH)+1;

									SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:ss:mm", Locale.KOREA);
									cal.setTime(format.parse(temp));

									int reg_day = cal.get(Calendar.DAY_OF_MONTH);
									int reg_hour = cal.get(Calendar.HOUR_OF_DAY);
									int reg_month = cal.get(Calendar.MONTH)+1;

									int range_month = cur_month - reg_month;
									int range_day = cur_day - reg_day;
									int range_hour = (cur_hour < reg_hour)?(cur_hour+24-reg_hour):(cur_hour-reg_hour);

									String result="";
									if(range_month < 1){
										if(range_day < 1){
											if(range_hour < 1){
												result = "방금 전";
											}else {
												result = range_hour+" 시간 전";
											}
										} else {
											result = range_day + " 일 전";
										}
									} else {
										result = range_month + " 달 전 ";
									}

									request.setAttribute("range", result);
									%>

									${item.title }
									<c:if test="${item.del==200 }"> 
									분양 완료 
									<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<a href="AnimalBbsController?command=detail&seq=${item.seq }" class="btn btn-sm btn-outline-secondary">View</a>
									</div>
									<small class="text-muted">${range }</small>								
								</div>
									</c:if>
									<c:if test="${item.del == 0 }">
									
									<br>
								<p>
									${item.name} <span style="font-size:12px;">( ${item.type } )</span>
								</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<a href="AnimalBbsController?command=detail&seq=${item.seq }" class="btn btn-sm btn-outline-secondary">View</a>
									</div>
									<small class="text-muted">${range }</small>								
								</div>
								</c:if>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

			<div class="row">
			<input type="submit" class="offset-md-11 btn btn-outline-secondary"
				style="width: 90px; background-color: #28A745; color: #fff" value="글쓰기">
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

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>


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
	$('#btnsearch').click(function () {
		var text = $("#text").val();
		
		if(text ===""){
			alert("검색할 내용을 입력해주십시오");
			$("#text").focus();	
		}else{
			$("#form").submit();
		}
	});
	
	
	</script>


</body>
</html>
