<%@page import="dto.User"%>
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

	<form action="AnimalBbsController" method="post">
		<input type="hidden" name="command" value="list">
		<div class="album py-5 bg-light">
			<div class="container">

				<div class="row" style="margin:0 auto;width:900px;">
					<h4 style="text-decoration: underline;"
						class="offset-md-5" >댕댕이의 보호동물</h4>
				</div>

				<br>
				<div class="row">
					<div>
						<span style="font-size: medium"> <%=aniBbsDto.getLocation()%>&nbsp;&nbsp;
							<%=aniBbsDto.getTitle()%>
						</span>
					</div>
				</div>

				<div class="row">
					<span style="font-size: x-small"> <%=aniBbsDto.getType()%>
						&nbsp;&nbsp;&nbsp; <%=aniBbsDto.getReg_date() %>
					</span>&nbsp;&nbsp; <span style="font-size: x-small"> 조회수 <%=aniBbsDto.getReadcount()%>
					</span>
					<a href="AnimalBbsController?command=animlist"
					class="offset-md-9 btn btn-outline-secondary" style="background-color: #28A745; color: #fff">list</a>
				</div>
				<hr>

				<div class="row" style="margin:0 auto;width:900px;">
					<h4 class="offset-md-5">보호동물정보</h4>
				</div>

				<div class="row">
					<table align="center" border="0" cellpadding="0" cellspacing="0"
						class="__se_tbl"
						style="border-width: 1px 1px 0px 0px; text-align: center; border-top-color: rgb(204, 204, 204); border-right-color: rgb(204, 204, 204); border-top-style: solid; border-right-style: solid;">
						<tbody>
							<tr>

								<td
									style="border-width: 0px 0px 1px 1px; width: 167px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(99, 99, 99);">
									<div style="text-align: center;">
										<span
											style="color: rgb(255, 255, 255); font-family: 나눔고딕, NanumGothic; font-size: 10pt;">&nbsp;묘종/견종</span>
									</div>
								</td>
								<td
									style="border-width: 0px 0px 1px 1px; width: 298px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(255, 255, 255);">
									<div style="text-align: center;">
										<span
											style="color: rgb(0, 0, 0); font-family: 나눔고딕, NanumGothic; font-size: 10pt;">&nbsp;<%=aniBbsDto.getKinds() %></span>
									</div>
								</td>
								<td
									style="border-width: 0px 0px 1px 1px; width: 155px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(99, 99, 99);">
									<div style="text-align: center;">
										<span
											style="color: rgb(255, 255, 255); font-family: 나눔고딕, NanumGothic; font-size: 10pt;">나이&nbsp;</span>
									</div>
								</td>
								<td
									style="border-width: 0px 0px 1px 1px; width: 311px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(255, 255, 255);"><div
										style="text-align: center;">
										<span
											style="color: rgb(0, 0, 0); font-family: 나눔고딕, NanumGothic; font-size: 10pt;"><%=aniBbsDto.getAge() %>&nbsp;</span>
									</div></td>
							</tr>
							<tr>
								<td
									style="border-width: 0px 0px 1px 1px; width: 167px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(99, 99, 99);"><div
										style="text-align: center;">
										<span
											style="color: rgb(255, 255, 255); font-family: 나눔고딕, NanumGothic; font-size: 10pt;">&nbsp;성별</span>
									</div></td>
								<td
									style="border-width: 0px 0px 1px 1px; width: 298px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(255, 255, 255);"><div
										style="text-align: center;">
										<span
											style="color: rgb(0, 0, 0); font-family: 나눔고딕, NanumGothic; font-size: 10pt;">&nbsp;<%=g %></span>
									</div></td>
								<td
									style="border-width: 0px 0px 1px 1px; width: 155px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(99, 99, 99);"><div
										style="text-align: center;">
										<span
											style="color: rgb(255, 255, 255); font-family: 나눔고딕, NanumGothic; font-size: 10pt;">분류&nbsp;</span>
									</div></td>
								<td
									style="border-width: 0px 0px 1px 1px; width: 311px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(255, 255, 255);"><div
										style="text-align: center;">
										<span
											style="color: rgb(0, 0, 0); font-family: 나눔고딕, NanumGothic; font-size: 10pt;"><%=aniBbsDto.getType() %>&nbsp;</span>
									</div></td>
							</tr>
							<tr>
								<td
									style="border-width: 0px 0px 1px 1px; width: 167px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(99, 99, 99);"><div
										style="text-align: center;">
										<span
											style="color: rgb(255, 255, 255); font-family: 나눔고딕, NanumGothic; font-size: 10pt;">&nbsp;접종유무</span>
									</div></td>
								<td
									style="border-width: 0px 0px 1px 1px; width: 298px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(255, 255, 255);"><div
										style="text-align: center;">
										<span
											style="color: rgb(0, 0, 0); font-family: 나눔고딕, NanumGothic; font-size: 10pt;">&nbsp;<%=m %></span>
									</div></td>
								<td
									style="border-width: 0px 0px 1px 1px; width: 155px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(99, 99, 99);"><div
										style="text-align: center;">
										<span
											style="color: rgb(255, 255, 255); font-family: 나눔고딕, NanumGothic; font-size: 10pt;">&nbsp;중성화</span>
									</div></td>
								<td
									style="border-width: 0px 0px 1px 1px; width: 311px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(255, 255, 255);"><div
										style="text-align: center;">
										<span
											style="color: rgb(0, 0, 0); font-family: 나눔고딕, NanumGothic; font-size: 10pt;"><%=n %>&nbsp;
										</span>
									</div></td>
							</tr>
							<tr>
								<td
									style="border-width: 0px 0px 1px 1px; width: 167px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(99, 99, 99);"><div
										style="text-align: center;">
										<span
											style="color: rgb(255, 255, 255); font-family: 나눔고딕, NanumGothic; font-size: 10pt;">&nbsp;이름</span>
									</div></td>
								<td
									style="border-width: 0px 0px 1px 1px; width: 298px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(255, 255, 255);"><div
										style="text-align: center;">
										<span
											style="color: rgb(0, 0, 0); font-family: 나눔고딕, NanumGothic; font-size: 10pt;">&nbsp;<%=aniBbsDto.getName() %></span>
									</div></td>
								<td
									style="border-width: 0px 0px 1px 1px; width: 155px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(99, 99, 99);"><div
										style="text-align: center;">
										<span
											style="color: rgb(255, 255, 255); font-family: 나눔고딕, NanumGothic; font-size: 10pt;">&nbsp;특이사항</span>
									</div></td>
								<td
									style="border-width: 0px 0px 1px 1px; width: 311px; height: 18px; border-bottom-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-style: solid; border-left-style: solid; background-color: rgb(255, 255, 255);"><div
										style="text-align: center;">
										<span
											style="color: rgb(0, 0, 0); font-family: 나눔고딕, NanumGothic; font-size: 10pt;"><%=aniBbsDto.getDescripttion() %>&nbsp;</span>
									</div></td>
							</tr>
						</tbody>
					</table>
				</div>

				<br>
				
				<div class="row" style="border-left: 1px solid; border-right: 1px solid; border-top: 1px solid; border-bottom: 1px solid;
					height: 800px; margin:0 auto;width:900px;">
					<span>
						<%=aniBbsDto.getContent() %>
					</span>
				</div>


				<%
					String sid = ((User)session.getAttribute("current_user")).getEmail();
				%>

				<br>
				<%if(aniBbsDto.getUser_email().equals(sid)){
					%>
					<div class="row">
						<a href="AnimalBbsController?command=update&seq=<%=aniBbsDto.getSeq() %>" class="offset-md-9 btn btn-outline-secondary"
						style="background-color: #28A745; color: #fff">수정</a>
						&nbsp;&nbsp;
						<a href="AnimalBbsController?command=delete&seq=<%=aniBbsDto.getSeq() %>"
						class="btn btn-outline-secondary">삭제</a>
					</div>
					<%
				}else{
					System.out.println("f");
				}
				%>
				
				
				
				
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
