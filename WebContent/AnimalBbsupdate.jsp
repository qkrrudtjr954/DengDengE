<%@page import="dto.AnimalBbsDto"%>
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
	<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="./css/main.css" rel="stylesheet">
    
  </head>

  <body>
  <%
AnimalBbsDto aniBbsDto = (AnimalBbsDto)request.getAttribute("aniBbsDto");
System.out.println(aniBbsDto.toString());
%>
<%
// 숫자값 -> 문자
String m = null;
String n = null;
String g = null;
if(aniBbsDto != null){
		int  medi = aniBbsDto.getMedicine();
		int neu = aniBbsDto.getNeutralization();
		int gen = aniBbsDto.getGender();
		if(medi == 1){
			m = "YES";
			
		}else {
			m = "NO";
			
		}
		
		if(neu == 1){
			
			n = "YES";
			
		}else {
			
			n = "NO";
			
		}
		
		if(gen == 1){
			
			g = "여아";
		}else {
			
			g = "남아";
		}
	}
%>
  
	<header>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand offset-md-2" href="#">DengDengE</a>
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
			<h1 class="jumbotron-heading">믿고 맡기는 분양센터</h1>
			<p class="lead text-muted">새로운 가족을 찾는 아이들과 
			갈 곳이 없어진 불쌍한 아이들을 <br> 당신의 곁으로 데려가 주세요</p>
			<p>
				<a href="AnimalBbsController?command=animlist" class="btn btn-success my-2">분양 동물 보러가기</a>
			</p>
		</div>
	</section>
	<%@include file="./layout/menubar.jsp" %>
      

	<form action="AnimalBbsController" method="post">
		<input type="hidden" name="command" value="updateAf">
		<input type="hidden" name="seq" value="<%=aniBbsDto.getSeq() %>">
	

		<div class="album py-5 bg-light">
			<div class="container">
				<div class="form1">
				
					<div class="row">
						<h1>입양하기 글 수정</h1>
					</div>
					
					<div class="row">
						<span style="font-size: small" >
							*제목과 내용이 수정가능합니다.
						</span>
						<div class="offset-md-10 col-md-2">							
								<button type="button" id="btnBack" class="offset-md-12 btn btn-outline-secondary">돌아가기</button>						
							</div>
					</div>
					
					<hr>

					<div class="row">
						<div class="input-group-prepend">
							<span class="input-group-text" id="">이름</span> 
							<input type="text" class="form-control" size="20" name="name" placeholder="이름"
							value="<%=aniBbsDto.getName() %>" readonly="readonly" style="background-color: #fff">
						</div>

						&nbsp;&nbsp;&nbsp;
						<div class="input-group-prepend">
							<span class="input-group-text" id="">나이</span> 
							<input type="number" class="form-control" size="20" name="age" placeholder="나이"
							value="<%=aniBbsDto.getAge() %>" readonly="readonly" style="background-color: #fff">
						</div>

						&nbsp;&nbsp;&nbsp;
						<div class="input-group-prepend">
							<span class="input-group-text">묘/견종</span> 
							<input type="text"	class="form-control" size="20" name="kinds" placeholder="묘/견종"
							value="<%=aniBbsDto.getKinds() %>" readonly="readonly" style="background-color: #fff">
						</div>

						&nbsp;&nbsp;&nbsp;
						<div class="input-group-prepend">
							<span class="input-group-text">분류</span> 
						<input type="text"	class="form-control" size="20" name="type" 
							value="<%=aniBbsDto.getType() %>" readonly="readonly" style="background-color: #fff">
						</div>
					</div>
					<br>

					<div class="row">
						<div class="input-group-prepend">
							<span class="input-group-text">주소</span> 
						<input type="text"	class="form-control" size="25" name="location" 
							value="<%=aniBbsDto.getLocation() %>" readonly="readonly" style="background-color: #fff">
						</div>
						&nbsp;&nbsp;&nbsp;
						<div class="input-group-prepend">
							<span class="input-group-text">접종여부</span> 
						<input type="text"	class="form-control" size="17" name="medi" 
							value="<%=m %>" readonly="readonly" style="background-color: #fff">
						</div>
						&nbsp;&nbsp;&nbsp;
						<div class="input-group-prepend">
							<span class="input-group-text">중성화</span> 
						<input type="text"	class="form-control" size="17" name="neu" 
							value="<%=n %>" readonly="readonly" style="background-color: #fff">
						</div>
						&nbsp;&nbsp;&nbsp;
						<div class="input-group-prepend">
							<span class="input-group-text">성별</span> 
						<input type="text"	class="form-control" size="17" name="gen" 
							value="<%=g %>" readonly="readonly" style="background-color: #fff">
						</div>
					</div>
						
					<br>
					<div class="row">
						<div class="input-group-prepend">
							<span class="input-group-text" id="">제목</span> 
							<input type="text"	class="form-control" name="title" size="136.8" placeholder="제목 입력"
							value="<%=aniBbsDto.getTitle() %>">
						</div>
					</div>

					<br>
					<div class="row">
						<div class="input-group-prepend">
							<span class="input-group-text" id="">특이사항</span> 
							<input type="text" class="form-control" name="descrip" size="132" placeholder="특이사항 입력"
							value="<%=aniBbsDto.getDescripttion() %>" readonly="readonly" style="background-color: #fff">
						</div>
					</div>

					<br>
					<div class="row">
						<div class="input-group-prepend">
							<span class="input-group-text" style="align-content: center;">내용</span>
							<textarea name="content" id="summernote1"><%=aniBbsDto.getContent() %></textarea>
						</div>
					</div>

					<br>
					<div class="row">
						<input type="submit" class="offset-md-10 btn btn-outline-secondary" style="width: 90px; background-color: #28A745; color: #fff" value="수정">
					</div>
				</div>
			</div>
		</div>
	</form>


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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>
	
<script type="text/javascript">
$(document).ready(function() {
	$('.form2').hide();
	
    $('#summernote1').summernote({
    		width: 1045,
            height: 300,                 // set editor height
            minHeight: null,             // set minimum height of editor
            maxHeight: null,             // set maximum height of editor
            focus: true                  // set focus to editable area after initializing summernote
    });   
    
});

$("#btnBack").click(function () {
    location.href="AnimalBbsController?command=animlist";

});

</script>
	
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

  </body>
</html>
